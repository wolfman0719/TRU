/// Shippment tracking message
Class TRU.Msg.TrackingInfo Extends Ens.Response [ ClassType = persistent, ProcedureBlock ]
{

Property ShippingCompany As %String(TRUNCATE = 1);

Property TrackingId As %String(TRUNCATE = 1);

Property OrderId As %String(TRUNCATE = 1);

Storage Default
{
<Data name="TrackingInfoDefaultData">
<Subscript>"TrackingInfo"</Subscript>
<Value name="1">
<Value>Carrier</Value>
</Value>
<Value name="2">
<Value>OrderNumber</Value>
</Value>
<Value name="3">
<Value>TrackingNumber</Value>
</Value>
<Value name="4">
<Value>OrderId</Value>
</Value>
<Value name="5">
<Value>ShippingCompany</Value>
</Value>
<Value name="6">
<Value>TrackingId</Value>
</Value>
</Data>
<DefaultData>TrackingInfoDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
