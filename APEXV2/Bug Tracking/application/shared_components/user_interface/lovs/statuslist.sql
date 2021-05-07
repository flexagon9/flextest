prompt --application/shared_components/user_interface/lovs/statuslist
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9940847383585332960)
,p_lov_name=>'STATUSLIST'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_NAME d, id r',
'from   eba_bt_status where upper(IS_ACTIVE) = ''Y''',
''))
);
end;
/
