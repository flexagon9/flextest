prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(44535706737386353012)
,p_name=>'Project Tree'
,p_step_title=>'Project Tree'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20180213063802'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1082675798262606298)
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
 p_id=>wwv_flow_api.id(1082677131268606300)
,p_plug_name=>'Project Tree'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(44535680543877352962)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with data as (',
'select ''M'' as link_type,',
'       null as parent,',
'       ''All Projects'' as id,',
'       ''All Projects'' as name,',
'       null as tooltip,',
'       null as sub_id,',
'       null as order_date',
'  from dual',
'union',
'select ''P'' as link_type,',
'       ''All Projects'' as parent,',
'       to_char(id) as id,',
'       name as name,',
'       description as tooltip,',
'       id as sub_id,',
'       (select min(start_date) ',
'        from eba_demo_proj_tasks t',
'        where t.project_id = p.id',
'       ) order_date',
'  from eba_demo_projects p',
'union',
'select ''M'' as link_type,',
'       to_char(project_id) parent,',
'       to_char(id) id,',
'       name as name,',
'       description as tooltip,',
'       id as sub_id,',
'       due_date as order_date',
'  from eba_demo_proj_milestones',
'union',
'select ''T'' as link_type,',
'       to_char(project_id) as parent,',
'       null as id,',
'       name as name,',
'       description as tooltip,',
'       id as sub_id,',
'       start_date as order_date',
'  from eba_demo_proj_tasks',
'  where milestone_id is null',
'union',
'select ''T'' as link_type,',
'       to_char(milestone_id) as parent,',
'       null as id,',
'       name as name,',
'       description as tooltip,',
'       id as sub_id,',
'       start_date as order_date',
'  from eba_demo_proj_tasks',
'  where milestone_id is not null',
')',
'select case when connect_by_isleaf = 1 then 0',
'            when level = 1             then 1',
'            else                           -1',
'       end as status, ',
'       level, ',
'       name as title, ',
'       null as icon, ',
'       id as value, ',
'       tooltip as tooltip, ',
'       case when link_type = ''M''',
'              then null',
'            when link_type = ''P''',
'              then apex_util.prepare_url(''f?p=''||:APP_ID||'':5:''||:APP_SESSION||''::NO::P5_ID:''|| sub_id)',
'            when link_type = ''M''',
'              then apex_util.prepare_url(''f?p=''||:APP_ID||'':7:''||:APP_SESSION||''::NO::P7_ID:''|| sub_id)',
'            when link_type = ''T''',
'              then apex_util.prepare_url(''f?p=''||:APP_ID||'':9:''||:APP_SESSION||''::NO::P9_ID:''|| sub_id)',
'            else null',
'        end as link ',
'from data',
'start with parent is null',
'connect by prior id = parent',
'order siblings by order_date',
''))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'S'
,p_attribute_04=>'DB'
,p_attribute_10=>'TITLE'
,p_attribute_11=>'LEVEL'
,p_attribute_12=>'ICON'
,p_attribute_15=>'STATUS'
,p_attribute_20=>'VALUE'
,p_attribute_22=>'TOOLTIP'
,p_attribute_23=>'LEVEL'
,p_attribute_24=>'LINK'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1082676158026606298)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1082675798262606298)
,p_button_name=>'CONTRACT_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(44535701501085352993)
,p_button_image_alt=>'Collapse All'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1082676577357606299)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1082675798262606298)
,p_button_name=>'EXPAND_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(44535701501085352993)
,p_button_image_alt=>'Expand All'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1082677764130606301)
,p_name=>'EXPAND_ALL'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(1082676577357606299)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1082678333952606305)
,p_event_id=>wwv_flow_api.id(1082677764130606301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1082677131268606300)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1082678707728606306)
,p_name=>'CONTRACT_ALL'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(1082676158026606298)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1082679243428606306)
,p_event_id=>wwv_flow_api.id(1082678707728606306)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1082677131268606300)
,p_stop_execution_on_error=>'Y'
);
end;
/
