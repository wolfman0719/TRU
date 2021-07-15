/// This service accepts input from the CSP portal.
Class TRU.Service.CSP Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Method OnProcessInput(pCSPRequest As %CSP.Request, pOutput As TRU.Msg.OrderConfirmation) As %Status
{
	Set $ZT="Trap",tSC=$$$OK
	Do {
		// create a product order message
		Set tOrder = ##class(TRU.Msg.ProductOrder).%New()
		Set tOrder.Code = pCSPRequest.Get("Code")
		Set tOrder.Quantity = pCSPRequest.Get("Quantity")
		Set tOrder.Name = pCSPRequest.Get("Name")
		Set tOrder.City = pCSPRequest.Get("City")
		Set tOrder.ShipBy = pCSPRequest.Get("ShipBy")

		// send request to BP
		Set tSC = ..SendRequestSync("Product Order",tOrder,.pOutput) Quit:$$$ISERR(tSC)
		Quit
	} while (0)
Exit
	Quit tSC
Trap
	Set $ZT="",tSC=$$$EnsSystemError
	Goto Exit
}

}
