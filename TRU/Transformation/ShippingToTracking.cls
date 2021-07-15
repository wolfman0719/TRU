Class TRU.Transformation.ShippingToTracking Extends Ens.DataTransformDTL [ ClassType = "", ProcedureBlock ]
{

XData DTL
{
<transform source='TRU.Msg.ShippingResponse' target='TRU.Msg.TrackingInfo' language='basic' >
<assign property='target.OrderId' value='source.OrderNumber' action='set' />
<assign property='target.ShippingCompany' value='UPPER(source.Carrier)' action='set' />
<assign property='target.TrackingId' value='source.TrackingNumber' action='set' />
</transform>
}

}
