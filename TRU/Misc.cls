Include Ensemble

Class TRU.Misc Extends %RegisteredObject [ ClassType = "", ProcedureBlock ]
{

ClassMethod InitializeDemoData()
{
	do ##class(TRU.Product).BuildData(0)
	do ##class(TRU.WebService).Test(400)
}

ClassMethod GetProductionName() As %String
{
	quit "TRU.Production.Main"
}

ClassMethod ProductionStatus(ByRef DemoProduction As %String) As %Boolean
{
	set:$get(DemoProduction)="" DemoProduction=..GetProductionName()
	set st = ##class(Ens.Director).GetProductionStatus(.prod,.stat)
	if (prod=DemoProduction) && (stat = "Running") {
		set ProductionRunning = 1
	} else {
		set ProductionRunning = 0
	}
	quit ProductionRunning
}

ClassMethod InitWorkflow(user As %String = "_SYSTEM") As %Status
{
	Set $ZT = "Trap"
	Set tSC = $$$OK
	
	set:user="" user="_SYSTEM"
	if user="_SYSTEM" {
		set userDesc="System Administrator"
	} else {
		set userDesc=""
	}
	
	set role="Sales Management"
	
	do {
		// Create Workflow User  (if not already defined)
		if '(##class(EnsLib.Workflow.UserDefinition).%ExistsId(user))  {
			set tSC=##class(EnsLib.Workflow.UserDefinition).CreateUser(user,userDesc)
			If $$$ISERR(tSC) Quit
		}
	
		// Create Workflow Role (if not already defined)
		if '(##class(EnsLib.Workflow.RoleDefinition).%ExistsId(role))  {
			set tSC=##class(EnsLib.Workflow.RoleDefinition).CreateRole(role)
			If $$$ISERR(tSC) Quit
		}
		
		// Add User to Role (if not already a member)
		set roleObj=##class(EnsLib.Workflow.RoleDefinition).%OpenId(role)
		if '$isobject(roleObj) set tSC=0 quit
		set IsMember=0
		set rs=roleObj.GetUserSet()
		while rs.Next() {
			if rs.Get("UserName")=user set IsMember=1
		}
		if 'IsMember {
			// 
			//set tSC=##class(EnsLib.Workflow.RoleDefinition).AddUserToRole(role,user)
			// 
			set ^EnsLib.W.RoleMembershipD(role,user)=$LB("","3","")
		}
	} while (0)

Done
	Quit tSC

Trap
	Set $ZT="",tSC=0
	Goto Done
}

ClassMethod CreateDemoXML(FileName As %String)
{

	if $g(FileName)="" set FileName="C:\temp\test\"_"TRU_Demo.xml"

	// Get list of all classes in the TRU package
	set x=$system.OBJ.GetPackageList(.classList,"TRU")
	set class=""
	for {
		set class=$order(classList(class))
		quit:class=""
		//skip generated classes (ending in .Context or .Threadn)
		set last=$p(class,".",$l(class,"."))
		if '((last="Context")||($e(last,1,6)="Thread")) {
			set list(class_".cls")=""
		}
	}
	
	//Rules
	set list("TRU.Process.OrderProduct.DetermineDiscount.rul")=""
	set list("TRU.Process.OrderProduct.CalculateShipping.rul")=""
	
	// CSP pages
	set list("/csp/"_$zu(5)_"/Things/ThingsRUsPortal.csp")=""
	set list("/csp/"_$zu(5)_"/Things/ThingsRUsSubmit.csp")=""
	set list("/csp/"_$zu(5)_"/Things/ThingsRUsWebServiceTest.csp")=""
	do $system.OBJ.Export(.list,FileName)
}

}
