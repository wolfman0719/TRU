/// Reponse from Shipping system
Class TRU.Msg.ShippingResponse Extends Ens.Response [ ClassType = persistent, ProcedureBlock ]
{

Property Carrier As %String(TRUNCATE = 1);

Property TrackingNumber As %String(TRUNCATE = 1);

Property OrderNumber As %String(TRUNCATE = 1);

Storage Default
{
<Data name="ShippingResponseDefaultData">
<Subscript>"ShippingResponse"</Subscript>
<Value name="1">
<Value>Carrier</Value>
</Value>
<Value name="2">
<Value>OrderNumber</Value>
</Value>
<Value name="3">
<Value>TrackingNumber</Value>
</Value>
</Data>
<DefaultData>ShippingResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
