prompt --application/shared_components/user_interface/lovs/access_levels
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(3462242028703774365)
,p_lov_name=>'ACCESS_LEVELS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select access_level d, id r',
'  from eba_bt_access_levels',
' order by id desc'))
);
end;
/
