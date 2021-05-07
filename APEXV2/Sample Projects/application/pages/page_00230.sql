prompt --application/pages/page_00230
begin
wwv_flow_api.create_page(
 p_id=>230
,p_user_interface_id=>wwv_flow_api.id(44535706737386353012)
,p_name=>'Milestones'
,p_step_title=>'Milestones'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(455770727713806832)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_api.id(39211003846943661)
,p_nav_list_template_options=>'#DEFAULT#:t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_last_upd_yyyymmddhh24miss=>'20180301143825'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(863346077172221168)
,p_plug_name=>'Projects'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1947607847624884354)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'      ( select p.name from eba_demo_projects p',
'        where p.id = m.project_id ) project,',
'       name,',
'       apex_util.get_since(DUE_DATE) due_date',
'  from EBA_DEMO_PROJ_MILESTONES m',
'order by due_date desc'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'DIVIDER:SEARCH:INSET'
,p_attribute_02=>'NAME'
,p_attribute_06=>'DUE_DATE'
,p_attribute_14=>'PROJECT'
,p_attribute_16=>'f?p=&APP_ID.:231:&SESSION.::&DEBUG.:RP,231:P231_ID:&ID.'
,p_attribute_18=>'CLIENT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(863347136289221179)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(44535672487334352956)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(455775521014849551)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(863347136289221179)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(44535701501085352993)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Milestone'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:231:&SESSION.::&DEBUG.:RP,231::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(455780146464849557)
,p_name=>'Refresh Projects'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(455775521014849551)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455780685548849557)
,p_event_id=>wwv_flow_api.id(455780146464849557)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(863346077172221168)
,p_stop_execution_on_error=>'Y'
);
end;
/
