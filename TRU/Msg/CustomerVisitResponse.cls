/// Reponse from CRM system of Customer visit
Class TRU.Msg.CustomerVisitResponse Extends Ens.Response [ ClassType = persistent, ProcedureBlock ]
{

/// Is this an existing customer?
Property ExistingCustomer As %Boolean [ InitialExpression = 0 ];

Storage Default
{
<Data name="CustomerVisitResponseDefaultData">
<Subscript>"CustomerVisitResponse"</Subscript>
<Value name="1">
<Value>IsNew</Value>
</Value>
<Value name="2">
<Value>ExistingCustomer</Value>
</Value>
</Data>
<DefaultData>CustomerVisitResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
