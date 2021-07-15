Class TRU.Service.CEOMetrics2 Extends Ens.BusinessMetric [ ProcedureBlock ]
{

Parameter SETTINGS = "ReorderAmount";

/// Total sales ($) for all products.
Property TotalSales As Ens.DataType.Metric(AUTOHISTORY = 60, RANGELOWER = 0, RANGEUPPER = 1000000, UNITS = "US$") [ MultiDimensional ];

Method OnCalculateMetrics() As %Status
{

	// find total sales for products
	&sql(SELECT SUM(Amount) 
			INTO :tSales
			FROM TRU.ProductSale
	)
	Set ..TotalSales = tSales	

	Quit $$$OK
}

}
