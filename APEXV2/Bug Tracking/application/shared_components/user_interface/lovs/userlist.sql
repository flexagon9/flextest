prompt --application/shared_components/user_interface/lovs/userlist
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(6332887083651959298)
,p_lov_name=>'USERLIST'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username d, id r',
'from eba_bt_users',
'order by lower(username)'))
);
end;
/
