/// Reponse from Inventory System
Class TRU.Msg.InventoryOrderResponse Extends Ens.Response [ ClassType = persistent, ProcedureBlock ]
{

/// True if the order was placed
Property OrderPlaced As %Boolean;

/// ID of Sales Record
Property SalesId As %String(TRUNCATE = 1);

Storage Default
{
<Data name="InventoryOrderResponseDefaultData">
<Subscript>"InventoryOrderResponse"</Subscript>
<Value name="1">
<Value>OrderPlaced</Value>
</Value>
<Value name="2">
<Value>SaleId</Value>
</Value>
<Value name="3">
<Value>SalesId</Value>
</Value>
</Data>
<DefaultData>InventoryOrderResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
