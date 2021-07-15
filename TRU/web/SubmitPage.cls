/// Created using the page template: Default
Class TRU.web.SubmitPage Extends TRU.web.EmptyPage
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "TRU.web.TRUApp";

/// Displayed name of this page.
Parameter PAGENAME = "SubmitPage";

/// Domain used for localization.
Parameter DOMAIN = "TRUDEMO";

/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">
table.AutoFormTable {
	border: 1px black solid;
	color: blue;
	background: white;
}

table.AutoFormTable td {
	font-size: 1.0em;
	padding: 2px;
	border: 1px gray solid;
	color: blue;
	padding-right: 4px;
	padding-left: 4px;
}

table.AutoFormTable td.label {
	font-size: 1.0em;
	padding: 2px;
	border: 1px gray solid;
	color: black;
	padding-right: 4px;
	padding-left: 4px;
}
</style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="">
<html id="html"></html>
</page>
}

/// This callback is called after the server-side page 
/// object and all of its children are created.<br>
/// Subclasses can override this to add, remove, or modify 
/// items within the page object model, or to provide values
/// for controls.
Method %OnAfterCreatePage() As %Status
{
	set %request.Data("Code",1) = %session.Data("Code",1)
	k %session.Data("Code",1)
	set %request.Data("Quantity",1) = %session.Data("Quantity",1)
	k %session.Data("Quantity",1)
	set %request.Data("Name",1) = %session.Data("Name",1)
	k %session.Data("Name",1)
	set %request.Data("City",1) = %session.Data("City",1)
	k %session.Data("City",1)
	set %request.Data("ShipBy",1) = %session.Data("ShipBy",1)
	k %session.Data("ShipBy",1)

	set html = %page.%GetComponentById("html")
	
 	Set tSC=$$$OK
	Do {
		Set tSC = ##class(Ens.Director).CreateBusinessService("Order via Web Portal",.tService)
		If ($$$ISERR(tSC)) Quit

		Set tSC = tService.ProcessInput(%request,.confirmation)
		If ($$$ISERR(tSC)) Quit
		If $IsObject($G(confirmation)) {
			// draw details of order
			
			set html.content = "<div align=""center"">"
			
			
			// Product In Stock
			If (confirmation.Ordered)=1 {
				set html.content = html.content_"<br><div><b>"_confirmation.Message_"</b></div><br>"
				set html.content = html.content_"<div>注文詳細:</div>"
				set html.content = html.content_"<table class=""AutoFormTable"" border=""0"" cellspacing=""0"">"
				set html.content = html.content_"<tr><td class=""label"">注文番号</td>		<td>"_confirmation.OrderNumber_"</td></tr>"
				set html.content = html.content_"<tr><td class=""label"">会社名</td>		<td>"_confirmation.Name_"</td></tr>"
				set html.content = html.content_"<tr><td class=""label"">都市</td>		<td>"_confirmation.City_"</td></tr>"
				set html.content = html.content_"<tr><td class=""label"">商品</td>	<td>"_confirmation.Product_"</td></tr>"
				set html.content = html.content_"<tr><td class=""label"">出荷方法</td><td>"_confirmation.ShippingMethod_"</td></tr>"
				set html.content = html.content_"<tr><td class=""label"">出荷業者</td><td>"_confirmation.ShippingCompany_"</td></tr>"
				set html.content = html.content_"<tr><td class=""label"">トラッキング番号</td><td>"_confirmation.TrackingNumber_"</td></tr>"
				set html.content = html.content_"<tr><td class=""label"">数量</td>	<td align=""right"">"_confirmation.Quantity_"&nbsp;</td></tr>"
				set html.content = html.content_"<tr><td class=""label"">単価</td>	<td align=""right"">$"_$FN(confirmation.UnitPrice,",",2)_"&nbsp;</td></tr>"
				set html.content = html.content_"<tr><td class=""label"">割引</td>	<td align=""right"">"_$FN(confirmation.Discount,",",2)_"%</td></tr>"
				
				set html.content = html.content_"<tr><td class=""label"">小計</td>		<td align=""right"">$"_$FN(confirmation.SubTotal,",",2)_"&nbsp;</td></tr>"
				set html.content = html.content_"<tr><td class=""label"">運送料</td><td align=""right"">$"_$FN(confirmation.Shipping,",",2)_"&nbsp;</td></tr>"
				set html.content = html.content_"<tr><td class=""label""><b>合計</b></td>	<td align=""right""><b>$"_$FN(confirmation.TotalPrice,",",2)_"&nbsp;</b></td></tr>"

				set html.content = html.content_"</table>"
				set html.content = html.content_"</div>"
			}
			// Product Out of Stock 
			Else {
				set html.content = html.content_"<br><div>注文詳細:</div><br>"
				set html.content = html.content_"<table class=""AutoFormTable"" border=""0"" cellspacing=""0"">"
				set html.content = html.content_"<tr><td class=""label"">メッセージ</td>   <td><b>"_confirmation.Message_"</b></td></tr>"
				set html.content = html.content_"<tr><td class=""label"">ステータス</td>   <td><b>"_confirmation.StatusMessage_"</b></td></tr>"
				set html.content = html.content_"</table>"
				//	Do confirmation.DrawHTMLTable(confirmation)
				set html.content = html.content_"</div>"
			}	
		}
	} While (0)

	If ($$$ISERR(tSC)) {
		// Error: assume system is not running
		Write "ThingsRUsポータルは現在注文を受け付けておりません。<br>",!
		Write "後ほどお試し下さい!",!
		
		Write "<br><br><pre>"
		Do $system.Status.DisplayError(tSC)
		Write "</pre>"
	}	



	Quit $$$OK
}

}
