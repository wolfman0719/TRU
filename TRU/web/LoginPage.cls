/// Created using the page template: Default
Class TRU.web.LoginPage Extends TRU.web.EmptyPage
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "TRU.web.TRUApp";

/// Displayed name of this page.
Parameter PAGENAME = "LoginPage";

/// Domain used for localization.
Parameter DOMAIN = "TRUDEMO";

/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">
#formGroup {
	background: #C0C0C0;
	background-image: url(/csp/broker/images/grad-halfgray-10x500.png);
	background-repeat: repeat-x;
	border: 1px solid darkblue;
	width: 250px;
}

#formTitleBox {
	color: #DEE0E5;
	background: #000040;
	background-image: url(/csp/broker/images/grad-blue-10x30.png);
	background-repeat: repeat-x;
}
</style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="Things-R-Usログイン">
<DemoTitle id="title" title="ようこそThingsRUs B2Bポータルへ"/>
<spacer height="50"/>
<vgroup valign="top" id="formGroup" align="center">
<titleBox id="formTitleBox" title="ログインのユーザー名とパスワードを入力してください:" containerStyle="padding: 0px;" />
<form id="loginForm" nextPage="TRU.web.HomePage.cls" align="center" valign="middle">
    <spacer height="10" />
    <text name="IRISUserName" label="ユーザー名:" align="left" />
    <password name="IRISPassword" label="パスワード:" />
    <submit caption="ログイン" />
</form>
</vgroup>
</page>
}

}
