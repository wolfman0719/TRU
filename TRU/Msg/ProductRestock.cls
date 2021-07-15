/// Request to restock inventory.
Class TRU.Msg.ProductRestock Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property Code As %String(TRUNCATE = 1);

Property Quantity As %Integer;

Storage Default
{
<Data name="ProductRestockDefaultData">
<Subscript>"ProductRestock"</Subscript>
<Value name="1">
<Value>Code</Value>
</Value>
<Value name="2">
<Value>Quantity</Value>
</Value>
</Data>
<DefaultData>ProductRestockDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
