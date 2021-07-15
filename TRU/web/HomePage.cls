/// Created using the page template: Default
Class TRU.web.HomePage Extends %ZEN.Component.page
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "TRU.web.TRUApp";

/// Displayed name of this page.
Parameter PAGENAME = "HomePage";

/// Domain used for localization.
Parameter DOMAIN = "TRUDEMO";

/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">
/* default styles */
body {
	background: #C0C0EE;
	font-family: verdana;
}

table.forecastTitle {
	color: black;
	background: #c5d6d6;
	width: 100%;
	padding: 0px;
	margin: 0px;
	border-bottom: 1px solid darkblue;
	font-size: 1.4em;
	font-family: verdana;
	text-align: center;
}

/* style for lookout menu */
#lookout {
	border: 1px solid darkblue;
	overflow: auto;
	background: white;
}

.lookoutTab {
	background: white;
	border-bottom: 1px solid darkblue;
}

.lookoutButton {
	color: #DEE0E5;
	background: #000040;
	background-image: url(/csp/broker/images/grad-blue-10x100.png);
	background-repeat: repeat-x;
	font-weight: bold;
	font-family: verdana;
	font-size: 1.0em;
	text-align: left;
	border: 1px solid black;
}

.lookoutButton:hover {
	color: #DEE0E5;
	background: #5050F0;
	background-image: url(/csp/broker/images/grad-red-10x30.png);
	background-repeat: repeat-x;
}

</style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="">
<DemoTitle id="title" title="ThingsRUs B2Bポータルへようこそ"/>
<hgroup>
<lookoutMenu id="lookout" expandable="false" 
	onexpand="zenPage.onlayoutHandler();" 
	oncontract="zenPage.onlayoutHandler();"
	remember="true" valign="top" width="300">
<tab caption="Menu" id="menuOrders">
<menuItem   caption="注文する" resource="TRU.Order.Place"
					onclick="zenPage.showInFrame('./TRU.web.PlaceOrderPage.cls');"
					image="/csp/broker/images/folder.gif"
					title="IRISを使って、注文する..."
					/>
<menuItem   caption="現時点の注文をリスト" resource="TRU.Order.View"
					onclick="zenPage.showInFrame('./TRU.web.ListOrdersPage.cls');"
					image="/csp/broker/images/datetext.gif"
					title="ThingsRUs従業員専用現注文リスト"
					/>

<menuItem   caption="製品別注文レポート" resource="TRU.Order.List"
					onclick="zenPage.showInFrame('./TRU.web.OrdersReport.cls');"
					image="/csp/broker/images/inspector.gif"
					title="ThingsRUs従業員専用Zenレポート"
					/>
<menuItem caption="ログアウト"
	     link="TRU.web.LoginPage.cls?LOGOUT=1"
	     image="/csp/broker/images/folder.gif"
	     />					
</tab>


</lookoutMenu>
<vgroup valign="top" width="100%">  
	<iframe id="iframe" name="iframe" src="./TRU.web.EmptyPage.cls" width="100%" frameBorder="false" height="500"/>
</vgroup>


</hgroup>
</page>
}

ClientMethod showInFrame(url) [ Language = javascript ]
{
	var frame = zenPage.getComponentById("iframe");
	frame.src = url;
	//frame.height= zenGetWindowHeight()-100;
	frame.refreshContents();
}

/// This client event, if present, is fired when the page 
/// is first loaded or whenever it is resized.<br>
/// If this is called at load time, then <var>load</var> will
/// be true.
ClientMethod onlayoutHandler(load) [ Language = javascript ]
{
	// adjust size of lookout menu
	var menu = zenPage.getComponentById('lookout');
	zenASSERT(menu,'メニューが見つかりません',arguments);

	// find divs for title & mainMenu
	var top = zenPage.getComponentById('top');
	
	
	// find height of window
	var winHeight = zenGetWindowHeight();
	var winWidth = zenGetWindowWidth();
    var menuWidth = 270;
	// adjust size of menu
	var sz = winHeight-100;
	menu.setSize(menuWidth,sz);

	var frame = zenPage.getComponentById("iframe");
	frame.height= sz;
}

}
