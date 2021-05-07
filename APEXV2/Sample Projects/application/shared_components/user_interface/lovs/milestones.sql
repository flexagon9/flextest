prompt --application/shared_components/user_interface/lovs/milestones
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(45046685325716295955)
,p_lov_name=>'MILESTONES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name || '' ['' || due_date || '']'' as display',
', id as return',
'from eba_demo_proj_milestones',
'order by due_date'))
);
end;
/
