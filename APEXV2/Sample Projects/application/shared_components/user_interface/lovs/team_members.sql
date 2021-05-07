prompt --application/shared_components/user_interface/lovs/team_members
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(44957235059822589223)
,p_lov_name=>'TEAM MEMBERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select full_name as display',
', id as return',
'from eba_demo_proj_team_members',
'order by 1'))
);
end;
/
