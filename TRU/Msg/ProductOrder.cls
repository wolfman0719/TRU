/// This is a request to purchase a product.
Class TRU.Msg.ProductOrder Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

/// Customer Name
Property Name As %String(TRUNCATE = 1);

/// Customer's city
Property City As %String(TRUNCATE = 1);

/// Product Code (set on initial request)
Property Code As %String(TRUNCATE = 1, XMLPROJECTION = "none") [ Transient ];

/// Reference to ordered Product 
Property Product As TRU.Product [ Required ];

/// Number of products ordered
Property Quantity As %Integer [ InitialExpression = 1 ];

/// Discount (percentage)
Property Discount As %Numeric [ InitialExpression = 0 ];

/// How to ship: air or ground
Property ShipBy As %String(TRUNCATE = 1) [ InitialExpression = "ground" ];

/// Pick up corresponding product whenever we set Code
Method CodeSet(%val) As %Status
{
	Set i%Code = %val

	// lookup product using code
	Set ..Product = ##class(TRU.Product).FindByCode(%val)
	Quit $$$OK
}

Storage Default
{
<Data name="ProductOrderDefaultData">
<Subscript>"ProductOrder"</Subscript>
<Value name="1">
<Value>CustomerCity</Value>
</Value>
<Value name="2">
<Value>CustomerName</Value>
</Value>
<Value name="3">
<Value>ProductCode</Value>
</Value>
<Value name="4">
<Value>Quantity</Value>
</Value>
<Value name="5">
<Value>City</Value>
</Value>
<Value name="6">
<Value>Name</Value>
</Value>
<Value name="7">
<Value>Product</Value>
</Value>
<Value name="8">
<Value>ShipBy</Value>
</Value>
<Value name="9">
<Value>Discount</Value>
</Value>
</Data>
<DefaultData>ProductOrderDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
