/// TRU.WebService
Class TRU.WebService Extends %SOAP.WebService [ ClassType = "", ProcedureBlock ]
{

/// Name of the WebService.
Parameter SERVICENAME = "ThingsRUs Service";

/// TODO: change this to actual network address.
/// URL for invoking the WebService.
Parameter LOCATION = "http://localhost:1972/csp/test";

/// SOAP Namespace for the WebService
Parameter NAMESPACE = "http://thingsrus.org";

/// ProductOrder
ClassMethod ProductOrder(pOrder As TRU.WSOrder) As %String [ WebMethod ]
{
	Set tSC = $$$OK
	Set tMsg = "OK"

	Do {
		Set tSC = ##class(Ens.Director).CreateBusinessService("Order via SOAP",.tService)
		If ($$$ISERR(tSC)) {
			Set tMsg = "Service Not Running"
			Quit
		}
		
		Set tSC = tService.ProcessInput(pOrder,.obj)
		If ($$$ISERR(tSC)) {
			Set tMsg = "Process Input Failure"
			Quit
		}
	} While(0)

	Quit tMsg
}

/// Local test method
ClassMethod Test(pCount As %Integer = 1, pWebMode As %Boolean = 0, pDelayFlag As %Boolean = 1)
{
	Set tOrder = ##class(TRU.WSOrder).%New()
	Set tOrder.Name = "Joe"
	Set tOrder.City = "Cambridge"
	Set tOrder.Quantity = 4 + $r(3)
	
	// tMax is the total number of products
	&SQL( select count(*) into :tMax 
			from TRU.Product
		)
	For i = 1:1:pCount {
		// mix up order
		//Set tOrder.Code = "Q000" _ ($R(5) + 1)
		Set tOrder.Code = "Q"_$e(10000+($R(tMax) + 1),2,99) 

		Set tMsg = ..ProductOrder(tOrder)
		If (pWebMode) {
			Write "."
			Write:(i#25)=0 !
			Do %response.Flush()
		}
		Else {
			Write i,?10,tMsg,?40,tOrder.Code,!
		}
		if pDelayFlag,'(i#5) h .25
	}
	
	Write !,"Test completed",!
}

}
