prompt --application/shared_components/user_interface/lovs/grouplist_with_null_option
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7140651456800022610)
,p_lov_name=>'GROUPLIST_WITH_NULL_OPTION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d,r from (',
'select ''Not Assigned'' d, -9999 r from dual',
'union all',
'select d,r from (',
'select GROUP_NAME d,id r',
'from   eba_bt_Group where upper(is_active) = ''Y'' order by 1',
')',
')'))
);
end;
/
