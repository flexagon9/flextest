prompt --application/shared_components/user_interface/lovs/projects
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(44976154877071452588)
,p_lov_name=>'PROJECTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as display',
', id as return',
'from eba_demo_projects',
'order by 1'))
);
end;
/
