prompt --application/shared_components/user_interface/lovs/grouplist
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9948178684985883238)
,p_lov_name=>'GROUPLIST'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select GROUP_NAME d, id r',
'from eba_bt_group  where IS_ACTIVE = ''Y'' order by 1 '))
);
end;
/
