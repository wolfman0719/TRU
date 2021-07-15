/// TRU.web.OrdersReport
Class TRU.web.OrdersReport Extends %ZEN.Report.reportPage
{

/// Class name of application this report belongs to.
Parameter APPLICATION = "TRU.web.TRUApp";

/// This is the default display mode for this report.
Parameter DEFAULTMODE = "html";

/// This is the optional XML namespace used for the report.
Parameter REPORTXMLNAMESPACE;

Parameter DOMAIN = "TRUEDEMO";

Parameter ZENLOCALIZE = 1;

/// This XML defines the logical contents of this report.
XData ReportDefinition [ XMLNamespace = "http://www.intersystems.com/zen/report/definition" ]
{
<report  xmlns="http://www.intersystems.com/zen/report/definition"
 name="OrdersReport" sql="select ps.TimeOfSale,p.ShortName,ps.Quantity,ps.Amount 
 from TRU.ProductSale ps, TRU.Product p where ps.Product = p.ID order by p.ShortName, ps.TimeOfSale">

<attribute name='runTime' expression='$ZDT($H,3)' />
<attribute name='runBy' expression='$UserName' />
<aggregate name='totalSum' type="SUM" field='Amount' />
<aggregate name='count' type="COUNT" field='TimeOfSale' />
<group name='OrdersRep' breakOnField='ShortName'>
<attribute name='name' field='ShortName' />
<aggregate name='totalQuantity' type="SUM" field='Quantity' />
<aggregate name='totalAmount' type="SUM" field='Amount' />

<group name="record">
<attribute name='time' field='TimeOfSale' expression='$PIECE(%val,".",1)' />
<attribute name='quantity' field='Quantity' />
<attribute name='amount' field='Amount' />
</group>
</group>
</report>
}

/// This XML defines the display for of this report.
/// This is used to generate the XSLT stylesheets for both HTML and XSL-FO.
XData ReportDisplay [ XMLNamespace = "http://www.intersystems.com/zen/report/display" ]
{
<report xmlns="http://www.intersystems.com/zen/report/display"
 name="OrdersReport" style="font-family : serif">
<header> 
<!-- REPORT HEADER -->
<p class="banner1">製品別注文レポート</p>
<fo><line pattern="empty"/><line pattern="empty"/></fo>
<table orient="row" width="3.45in" class='table1' style="font-family : serif">
<item field="@runBy" caption="作成者:"/>
<item field="@runTime" caption="作成時間:"/>
<item field="count" caption="注文数合計:"/>
<item field="totalSum" caption="注文総額:"/>
</table>
</header>

<group name="OrdersRep" pagebreak="true" line='1px'>
<header>
<line pattern="empty"/>
<table orient="row" width="3.8in" class='table2'>
<item field="@name" width="2in"><caption value="商品:" width="2in"/></item>
<item field="totalQuantity"><caption value="注文数:"/></item>
<item field="totalAmount" formatNumber='###,###,##0.00;(#)'><caption value="注文総額:"/></item>
</table>
<line pattern="empty"/>
</header>

<table orient="col" group="record" width="6in" class="table4" altcolor="#DFDFFF">
<item special="number" width=".45in" style="color: darkblue;">
<caption value="#" />
</item>
<item field="@time" width="2.5in" style="padding-left: 4px;">
<caption value="販売時間"/>
</item>
<item field="@quantity" width="2.65in">
<caption value="数量"/>
</item>
<item field="@amount" width="2.65in">
<caption value="金額"/>
</item>
</table>



</group>

</report>
}

}
