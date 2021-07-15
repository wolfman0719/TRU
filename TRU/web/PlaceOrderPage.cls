/// Created using the page template: Default
Class TRU.web.PlaceOrderPage Extends TRU.web.EmptyPage
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "TRU.web.TRUApp";

/// Displayed name of this page.
Parameter PAGENAME = "PlaceOrderPage";

/// Domain used for localization.
Parameter DOMAIN = "TRUDEMO";

/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">

input {
	font-family: Arial;
	color: blue;
}

div.description {
	font-size: 1.6em;
	color: red;
	text-align: center;
}

</style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="">
<hgroup >
<spacer width="100"/>
<vgroup>
<spacer height="50"/>
<form id="form">
<text id="txtName" name="txtName" label="名:"/>
<text id="txtCity" name="txtCity" label="都市:"/>
<dataListBox id="listProduct" name="listProduct" label="商品:" queryClass="TRU.Product" queryName="Enumerate"
onchange="zenPage.selectProduct(zenThis.getValue());" selectedIndex="1"/>
<text id="txtPrice" name="txtPrice" label="単価:" disabled="true" />
<text id="txtQuantity" name="txtQuantity" label="数量:" value="1"/>
<radioSet id="radioShipment" name="radioShipment" valueList="ground,air" value="ground" displayList="陸送,パラシュート" label="出荷方法:"/>
<spacer height="5" />
<submit id="btnOrder" action="save" caption="今すぐ注文!" nextPage="TRU.web.SubmitPage.cls"/>
</form>
</vgroup>
<spacer width="100"/>
<vgroup align="center">
<image id="image" height="270" hidden="true"/>
<label id="labelDescription" />
</vgroup>
</hgroup>
</page>
}

Method selectProduct(id As %Integer) [ ZenMethod ]
{
	if id = "" set id = 1
	set product = ##class(TRU.Product).%OpenId(id)
	//set txtCode = %page.%GetComponentById("txtCode")	
	//set txtCode.value = product.Code
	set txtPrice = %page.%GetComponentById("txtPrice")	
	set txtPrice.value = product.UnitPrice
	set image = %page.%GetComponentById("image")	
	set image.hidden = "false"
	set image.src = product.ImageFile
	set label = %page.%GetComponentById("labelDescription")	
	set label.label = product.Description
}

/// This callback is called when a form on this page is submitted.
/// <var>pSubmit</var> is a <class>%ZEN.Submit</class> object
/// containing details of the form submit.<br>
/// Subclasses override this method.
ClassMethod %OnSubmit(pSubmit As %ZEN.Submit) As %Status
{
	set product = ##class(TRU.Product).%OpenId(pSubmit.%GetValue("listProduct"))

	If (product="") {
			Do pSubmit.%SetError("listProduct","商品を選択してください")
	} else {
		set %session.Data("City",1) = pSubmit.%GetValue("txtCity")
		set %session.Data("Code",1) = product.Code
		set %session.Data("Quantity",1) = pSubmit.%GetValue("txtQuantity")
		set %session.Data("Name",1) = pSubmit.%GetValue("txtName")
		set %session.Data("ShipBy",1) = pSubmit.%GetValue("radioShipment")
	}


	Quit $$$OK
}

}
