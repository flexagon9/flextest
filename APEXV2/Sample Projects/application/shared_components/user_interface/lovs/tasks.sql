prompt --application/shared_components/user_interface/lovs/tasks
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(792585638504409963)
,p_lov_name=>'TASKS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as display',
', id as return',
'from eba_demo_proj_tasks',
'order by start_date'))
);
end;
/
