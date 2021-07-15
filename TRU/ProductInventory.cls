/// This class keeps track of product inventory.
Class TRU.ProductInventory Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Index Product On Product [ Unique ];

/// Product
Property Product As Product;

/// Number of items in stock 
Property StockLevel As %Integer [ InitialExpression = 10 ];

/// Reorder Level
Property ReorderLevel As %Integer [ InitialExpression = 25 ];

/// For the given product code, return number in stock
/// and reorder level
ClassMethod GetLevel(pCode As %String, Output pStock As %Integer, Output pReorder) As %Status
{
	Set pStock = 0
	Set pReorder = 0
	
	&sql(SELECT StockLevel, ReorderLevel
			INTO :pStock, :pReorder
			FROM ProductInventory
			WHERE Product->Code = :pCode)

	Quit $$$OK
}

/// Adjust inventory level (after sale (minus) or reorder (positive))
/// For sales, returns if item is in stock
ClassMethod AdjustInventory(pCode As %String, pNum As %Integer, Output pInStock As %Boolean) As %Status
{
	Set tSC = $$$OK
	Set pInStock = 1
	
	// Find inventory record,
	// if not present, create it
	Set tID = ""
	&sql(SELECT %ID INTO :tID
			FROM ProductInventory
			WHERE Product->Code = :pCode)

	Set tInv = ..%OpenId(tID)
	If ('$IsObject(tInv)) {
		Set tProd = ##class(Product).FindByCode(pCode)

		// create new item
		Set tInv = ..%New()
		Set tInv.Product = tProd
	}

	If (pNum < 0) {
		// sale: see if in stock
		If (-pNum < tInv.StockLevel) {
			Set pInStock = 1
		}
		Else {
			Set pInStock = 0
			Set pNum = 0
		}
	}

	// adjust inventory
	Set tInv.StockLevel = tInv.StockLevel + pNum

	// update
	Set tSC = tInv.%Save()
	Quit tSC
}

Storage Default
{
<Data name="ProductInventoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Product</Value>
</Value>
<Value name="3">
<Value>ReorderLevel</Value>
</Value>
<Value name="4">
<Value>StockLevel</Value>
</Value>
</Data>
<DataLocation>^TRU.ProductInventoryD</DataLocation>
<DefaultData>ProductInventoryDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^TRU.ProductInventoryD</IdLocation>
<IndexLocation>^TRU.ProductInventoryI</IndexLocation>
<StreamLocation>^TRU.ProductInventoryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
