prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Status'
,p_page_mode=>'MODAL'
,p_step_title=>'Statuses'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141354470818444)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_api.id(3797358846252064904)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'    Statuses',
'</h2>',
'<p>',
'    Manage the list of statuses that users can select for bugs.',
'</p>',
'<p>',
'    Create new a status by clicking the <strong>Create Bug Status Code</strong>.',
'</p>',
'<p>',
'    Edit or delete a status by clicking the name of a status.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180214152645'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6308614766619347617)
,p_plug_name=>'Statuses'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id,initcap(STATUS_NAME) Status, ',
' decode(is_active,''Y'',''Yes'',''No'') is_active,',
' description,',
'   (select count(*) from EBA_BT_SW_DEFECTS d where d.status_id = s.id) bug_count,',
' decode(is_open,''Y'',''Yes'',''N'',''No'',is_open) is_open,',
' decode(VALID_FOR_NEW,''Y'',''Yes'',''N'',''No'',null,''Yes'') valid_for_new,',
' decode(IS_ENHANCEMENT,''Y'',''Yes'',''N'',''No'',IS_ENHANCEMENT) IS_ENHANCEMENT,',
' decode(IS_DOC,''Y'',''Yes'',''N'',''No'',IS_DOC) IS_DOC,',
'created,',
'created_by ',
'from eba_bt_status  s'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(6308614885053347617)
,p_name=>'Statuses'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than 10,000 rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>4453916357747358437
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308615066947347618)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Status ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308615170014347619)
,p_db_column_name=>'STATUS'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Status'
,p_column_link=>'f?p=&APP_ID.:9:&SESSION.:EDIT:&DEBUG.:9:P9_ID:#ID#'
,p_column_linktext=>'#STATUS#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308615274068347619)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308861668151871179)
,p_db_column_name=>'IS_ACTIVE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Is Active'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5499830066022927127)
,p_db_column_name=>'BUG_COUNT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Bug Count'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR:IR_STATUS_CODE:#ID#'
,p_column_linktext=>'#BUG_COUNT#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4102326438343387753)
,p_db_column_name=>'IS_OPEN'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Is Open'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1322447010155005762)
,p_db_column_name=>'CREATED'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1322447040455005764)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(991599186668883426)
,p_db_column_name=>'VALID_FOR_NEW'
,p_display_order=>19
,p_column_identifier=>'J'
,p_column_label=>'Valid for new'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1507635482502885428)
,p_db_column_name=>'IS_ENHANCEMENT'
,p_display_order=>29
,p_column_identifier=>'K'
,p_column_label=>'Is Enhancement'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1507635553555885429)
,p_db_column_name=>'IS_DOC'
,p_display_order=>39
,p_column_identifier=>'L'
,p_column_label=>'Is Doc'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6308615490944347907)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8129228'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'STATUS:IS_ACTIVE:IS_OPEN:IS_ENHANCEMENT:VALID_FOR_NEW:BUG_COUNT:CREATED:CREATED_BY:IS_DOC'
,p_sort_column_1=>'STATUS'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6337636700092966782)
,p_plug_name=>'Notes'
,p_region_css_classes=>'infoTextRegion'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<p>Statuses are used to identify the current Status of each Bug. The Statuses will be available when you Add, Modify or Search for a Bug. Statuses can be made Active or Inactive but only active Statuses can be selected when adding or modifying a Bug.'
||'</p>'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4564587156314503808)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6308614766619347617)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,13::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10623652699388587372)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6308614766619347617)
,p_button_name=>'NEW_STATUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Bug Status Code'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9::'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10623652892708587376)
,p_branch_action=>'f?p=&FLOW_ID.:9:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(10623652699388587372)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6363838586517572152)
,p_branch_action=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 05-SEP-2007 09:59 by MIKE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6364409805356429737)
,p_branch_action=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,13::'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6364408698646418349)
,p_branch_sequence=>30
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 06-SEP-2007 05:02 by SATHISH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10318360500193152431)
,p_name=>'P13_SOURCEURL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6308614766619347617)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1415239269545082773)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(946140736622127534)
,p_computation_sequence=>20
,p_computation_item=>'PRODUCT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'0'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(946140908676127535)
,p_computation_sequence=>30
,p_computation_item=>'PRODUCT_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'All'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1103794829455068134)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1103795026182068135)
,p_event_id=>wwv_flow_api.id(1103794829455068134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(6308614766619347617)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6363839090673573319)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
);
end;
/
