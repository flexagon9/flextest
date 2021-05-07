prompt --application/pages/page_00066
begin
wwv_flow_api.create_page(
 p_id=>66
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Search Results'
,p_step_title=>'Search Results'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2509088058952367312)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'ul.sSearchResultsReport span.title span.highlight {',
'  background-color: #FFEA87;',
'  text-decoration: underline',
'  }',
'ul.sSearchResultsReport span.highlight {',
'  background-color: #FFEA87;',
'  }',
'</style>'))
,p_step_template=>wwv_flow_api.id(1225655852966288293)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This page displays results of a keyword search. Enter keywords in the search field on this page and click the <strong>Search</strong> button. Use the other filters to vary the search results. Click the <strong>Reset</strong> button to reset the s'
||'earch form.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180111132603'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1376751865223166785)
,p_name=>'Search Results'
,p_template=>wwv_flow_api.id(1225690169574288324)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with defects as (',
'    select sd.id,',
'        sd.bug_number,',
'        sd.subject, ',
'        (select s.status_name from eba_bt_status s where s.id = sd.status_id ) status_name, ',
'        sd.status_id,',
'        sd.urgency_id,',
'        sd.severity_id,',
'        (select username from eba_bt_users u where u.id = sd.submitted_by_id ) submitted_by,',
'        (select p.product_name from eba_bt_product p where p.id = sd.product_id ) product_name,',
'        sd.product_id,',
'        dbms_lob.substr(sd.description,500,1) description, ',
'        sd.tags,',
'        (select username from eba_bt_users u where u.id = sd.assigned_to_id) assignee',
'    from eba_bt_sw_defects sd',
')',
'select d.bug_number||''. ''||d.subject search_title,',
'    ''f?p=''||:APP_ID||'':31:''||:APP_SESSION||'':::31:P31_ID:''||d.id search_link,',
'    nvl(d.description,''No description available'') search_desc,',
'    ''Status'' label_01,',
'    d.status_name value_01,',
'    ''Product Name'' label_03,',
'    d.product_name value_03,',
'    ''Assignee'' label_02,    ',
'    d.assignee value_02',
'from defects d',
'where ( instr(upper(d.assignee),upper(:P66_ASSIGNEE)) > 0 or :P66_ASSIGNEE is null )',
'    and ( nvl(:P66_BUG_NUMBER,0) = 0 or d.bug_number = :P66_BUG_NUMBER )',
'    and ( nvl(:P66_PRIORITY,0) = 0 or d.urgency_id = :P66_PRIORITY )',
'    and ( nvl(:P66_SEVERITY,0) = 0 or d.severity_id = :P66_SEVERITY )',
'    and ( nvl(:P66_PRODUCT,0) = 0 or d.product_id = :P66_PRODUCT )',
'    and ( nvl(:P66_STATUS,0) = 0 or d.status_id = :P66_STATUS )',
'    and ( instr(upper(d.tags),upper(:P66_TAG)) > 0 or :P66_TAG is null )',
'    and ( bug_number = :P66_SEARCH',
'        or instr(upper(d.submitted_by),upper(:P66_SEARCH)) > 0 ',
'        or instr(upper(d.description),upper(:P66_SEARCH)) > 0 ',
'        or instr(upper(d.status_name),upper(:P66_SEARCH)) > 0 ',
'        or instr(upper(d.subject),upper(:P66_SEARCH)) > 0 ',
'        or instr(upper(d.tags),upper(:P66_SEARCH)) > 0 ',
'        or instr(upper(d.assignee),upper(:P66_SEARCH)) > 0',
'        or :P66_SEARCH is null',
'    )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P66_PRODUCT,P66_SEVERITY,P66_PRIORITY,P66_STATUS,P66_ROWS'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1225695656427288331)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No bugs found.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1376760458142197254)
,p_query_column_id=>1
,p_column_alias=>'SEARCH_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Search Title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1376761334731211305)
,p_query_column_id=>2
,p_column_alias=>'SEARCH_LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Search Link'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1376761549933215764)
,p_query_column_id=>3
,p_column_alias=>'SEARCH_DESC'
,p_column_display_sequence=>3
,p_column_heading=>'Search Desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1372347355080135627)
,p_query_column_id=>4
,p_column_alias=>'LABEL_01'
,p_column_display_sequence=>4
,p_column_heading=>'Label 01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1372347488884135628)
,p_query_column_id=>5
,p_column_alias=>'VALUE_01'
,p_column_display_sequence=>5
,p_column_heading=>'Value 01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1372347546868135629)
,p_query_column_id=>6
,p_column_alias=>'LABEL_03'
,p_column_display_sequence=>6
,p_column_heading=>'Label 03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1372347706543135630)
,p_query_column_id=>7
,p_column_alias=>'VALUE_03'
,p_column_display_sequence=>7
,p_column_heading=>'Value 03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1372347826570135631)
,p_query_column_id=>8
,p_column_alias=>'LABEL_02'
,p_column_display_sequence=>8
,p_column_heading=>'Label 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1372347919450135632)
,p_query_column_id=>9
,p_column_alias=>'VALUE_02'
,p_column_display_sequence=>9
,p_column_heading=>'Value 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4390461347264505760)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--stretchInputs:t-Region--hideHeader'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_02'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4390461731051505761)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:2,1,66::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4390461528747505760)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_button_name=>'SEARCH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4390463454581505774)
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 14-DEC-2011 09:16 by SHAKEEB'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4390461927438505761)
,p_name=>'P66_ROWS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_item_default=>'100'
,p_prompt=>'Rows'
,p_source=>'100'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROWS'
,p_lov=>'.'||wwv_flow_api.id(4390463542546505775)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4390462131064505762)
,p_name=>'P66_ASSIGNEE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_prompt=>'Assigned to'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4390462353504505762)
,p_name=>'P66_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_prompt=>'Search'
,p_placeholder=>'Search...'
,p_source=>'&P1_SEARCH.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704767981288342)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4390462559829505762)
,p_name=>'P66_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUSLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_NAME d, id r',
'from   eba_bt_status where upper(IS_ACTIVE) = ''Y''',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Status Codes -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4390466443319509596)
,p_name=>'P66_BUG_NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_prompt=>'Bug Number'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_icon_css_classes=>'fa-bug'
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4390474839079527301)
,p_name=>'P66_TAG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_prompt=>'Tag'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_icon_css_classes=>'fa-tag'
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4390790229073544914)
,p_name=>'P66_PRODUCT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_item_default=>'0'
,p_prompt=>'Product'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4390926859425320107)
,p_name=>'P66_PRIORITY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_item_default=>'0'
,p_prompt=>'Priority'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'URGENCYLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select URGENCY_NAME d, ',
'         id  r',
'from   eba_bt_urgency ',
'where upper(IS_ACTIVE) = ''Y''',
'order by 1',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4392340845029177085)
,p_name=>'P66_SEVERITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4390461347264505760)
,p_prompt=>'Severity'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEVERITY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select severity_name d, id r',
'from   EBA_BT_SEVERITY',
'order by nvl(sequence_number,99), severity_name'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1017377966329077943)
,p_name=>'Refresh Results'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P66_PRODUCT,P66_SEVERITY,P66_PRIORITY,P66_STATUS,P66_ROWS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1017378109605077944)
,p_event_id=>wwv_flow_api.id(1017377966329077943)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1376751865223166785)
,p_stop_execution_on_error=>'Y'
);
end;
/
