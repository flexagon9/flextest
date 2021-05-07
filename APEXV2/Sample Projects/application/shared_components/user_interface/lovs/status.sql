prompt --application/shared_components/user_interface/lovs/status
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(769654727297823866)
,p_lov_name=>'STATUS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select description d, cd r',
'from eba_demo_proj_status',
'order by display_order'))
);
end;
/
