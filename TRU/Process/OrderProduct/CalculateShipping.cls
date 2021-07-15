/// 
Class TRU.Process.OrderProduct.CalculateShipping Extends Ens.Rule.Definition [ LegacyInstanceContext, ProcedureBlock ]
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="TRU.Process.OrderProduct.Context" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<when condition="((Order.Quantity)&gt;=(50))&amp;&amp;((Order.ShipBy)=(&quot;ground&quot;))">
<return>0</return>
</when>
</rule>
<rule name="">
<when condition="((Order.Quantity)&lt;(200))&amp;&amp;((Order.ShipBy)=(&quot;air&quot;))">
<return>35</return>
</when>
</rule>
<return>Order.Quantity*5</return>
</ruleSet>
</ruleDefinition>
}

}
