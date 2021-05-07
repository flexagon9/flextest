prompt --application/shared_components/user_interface/lovs/version_list_p48
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(10387749984261310759)
,p_lov_name=>'VERSION LIST P48'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v.version_name d, v.id r',
'  from eba_bt_version v',
' where nvl(v.product_id, :P48_PRODUCT_ID) = :P48_PRODUCT_ID',
' order by 1'))
);
end;
/
