prompt --application/shared_components/user_interface/lovs/username
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(28395744476493345022)
,p_lov_name=>'USERNAME'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select full_name as display',
', username as return',
'from eba_demo_proj_team_members',
'order by 1'))
);
end;
/
