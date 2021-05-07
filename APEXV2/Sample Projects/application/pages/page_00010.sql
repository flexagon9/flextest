prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(44535706737386353012)
,p_name=>'Calendar'
,p_step_title=>'Calendar'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.fc-event.fa:before { display: inline-block; float: left; margin-right: 4px; }',
'.fc-eventlist-desc { display: block; font-size: 11px; margin-top: 8px; color: #707070; }',
'.fc-agendaList-eventDetails { width: 80%; }',
'.legend-list {list-style: none; margin: 0;}',
'.legend.fc-event { display: inline-block; padding: 0 4px; width: 72px; text-align: center; }',
'',
'.myicon-left .fc-content .fc-title:before {',
'  font-family: ''Font APEX Small'';',
'  margin-right: 5px;',
'  float: left;',
'}',
'',
'.myicon-folder .fc-content .fc-title:before {',
'  content: ''\f07b'';',
'}',
'',
'.myicon-check .fc-content .fc-title:before {',
'  content: ''\f046'';',
'}',
'',
'.myicon-flag .fc-content .fc-title:before {',
'  content: ''\f024'';',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20180301152038'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27522938299597406706)
,p_plug_name=>'Filter Bar'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(44535672487334352956)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27522938822026406712)
,p_plug_name=>'Legend'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(44535676773620352960)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="legend-list fc">',
'  <li><strong class="legend fc-event apex-cal-red">Red</strong>&nbsp;&nbsp;Milestone in the past and tasks ended after due date.</li>',
'  <li><strong class="legend fc-event apex-cal-orange">Orange</strong>&nbsp;&nbsp;Milestone in the past and <em><strong>incomplete</strong></em> tasks.</li>',
'  <li><strong class="legend fc-event apex-cal-green">Green</strong>&nbsp;&nbsp;Milestone in the past and all tasks ended before due date.</li>',
'  <li><strong class="legend fc-event apex-cal-yellow">Yellow</strong>&nbsp;&nbsp;Milestone in the future and Tasks scheduled to finish <u><strong>after</strong></u> due date.</li>',
'  <li><strong class="legend fc-event apex-cal-blue">Blue</strong>&nbsp;&nbsp;Milestone in the future and Tasks scheduled to finish on or before due date.</ li>',
'</ul>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44538504080426414203)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(44535683816227352965)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(44535708008096353023)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(44535701985274352994)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44538504684479414205)
,p_plug_name=>'Calendar'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(44535672405391352956)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id',
', ''Project: '' || p.name name',
', ''[Project] Project Lead: '' || (select full_name from eba_demo_proj_team_members tm where p.project_lead = tm.id) ||',
'  ''; Description: '' || p.description  description',
', eba_demo_projects_color_pkg.project_color',
'  ( p_project_id => p.id',
'   , p_completed_date => p.completed_date',
'  ) css_class',
', p.completed_date start_date',
', p.completed_date end_date',
', ''f?p=&APP_ID.:5:&APP_SESSION.::::P5_ID:'' || p.id link_url',
'from eba_demo_projects p',
'where p.completed_date is not null',
'and p.id = nvl(:P10_PROJECT_ID, p.id)',
'and instr(:P10_SHOW, ''P'') > 0',
'UNION ALL',
'select m.id',
', ''Milestone: '' || m.name name',
', ''[Project] '' || p.name ||',
'  ''<br>[Milestone] Description: '' || m.description description',
', eba_demo_projects_color_pkg.milestone_color',
'  ( p_milestone_id => m.id',
'   , p_due_date => m.due_date',
'  ) css_class',
', m.due_date start_date',
', m.due_date end_date',
', ''f?p=&APP_ID.:7:&APP_SESSION.::::P7_ID:'' || m.id link_url',
'from eba_demo_proj_milestones m',
',    eba_demo_projects p',
'where p.id = m.project_id',
'and m.project_id = nvl(:P10_PROJECT_ID, m.project_id)',
'and m.id = nvl(:P10_MILESTONE_ID, m.id)',
'and instr(:P10_SHOW, ''M'') > 0',
'UNION ALL ',
'select t.id',
', ''Task: '' || t.name name',
', ''[Project] '' || p.name ||',
'  ''<br>[Task] Assignee: '' || (select full_name from eba_demo_proj_team_members tm where t.assignee = tm.id) ||',
'  ''; Complete? '' || decode(t.is_complete_yn, ''Y'', ''Yes'', ''No'') ||',
'  ''; Description: '' || t.description description',
', eba_demo_projects_color_pkg.task_color',
'  ( p_task_id => t.id',
'   , p_completed_date => p.completed_date',
'   , p_due_date => null',
'  ) css_class',
', t.start_date start_date',
', t.end_date end_date',
', ''f?p=&APP_ID.:9:&APP_SESSION.::::P9_ID:'' || t.id link_url',
'from eba_demo_proj_tasks t',
', eba_demo_projects p',
'where p.id = t.project_id',
'and t.project_id = nvl(:P10_PROJECT_ID, t.project_id)',
'and t.milestone_id is null',
'and instr(:P10_SHOW, ''T'') > 0',
'UNION ALL',
'select t.id',
', ''Task: '' || t.name name',
', ''[Project] '' || p.name ||',
'  ''<br>[Milestone] '' || m.name ||',
'  ''; Due Date: '' || m.due_date ||',
'  ''<br>[Task] Assignee: '' || (select full_name from eba_demo_proj_team_members tm where t.assignee = tm.id) ||',
'  ''; Complete? '' || decode(t.is_complete_yn, ''Y'', ''Yes'', ''No'') ||',
'  ''; Description: '' || t.description description',
', eba_demo_projects_color_pkg.task_color',
'  ( p_task_id => t.id',
'   , p_completed_date => null',
'   , p_due_date => m.due_date',
'  ) css_class',
', t.start_date start_date',
', t.end_date end_date',
', ''f?p=&APP_ID.:9:&APP_SESSION.::::P9_ID:'' || t.id link_url',
'from eba_demo_proj_tasks t',
', eba_demo_proj_milestones m',
', eba_demo_projects p',
'where p.id = t.project_id',
'and m.id = t.milestone_id',
'and t.project_id = nvl(:P10_PROJECT_ID, t.project_id)',
'and t.milestone_id = nvl(:P10_MILESTONE_ID, t.milestone_id)',
'and instr(:P10_SHOW, ''T'') > 0',
''))
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_ajax_items_to_submit=>'P10_PROJECT_ID,P10_MILESTONE_ID,P10_SHOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'START_DATE'
,p_attribute_02=>'END_DATE'
,p_attribute_03=>'NAME'
,p_attribute_05=>'&LINK_URL.'
,p_attribute_09=>'list:navigation'
,p_attribute_13=>'N'
,p_attribute_14=>'CSS_CLASS'
,p_attribute_16=>'&DESCRIPTION.'
,p_attribute_17=>'Y'
,p_attribute_19=>'Y'
,p_attribute_21=>'10'
,p_attribute_22=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1096140967511380572)
,p_name=>'P10_SHOW'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(27522938299597406706)
,p_item_default=>'P:M:T'
,p_prompt=>'Show'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:Completed Projects;P,Milestones;M,Tasks;T'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(44535700953287352991)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'3'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27522938334728406707)
,p_name=>'P10_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(27522938299597406706)
,p_prompt=>'Project'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as display',
', id as return',
'from eba_demo_projects',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Projects -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(44535700953287352991)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27522938450407406708)
,p_name=>'P10_MILESTONE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(27522938299597406706)
,p_prompt=>'Milestone'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from eba_demo_proj_milestones m',
'where m.project_id = :P10_PROJECT_ID',
'order by m.due_date'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Milestones -'
,p_lov_cascade_parent_items=>'P10_PROJECT_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(44535700953287352991)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27522938536685406709)
,p_name=>'Refresh Calendar'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_PROJECT_ID,P10_MILESTONE_ID,P10_SHOW'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27522938703841406710)
,p_event_id=>wwv_flow_api.id(27522938536685406709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(44538504684479414205)
,p_stop_execution_on_error=>'Y'
);
end;
/
