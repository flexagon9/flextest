prompt --application/shared_components/user_interface/lovs/bugs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4274114028061119040)
,p_lov_name=>'BUGS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select bug_number||''. ''||subject d , id ',
'from EBA_BT_SW_DEFECTS'))
);
end;
/
