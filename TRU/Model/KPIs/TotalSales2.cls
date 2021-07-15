Include Ensemble

Class TRU.Model.KPIs.TotalSales2 Extends %DeepSee.KPI
{

Parameter DOMAIN = "TRU";

XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi name="TotalSales2" sourceType="manual">
<property name="TotalSales" columnNo="1"/>
</kpi>
}

Method %OnExecute() As %Status
{
    Set ..%seriesCount=$order($$$EnsMetrics("CEO Metrics2",1,"TotalSales",""),-1)
    for i=1:1:..%seriesCount {
      Set ..%seriesNames(i)=""
      Set ..%data(i,"TotalSales")=$$$EnsMetrics("CEO Metrics2",1,"TotalSales",i)
    }
    Quit $$$OK
}

}
