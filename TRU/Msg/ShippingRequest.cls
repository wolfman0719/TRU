/// Request for Shipment
Class TRU.Msg.ShippingRequest Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property OrderNumber As %String(TRUNCATE = 1);

Property ShippingMethod As %String(TRUNCATE = 1);

Storage Default
{
<Data name="ShippingRequestDefaultData">
<Subscript>"ShippingRequest"</Subscript>
<Value name="1">
<Value>OrderNumber</Value>
</Value>
<Value name="2">
<Value>ShippingMethod</Value>
</Value>
</Data>
<DefaultData>ShippingRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
