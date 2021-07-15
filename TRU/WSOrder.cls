/// This is a request to purchase a product via a WebService
Class TRU.WSOrder Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

/// Customer Name
Property Name As %String(TRUNCATE = 1);

/// Customer's city
Property City As %String(TRUNCATE = 1);

/// Product Code
Property Code As %String(TRUNCATE = 1);

/// Number of products ordered
Property Quantity As %Integer [ InitialExpression = 1 ];

/// How to ship: air or ground
Property ShipBy As %String(TRUNCATE = 1) [ InitialExpression = "ground" ];

Storage Default
{
<Data name="WSOrderDefaultData">
<Subscript>"WSOrder"</Subscript>
<Value name="1">
<Value>City</Value>
</Value>
<Value name="2">
<Value>Code</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>Quantity</Value>
</Value>
<Value name="5">
<Value>ShipBy</Value>
</Value>
</Data>
<DefaultData>WSOrderDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
