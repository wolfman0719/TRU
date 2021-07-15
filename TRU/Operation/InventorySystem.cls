/// Interface to existing Inventory System
Class TRU.Operation.InventorySystem Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

//Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

XData MessageMap
{
<MapItems>
	<MapItem MessageType="TRU.Msg.ProductOrder"> 
		<Method>ProductSale</Method>
	</MapItem>
	<MapItem MessageType="TRU.Msg.ProductRestock"> 
		<Method>ProductRestock</Method>
	</MapItem>
</MapItems>
}

/// Record a product sale with the Inventory System
Method ProductSale(pRequest As TRU.Msg.ProductOrder, Output pResponse As TRU.Msg.InventoryOrderResponse) As %Status [ Language = basic ]
{
	' take product out of Inventory table
	tSC = "TRU.ProductInventory".AdjustInventory(pRequest.Product.Code, -pRequest.Quantity, tInStock)

	pResponse = New TRU.Msg.InventoryOrderResponse

	If (tInStock) Then
		' insert a product order into ProductOrder table
		Set tSC = "TRU.ProductSale".RecordSale(pRequest, tID)
		Set pResponse.SalesId = tID
		Set pResponse.OrderPlaced = 1
	Else 
		Set pResponse.OrderPlaced = 0
	
	End If

	Return system.Status.OK()
}

/// Restock a product
Method ProductRestock(pRequest As TRU.Msg.ProductRestock, Output pResponse As Ens.StringResponse) As %Status [ Language = basic ]
{
	' add to Inventory table
	tSC = "TRU.ProductInventory".AdjustInventory(pRequest.Code, pRequest.Quantity, tInStock)

	pResponse = New Ens.StringResponse("Product Restocked")
	Return system.Status.OK()
}

}
