/// 
Class TRU.Process.OrderProduct.DetermineDiscount Extends Ens.Rule.Definition [ LegacyInstanceContext, ProcedureBlock ]
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="TRU.Process.OrderProduct.Context" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<when condition="((ExistingCustomer)=(1))&amp;&amp;((Order.City)=(&quot;Boston&quot;))">
<return>12</return>
</when>
</rule>
<rule name="">
<when condition="((ExistingCustomer)=(1))">
<return>10</return>
</when>
</rule>
<return>0</return>
</ruleSet>
</ruleDefinition>
}

}
