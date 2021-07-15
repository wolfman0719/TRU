/// Test metric class
Class TRU.Service.MiscMetrics Extends Ens.BusinessMetric [ ClassType = "", ProcedureBlock ]
{

/// Total Expenses
Property TotalExpenses As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 50, UNITS = "$US");

/// Total Sales
Property TotalSales As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 50, UNITS = "$US");

/// Profit Margin
Property Profit As Ens.DataType.Metric(RANGELOWER = -100, RANGEUPPER = 100, UNITS = "$US");

/// Number of times metric has been calculated.
Property Counter As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 100000, UNITS = "Events");

/// Sales History
Property SalesHistory As Ens.DataType.Metric(AUTOHISTORY = 50, UNITS = "$US") [ MultiDimensional ];

Property ExpenseHistory As Ens.DataType.Metric(AUTOHISTORY = 50, UNITS = "$US") [ MultiDimensional ];

Property ProfitHistory As Ens.DataType.Metric(AUTOHISTORY = 50, UNITS = "$US") [ MultiDimensional ];

/// Calculate and update the set of metrics for this class
Method OnCalculateMetrics() As %Status
{
	// set the values of our metrics
	Set ..TotalSales = $R(15) + 5
	Set ..TotalExpenses = $R(15)+ 5
	Set ..Counter = ..Counter + 1
	
	If (..TotalSales < 0) {
		Set ..TotalSales = 0
	}

	If (..TotalExpenses < 0) {
		Set ..TotalExpenses = 0
	}

	Set ..Profit = ..TotalSales - ..TotalExpenses
		
	Set ..SalesHistory = ..TotalSales
	Set ..ExpenseHistory = ..TotalExpenses
	Set ..ProfitHistory = ..Profit

	
	$$$TRACE("OnCalculate() " _ $zdt($h,3))
	
	Quit $$$OK
}

}
