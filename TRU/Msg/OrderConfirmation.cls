/// This is the confirmation for a Product order.
Class TRU.Msg.OrderConfirmation Extends Ens.Response [ ClassType = persistent, ProcedureBlock ]
{

/// Product was ordered
Property Ordered As %Boolean [ InitialExpression = 1 ];

/// Message to user
Property Message As %String(TRUNCATE = 1);

/// Customer Name
Property Name As %String(TRUNCATE = 1);

/// Customer's city
Property City As %String(TRUNCATE = 1);

/// Name of Ordered product
Property Product As %String(TRUNCATE = 1);

/// UnitPrice of Ordered product
Property UnitPrice As %Numeric;

/// Percent discount
Property Discount As %Numeric(CAPTION = "Discount %");

/// Number of products ordered
Property Quantity As %Integer [ InitialExpression = 0 ];

/// How this production will be shipped
Property ShippingMethod As %String(TRUNCATE = 1);

/// Shipping cost for the order
Property SubTotal As %Numeric [ Calculated ];

/// Shipping cost for the order
Property Shipping As %Numeric [ InitialExpression = 0 ];

/// Total price for the order
Property TotalPrice As %Numeric [ Calculated ];

/// Order Number
Property OrderNumber As %String(TRUNCATE = 1);

/// Shipping Company
Property ShippingCompany As %String(TRUNCATE = 1);

/// Tracking Number
Property TrackingNumber As %String(TRUNCATE = 1);

Method TotalPriceGet() As %Numeric
{
	Quit ..SubTotal + ..Shipping
}

Method SubTotalGet() As %Numeric
{
  Quit (..UnitPrice * ..Quantity) * (1 - (..Discount/100))
}

Storage Default
{
<Data name="OrderConfirmationDefaultData">
<Subscript>"OrderConfirmation"</Subscript>
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
<Value>Shipping</Value>
</Value>
<Value name="6">
<Value>ShippingMethod</Value>
</Value>
<Value name="7">
<Value>UnitPrice</Value>
</Value>
<Value name="8">
<Value>City</Value>
</Value>
<Value name="9">
<Value>Name</Value>
</Value>
<Value name="10">
<Value>Product</Value>
</Value>
<Value name="11">
<Value>Message</Value>
</Value>
<Value name="12">
<Value>Ordered</Value>
</Value>
<Value name="13">
<Value>Discount</Value>
</Value>
<Value name="14">
<Value>OrderNumber</Value>
</Value>
<Value name="15">
<Value>ShippingCompany</Value>
</Value>
<Value name="16">
<Value>TrackingNumber</Value>
</Value>
</Data>
<DefaultData>OrderConfirmationDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
