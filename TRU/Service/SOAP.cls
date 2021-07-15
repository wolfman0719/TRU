/// This service accepts input from the SOAP interface.
Class TRU.Service.SOAP Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Method OnProcessInput(pRequest As TRU.WSOrder, pOutput As Ens.Response) As %Status
{
	Set $ZT="Trap",tSC=$$$OK
	Do {
		// create a product order message
		Set tOrder = ##class(TRU.Msg.ProductOrder).%New()
		Set tOrder.Code = pRequest.Code
		Set tOrder.Quantity = pRequest.Quantity
		Set tOrder.Name = pRequest.Name
		Set tOrder.City = pRequest.City
		Set tOrder.ShipBy = pRequest.ShipBy

		// send request to BP async
		Set tSC = ..SendRequestAsync("Product Order",tOrder) Quit:$$$ISERR(tSC)
		Quit
	} while (0)
Exit
	Quit tSC
Trap
	Set $ZT="",tSC=$$$EnsSystemError
	Goto Exit
}

}
