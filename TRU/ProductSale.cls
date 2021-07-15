Include Ensemble

/// This class keeps track of product sales.
Class TRU.ProductSale Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Index Product On Product [ Type = bitmap ];

Index Location On Location [ Type = bitmap ];

Index TimeOfSale On TimeOfSale;

/// Product
Property Product As Product;

/// Quantity
Property Quantity As %Integer;

/// Discount (percentage)
Property Discount As %Numeric [ InitialExpression = 0 ];

/// Amount (less shipping)
Property Amount As %Numeric;

/// Customer
Property Customer As %String(MAXLEN = 50, TRUNCATE = 1);

/// Location
Property Location As %String(MAXLEN = 50, TRUNCATE = 1);

/// The timestamp when this sale was made.
Property TimeOfSale As Ens.DataType.UTC [ InitialExpression = {$$$timeUTC} ];

/// Add a sales record
ClassMethod RecordSale(pOrder As TRU.Msg.ProductOrder, Output pID As %String) As %Status
{
	Set pID = ""
	Set tSale = ..%New()
	Set tSale.Customer = pOrder.Name
	Set tSale.Location = pOrder.City
	Set tSale.Product = pOrder.Product
	Set tSale.Discount = pOrder.Discount
	Set tSale.Quantity = pOrder.Quantity
	Set tSale.Amount = (pOrder.Quantity * pOrder.Product.UnitPrice) * (1 - (pOrder.Discount/100))

	Set tSC = tSale.%Save()
	If $$$ISERR(tSC) Quit tSC

	// return Sales Id
	Set pID = tSale.%Id()
	Quit $$$OK
}

Storage Default
{
<Data name="ProductSaleDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Amount</Value>
</Value>
<Value name="3">
<Value>Customer</Value>
</Value>
<Value name="4">
<Value>Location</Value>
</Value>
<Value name="5">
<Value>Product</Value>
</Value>
<Value name="6">
<Value>Quantity</Value>
</Value>
<Value name="7">
<Value>Discount</Value>
</Value>
<Value name="8">
<Value>TimeOfSale</Value>
</Value>
</Data>
<DataLocation>^TRU.ProductSaleD</DataLocation>
<DefaultData>ProductSaleDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^TRU.ProductSaleD</IdLocation>
<IndexLocation>^TRU.ProductSaleI</IndexLocation>
<StreamLocation>^TRU.ProductSaleS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
