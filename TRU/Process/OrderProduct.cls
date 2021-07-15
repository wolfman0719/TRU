/// This Business Process handles on-line product orders.
Class TRU.Process.OrderProduct Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='TRU.Msg.ProductOrder' response='TRU.Msg.OrderConfirmation' height='1800' width='2000' >
<context>
<property name='Order' type='TRU.Msg.ProductOrder' instantiate='0' >
</property>
<property name='Shipping' type='%Numeric' instantiate='0' >
</property>
<property name='ShippingMethod' type='%String' instantiate='0' >
</property>
<property name='Discount' type='%Numeric' initialexpression='0' instantiate='0' >
</property>
<property name='OrderPlaced' type='%Boolean' initialexpression='0' instantiate='0' >
</property>
<property name='ExistingCustomer' type='%Boolean' initialexpression='0' instantiate='0' >
</property>
<property name='OrderNumber' type='%String' instantiate='0' >
</property>
</context>
<sequence xend='200' yend='1400' >
<sequence name='Initialize' xpos='200' ypos='250' xend='200' yend='450' >
<annotation>Initialize the context variables</annotation>
<assign name="Order" property="context.Order" value="request" action="set" xpos='200' ypos='250' />
<assign name="ShippingMethod" property="context.ShippingMethod" value="request.ShipBy" action="set" xpos='200' ypos='350' />
</sequence>
<call name='Notify CRM' target='CRM System' async='0' xpos='200' ypos='350' >
<annotation>Notify CRM System of Customer Visit</annotation>
<request type='TRU.Msg.CustomerVisit' >
<assign property="callrequest.Name" value="request.Name" action="set" />
</request>
<response type='TRU.Msg.CustomerVisitResponse' >
<assign property="context.ExistingCustomer" value="callresponse.ExistingCustomer" action="set" />
</response>
</call>
<rule name='Discount' rule='DetermineDiscount'  resultLocation='context.Discount' xpos='200' ypos='450' >
</rule>
<call name='Place Order' target='Inventory System' async='0' xpos='200' ypos='550' >
<annotation>Make sure item is in inventory.
If so, then place the order.</annotation>
<request type='TRU.Msg.ProductOrder' >
<assign property="callrequest.Product" value="request.Product" action="set" />
<assign property="callrequest.Quantity" value="request.Quantity" action="set" />
<assign property="callrequest.Discount" value="context.Discount" action="set" />
<assign property="callrequest.Name" value="request.Name" action="set" />
<assign property="callrequest.City" value="request.City" action="set" />
</request>
<response type='TRU.Msg.InventoryOrderResponse' >
<assign property="context.OrderPlaced" value="callresponse.OrderPlaced" action="set" />
<assign property="response.Ordered" value="callresponse.OrderPlaced" action="set" />
<assign property="context.OrderNumber" value="callresponse.SalesId" action="set" />
</response>
</call>
<if name='Order OK?' condition='context.OrderPlaced' xpos='200' ypos='650' xend='200' yend='1100' >
<true>
<rule name='Calculate Shipping' rule='CalculateShipping'  resultLocation='context.Shipping' xpos='470' ypos='800' >
</rule>
<call name='Shipping ' target='Shipping System' async='0' xpos='470' ypos='900' >
<request type='TRU.Msg.ShippingRequest' >
<assign property="callrequest.OrderNumber" value="context.OrderNumber" action="set" />
<assign property="callrequest.ShippingMethod" value="request.ShipBy" action="set" />
</request>
<response type='TRU.Msg.ShippingResponse' >
<assign property="response.ShippingCompany" value="callresponse.Carrier" action="set" />
<assign property="response.TrackingNumber" value="callresponse.TrackingNumber" action="set" />
</response>
</call>
<sequence name='Prepare Response' xpos='470' ypos='1000' xend='200' yend='1350' >
<assign name="Ordered" property="response.Ordered" value="1" action="set" xpos='200' ypos='250' />
<assign name="Order Number" property="response.OrderNumber" value="context.OrderNumber" action="set" xpos='200' ypos='350' />
<assign name="Message" property="response.Message" value="&quot;以下のご注文を出荷しました。&quot;" action="set" xpos='200' ypos='450' />
<assign name="Name" property="response.Name" value="request.Name" action="set" xpos='200' ypos='550' />
<assign name="City" property="response.City" value="request.City" action="set" xpos='200' ypos='650' />
<assign name="UnitPrice" property="response.UnitPrice" value="request.Product.UnitPrice" action="set" xpos='200' ypos='750' />
<assign name="Discount" property="response.Discount" value="context.Discount" action="set" xpos='200' ypos='850' />
<assign name="Shipping" property="response.Shipping" value="context.Shipping" action="set" xpos='200' ypos='950' />
<assign name="Product" property="response.Product" value="request.Product.Name" action="set" xpos='200' ypos='1050' />
<assign name="ShippingMethod" property="response.ShippingMethod" value="context.ShippingMethod" action="set" xpos='200' ypos='1150' />
<assign name="Quantity" property="response.Quantity" value="request.Quantity" action="set" xpos='200' ypos='1250' />
</sequence>
</true>
<false>
<assign name="OutOfStock" property="response.Message" value="&quot;Out of Stock&quot;" action="set" xpos='200' ypos='800' />
</false>
</if>
<reply xpos='200' ypos='1200' >
<annotation>Send Confirmation to caller</annotation>
</reply>
<sequence name='Approve Discount' xpos='200' ypos='1300' xend='200' yend='700' >
<if name='Discount?' condition='context.Discount&gt;10' xpos='200' ypos='250' xend='200' yend='600' >
<true>
<call name='Approve Discount' target='Sales Management' async='1' xpos='335' ypos='400' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Subject" value="&quot;値引きの承認&quot;" action="set" />
<assign property="callrequest.%Actions" value="&quot;承認,承認不可&quot;" action="set" />
<assign property="callrequest.%UserName" value="&quot;_SYSTEM&quot;" action="set" />
<assign property="callrequest.%FormFields" value="&quot;Customer,Discount,TotalSale&quot;" action="set" />
<assign property="callrequest.%FormValues" value="request.Name" action="set" key="&quot;Customer&quot;" />
<assign property="callrequest.%FormValues" value="context.Discount" action="set" key="&quot;Discount&quot;" />
<assign property="callrequest.%FormValues" value="response.TotalPrice" action="set" key="&quot;TotalSale&quot;" />
</request>
<response type='EnsLib.Workflow.TaskResponse' />
</call>
<sync name='Wait for Approval' calls='Approve Discount' type='all' xpos='335' ypos='500' />
</true>
</if>
</sequence>
</sequence>
</process>
}

}
