/// Interface to existing CRM System
Class TRU.Operation.CRMSystem Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

//Parameter ADAPTER = "EnsLib.Siebel.HTTPOutboundAdapter";

Parameter INVOCATION = "Queue";

XData MessageMap
{
<MapItems>
	<MapItem MessageType="TRU.Msg.CustomerVisit"> 
		<Method>CustomerVisit</Method>
	</MapItem>
</MapItems>
}

/// Record customer visit
Method CustomerVisit(pRequest As TRU.Msg.CustomerVisit, Output pResponse As TRU.Msg.CustomerVisitResponse) As %Status [ Language = basic ]
{
	' In real case, this would call out to the CRM system
	If ((pRequest.Name = "Joe") Or (pRequest.Name = "Paul") Or(pRequest.Name = "Trevor")) then
		tExisting = 1
	Else
		tExisting = 0
	End If 
	
	pResponse = New TRU.Msg.CustomerVisitResponse
	pResponse.ExistingCustomer = tExisting
	Return system.Status.OK()
}

}
