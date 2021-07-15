Class TRU.Production.Main Extends Ens.Production [ ClassType = "", ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="TRU.Production.Main" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>3</ActorPoolSize>
  <Item Name="CEO Metrics" Category="" ClassName="TRU.Service.CEOMetrics" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="ReorderAmount">100</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">2</Setting>
  </Item>
  <Item Name="Order via SOAP" Category="" ClassName="TRU.Service.SOAP" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="Sales Management" Category="" ClassName="EnsLib.Workflow.Operation" PoolSize="2" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AutoCreateRole">1</Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="Shipping System" Category="" ClassName="TRU.Operation.ShippingSystem" PoolSize="2" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="Inventory System" Category="" ClassName="TRU.Operation.InventorySystem" PoolSize="2" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="CRM System" Category="" ClassName="TRU.Operation.CRMSystem" PoolSize="2" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="Product Order" Category="" ClassName="TRU.Process.OrderProduct" PoolSize="0" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError"></Setting>
  </Item>
  <Item Name="Order via Web Portal" Category="" ClassName="TRU.Service.CSP" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="Miscellaneous Metrics" Category="" ClassName="TRU.Service.MiscMetrics" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">2</Setting>
  </Item>
  <Item Name="CEO Metrics2" Category="" ClassName="TRU.Service.CEOMetrics2" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
</Production>
}

}
