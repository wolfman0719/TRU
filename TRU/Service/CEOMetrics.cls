/// CEO Business Metric class for Things-R-Us Corporate Portal.
Class TRU.Service.CEOMetrics Extends Ens.BusinessMetric [ ClassType = "", ProcedureBlock ]
{

Parameter SETTINGS = "ReorderAmount";

/// Number of units sold for all products.
Property TotalUnits As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 50000, UNITS = "units");

/// Total sales ($) for all products.
Property TotalSales As Ens.DataType.Metric(AUTOHISTORY = 60, RANGELOWER = 0, RANGEUPPER = 1000000, UNITS = "US$") [ MultiDimensional ];

/// Total sales transactions.
Property TotalTransactions As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 10000, UNITS = "transactions");

/// Amount of sales since last update.
Property RecentSales As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 10000, UNITS = "US$");

// Inventory Metrics

Property TotalCustomerOrders As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 50000, UNITS = "Orders");

Property ExistingCustomerOrders As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 50000, UNITS = "Orders");

Property ExistingCustomerOrdersPct As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 100, UNITS = "percentage");

Property NewCustomerOrders As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 50000, UNITS = "Orders");

Property NewCustomerOrdersPct As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 100, UNITS = "percentage");

// Sales Metrics

/// Amount of units to reorder
Property ReorderAmount As %Integer(MINVAL = 0) [ InitialExpression = 50 ];

// Number of units sold for current product.

Property ProductUnits As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 50000, UNITS = "units");

// Total sales ($) for current product.

Property ProductSales As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 500000, UNITS = "US$");

/// Number of units in stock for current product.
Property StockLevel As Ens.DataType.Metric(AUTOHISTORY = 60, RANGELOWER = 0, RANGEUPPER = 500, UNITS = "units") [ MultiDimensional ];

/// Number of units sold for current product since last update.
Property DeltaUnits As Ens.DataType.Metric(AUTOHISTORY = 60, RANGELOWER = 0, RANGEUPPER = 100, UNITS = "units") [ MultiDimensional ];

/// Set true while we are reordering.
Property Reorder As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 1);

/// Number of times this item has been reordered.
Property ReorderCount As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 1000);

/// Calculate metrics
Method OnCalculateMetrics() As %Status
{
	// find total sales for products
	&sql(SELECT COUNT(*), SUM(Quantity),SUM(Amount) 
			INTO :tTX, :tUnits, :tSales
			FROM TRU.ProductSale
	)	
	Set tLast = +$G(..TotalSales)

	Set ..TotalUnits = tUnits
	Set ..TotalSales = tSales
	Set ..TotalTransactions = tTX
	Set ..RecentSales = tSales - tLast

	/*
	Set ..TotalUnits = 6452
	Set ..TotalSales = 125350*(2+$r(5))
	Set ..TotalTransactions = 5142
	Set ..RecentSales = 15000
	*/
	
	//Inventory Metric Calculations
	set ..TotalCustomerOrders=7019
	set ..ExistingCustomerOrders=..TotalCustomerOrders*0.8
	set ..NewCustomerOrders=..TotalCustomerOrders*0.2
	set ..ExistingCustomerOrdersPct = ..ExistingCustomerOrders / ..TotalCustomerOrders * 100 \1
	set ..NewCustomerOrdersPct = ..NewCustomerOrders / ..TotalCustomerOrders * 100 \1

	//Sales Metric Calculations
	Set tName = ..%Instance
	
	// find product ID
	&sql(SELECT %ID,Code INTO :tProdId, :tCode
			FROM TRU.Product
			WHERE ShortName = :tName)

	// find last calculated value for UnitsSold
	Set tLast = +..ProductUnits
	
	// find total sales for product
	&sql(SELECT SUM(Quantity),SUM(Amount) INTO :tUnits, :tSales
			FROM TRU.ProductSale
			WHERE Product = :tProdId)
	
	Set ..ProductUnits = tUnits
	Set ..ProductSales = tSales

	// find new units sold
	Set ..DeltaUnits = tUnits - tLast
	
	// find units in stock
	Do ##class(TRU.ProductInventory).GetLevel(tCode, .tStock, .tReorder)

	Set ..StockLevel = tStock
	
	If (tStock <= tReorder) {
		// Send request to restock

		// create a product restock message
		Set tRestock = ##class(TRU.Msg.ProductRestock).%New()
		Set tRestock.Code = tCode
		Set tRestock.Quantity = ..ReorderAmount

		// send request to InventorySystem
		Set tSC = ..SendRequestAsync("Inventory System",tRestock)
		Set ..Reorder = 1
		Set ..ReorderCount = 1 + ..ReorderCount
	}
	Else {
		Set ..Reorder = 0
	}


	/*
	do ..SendRequestAsync("CRM System")
	do ..SendRequestAsync("Inventory System")
	do ..SendRequestAsync("Shipping System")
	*/

	Quit $$$OK
}

Query MetricInstances() As %SQLQuery
{
	SELECT ShortName FROM TRU.Product
}

}
