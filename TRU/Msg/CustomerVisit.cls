/// Inform CRM system of Customer visit
Class TRU.Msg.CustomerVisit Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

/// Customer name
Property Name As %String(TRUNCATE = 1);

Storage Default
{
<Data name="CustomerVisitDefaultData">
<Subscript>"CustomerVisit"</Subscript>
<Value name="1">
<Value>Name</Value>
</Value>
</Data>
<DefaultData>CustomerVisitDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
