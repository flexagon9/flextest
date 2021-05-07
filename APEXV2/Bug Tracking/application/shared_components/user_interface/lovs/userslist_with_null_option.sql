prompt --application/shared_components/user_interface/lovs/userslist_with_null_option
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7140459236260849008)
,p_lov_name=>'USERSLIST_WITH_NULL_OPTION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d,r from (',
'select ''Not Assigned'' d, -9999 r from dual',
'union all',
'select d,r from (',
'select username d,id r',
'from eba_bt_users',
'order by 1',
')',
')'))
);
end;
/
