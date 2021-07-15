/// Interface to existing CRM System
Class TRU.Operation.ShippingSystem Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

//Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Parameter INVOCATION = "Queue";

XData MessageMap
{
<MapItems>
	<MapItem MessageType="TRU.Msg.ShippingRequest"> 
		<Method>ShipItems</Method>
	</MapItem>
</MapItems>
}

/// Record customer visit
Method ShipItems(pRequest As TRU.Msg.ShippingRequest, Output pResponse As TRU.Msg.ShippingResponse) As %Status [ Language = basic ]
{
	' In real case, this would call out to the CRM system
	If pRequest.ShippingMethod="air" then
		tCarrier = "FedEx"
	Else
		tCarrier = "UPS"
	End If 
	
	pResponse = New TRU.Msg.ShippingResponse
	pResponse.Carrier = tCarrier
	pResponse.OrderNumber = pRequest.OrderNumber
	pResponse.TrackingNumber = Me.GetTrackingNumber()
	Return system.Status.OK()
}

Method GetTrackingNumber() As %String
{
	quit $tr($zd($h,3),"-","")_"-"_$tr($ZH,".","-")
}

}
