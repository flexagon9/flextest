prompt --application/shared_components/user_interface/lovs/tasks_with_dates
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1082125279997664296)
,p_lov_name=>'TASKS WITH DATES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name || '' ['' || start_date || '' - '' || end_date || '']'' as display',
', id as return',
'from eba_demo_proj_tasks',
'order by start_date'))
);
end;
/
