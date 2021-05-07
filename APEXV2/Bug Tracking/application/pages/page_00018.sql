prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Product Administration'
,p_page_mode=>'MODAL'
,p_step_title=>'Product Administration'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141354470818444)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_api.id(3797358846252064904)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'    Products',
'</h2>',
'<p>',
'    Bugs are created for a Product. Products are available when you Add, Modify, or Search for a bug.',
'</p>',
'<p>',
'    Click the <strong>Add Product</strong> button to add to the list of selectable products in the application.',
'</p>',
'<p>',
'    Products can be Active or Inactive. Only Active products can be selected when you add or modify a Bug.',
'</p>',
'<h3>',
'    Product Versions',
'</h3>',
'<p>',
'    Each product also maintains a list of product versions. When you file a bug, a <i>fix by version</i>, or a <i>fixed in version</i>, it is based on product versions. You can also edit product versions.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180220142223'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5503072168307537113)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id,',
'    product_name,',
'    external_id,',
'    description, ',
'    nvl(is_active,''Y'') is_active,',
'    (select count(*) from eba_bt_sw_defects x where x.product_id = p.id) bugs,',
'    (select count(*) from eba_bt_version x where x.PRODUCT_ID = p.id) product_versions',
'from eba_bt_product p'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5503072276609537113)
,p_name=>'Products'
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
,p_icon_view_enabled_yn=>'Y'
,p_icon_view_use_custom=>'Y'
,p_icon_view_custom_link=>'<a href="#URL#"><span class="fa #IMG#"></span><strong>#PRODUCT_NAME#</strong></a>'
,p_icon_view_columns_per_row=>4
,p_owner=>'MIKE'
,p_internal_uid=>3648373749303547933
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503072567765537116)
,p_db_column_name=>'ID'
,p_display_order=>3
,p_column_identifier=>'B'
,p_column_label=>'Product ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503072664529537116)
,p_db_column_name=>'PRODUCT_NAME'
,p_display_order=>5
,p_column_identifier=>'C'
,p_column_label=>'Product Name'
,p_column_link=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP,94:P94_ID:#ID#'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503072794283537116)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>6
,p_column_identifier=>'D'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1342805502783011665)
,p_db_column_name=>'IS_ACTIVE'
,p_display_order=>8
,p_column_identifier=>'G'
,p_column_label=>'Is Active'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(5596221487882515727)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1421118510599962935)
,p_db_column_name=>'BUGS'
,p_display_order=>9
,p_column_identifier=>'H'
,p_column_label=>'Bug Count'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1428197483620673080)
,p_db_column_name=>'PRODUCT_VERSIONS'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Product Versions'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941698255500969848)
,p_db_column_name=>'EXTERNAL_ID'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'External ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_required_patch=>wwv_flow_api.id(16725495374012530)
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5503074093279545956)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8207787'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'PRODUCT_NAME:DESCRIPTION:IS_ACTIVE:BUGS:PRODUCT_VERSIONS:ID::EXTERNAL_ID'
,p_sort_column_1=>'PRODUCT_NAME'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1421118716901967141)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5503072168307537113)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,RIR,&APP_PAGE_ID.::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10624368506742970943)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5503072168307537113)
,p_button_name=>'CREATE_PRODUCT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Product'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:17::'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10379474984927079135)
,p_name=>'P18_SOURCEURL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5503072168307537113)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1415238075541073149)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1096899134240896357)
,p_name=>'Refresh Products'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId === 17'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1096899260634896358)
,p_event_id=>wwv_flow_api.id(1096899134240896357)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5503072168307537113)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1096899410602896359)
,p_event_id=>wwv_flow_api.id(1096899134240896357)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Action Processed.'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(314226620416918157)
,p_name=>'Refresh on Edit Product'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(5503072168307537113)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(314226663660918158)
,p_event_id=>wwv_flow_api.id(314226620416918157)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5503072168307537113)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(314226734666918159)
,p_name=>'Refresh on Add Product'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10624368506742970943)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(314226854682918160)
,p_event_id=>wwv_flow_api.id(314226734666918159)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5503072168307537113)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10379475384751079136)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
':P18_SOURCEURL := HTMLDB_UTIL.PREPARE_URL(''f?p='' || v(''APP_ID'') || '':EDIT:17:'' || V(''SESSION'') || ''::NO'' ) ;',
'',
'END ;'))
,p_process_when_type=>'NEVER'
);
end;
/
