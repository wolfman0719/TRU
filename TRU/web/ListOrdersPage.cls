/// Created using the page template: Default
Class TRU.web.ListOrdersPage Extends TRU.web.EmptyPage
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "TRU.web.TRUApp";

/// Displayed name of this page.
Parameter PAGENAME = "ListOrdersPage";

/// Domain used for localization.
Parameter DOMAIN = "TRUDEMO";

/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">
</style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="">
<hgroup>
<vgroup>
<spacer height="40"/>
<tableNavigatorBar tablePaneId="table" 
	showPageSize="true"
	showFilter="false" width="550"/>
<spacer height="30"/>
<tablePane id="table" 
sql="select ps.*,p.ShortName from TRU.ProductSale ps, TRU.Product p where ps.Product = p.ID" 
valueColumn="ID"
width="1000" 
bodyHeight="485"
pageSize="20" 
showZebra="true" 
useSnapshot="true" 
fixedHeaders="true"
dataSource="columns">
<column colName="ID" hidden="true"/>
<column colName="TimeOfSale" resource="TRU.Order.View"/>
<column colName="Customer" resource="TRU.Order.ViewAll"/>
<column colName="Location" resource="TRU.Order.View"/>
<column colName="ShortName" resource="TRU.Order.View"/>
<column colName="Quantity" resource="TRU.Order.View"/>
<column colName="Amount" resource="TRU.Order.ViewAll"/>
<column colName="Discount" resource="TRU.Order.ViewAll"/>
</tablePane>
</vgroup>
</hgroup>
</page>
}

}
