Class TRU.Model.KPIs.TotalSales Extends %DeepSee.KPI
{

Parameter DOMAIN = "TRU";

XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi name="TotalSales" sourceType="sql">
<property name="TotalSales" columnNo="1"/>
</kpi>
}

/// This callback, if implemented, lets a subclass provide an SQL statement to fetch data for this KPI. 
Method %OnGetSQL(ByRef pSQL As %String) As %Status
{
  Set pSQL = "call TRU_Service.CustomResult()"
  Quit $$$OK
}

}
