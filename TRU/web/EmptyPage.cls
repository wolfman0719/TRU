/// Created using the page template: Default
Class TRU.web.EmptyPage Extends %ZEN.Component.page
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "TRU.web.TRUApp";

/// Displayed name of this page.
Parameter PAGENAME = "EmptyPage";

/// Domain used for localization.
Parameter DOMAIN = "TRUDEMO";

/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">
body {
	background: #C0C0EE;
	font-family: verdana;
}
</style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="">
<html align="center" OnDrawContent="DrawWelcomeMessage" />
</page>
}

/// Draw HTML for the message Pane
Method DrawWelcomeMessage(pSeed As %String) As %Status
{
	#; Whatever HTML we render here will be used in the <html> tag of this Page
	&html<<div id="WelcomeMessage" align="center">
			<br><br><br>
			<br>複合アプリケーション構築アカデミーへようこそ<p>
			<p><img border="1" src="/csp/user/merrychristmas.gif">
		</div>>
	
	Quit $$$OK
}

}
