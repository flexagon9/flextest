--application/pages/page_00010
prompt  ...PAGE 10: Order Calendar
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 10
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Order Calendar'
 ,p_step_title => 'Sample Database Application - Order Calendar'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Order Calendar'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188011359373082 + wwv_flow_api.g_id_offset
 ,p_step_template => 1020515051496437553 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20120827070126'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1368984793501961251 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_plug_name=> 'Order Pages',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 1368350198762792452 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 1020551064048437577+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select order_id,'||unistr('\000a')||
'       (select cust_first_name||'' ''||cust_last_name '||unistr('\000a')||
'        from demo_customers c'||unistr('\000a')||
'        where c.customer_id = o.customer_id)'||unistr('\000a')||
'        ||'' [''||to_char(order_total,''FML999G999G999G999G990D00'')||'']'' customer,'||unistr('\000a')||
'       order_timestamp'||unistr('\000a')||
'from demo_orders o';

wwv_flow_api.create_calendar (
  p_id=> 7829740362575622608 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_plug_name=> 'Order Calendar',
  p_region_name=>'',
  p_plug_source=> s,
  p_plug_source_type  => 'CALENDAR',
  p_plug_template=> 1020545355391437572+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column  => 1,
  p_plug_display_point   => 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_display_condition_type => '',
  p_plug_display_when_condition => '',
  p_plug_display_when_cond2=>'',
  p_plug_read_only_when_type => '',
  p_plug_read_only_when => '',
  p_plug_read_only_when2 =>'',
  p_plug_caching => 'NOT_CACHED',
  p_plug_header=> '',
  p_plug_footer=> '',
  p_plug_override_reg_pos=>'',
  p_plug_customized=>'0',
  p_plug_customized_name=>'',
  p_translate_title=>'Y',
  p_rest_enabled=>'',
  p_plug_comment=> '',
  p_cal_id=>7829740960142622610 + wwv_flow_api.g_id_offset,
  p_start_date=>'',
  p_end_date=>'',
  p_begin_at_start_of_interval=>'Y',
  p_date_item=>'P10_CALENDAR_DATE',
  p_display_as=>'M',
  p_display_item=>'P10_CALENDAR_DISPLAY',
  p_display_type=>'COL',
  p_item_format=>'',
  p_easy_sql_owner=>'',
  p_easy_sql_table=>'',
  p_date_column=>'ORDER_TIMESTAMP',
  p_end_date_column=>'',
  p_display_column=>'CUSTOMER',
  p_start_of_week=>'19721105',
  p_day_link=>'',
  p_item_link=>'f?p=&FLOW_ID.:29:&SESSION.:CALENDAR:&DEBUG.:29:P29_ORDER_ID,P29_ORDER_TIMESTAMP:#PRIMARY_KEY_VALUE#,#DATE_VALUE#',
  p_start_time=>'8',
  p_end_time=>'18',
  p_time_format=>'24HOUR',
  p_week_start_day=>'19721105',
  p_week_end_day=>'19721111',
  p_date_type_column=>'P10_CALENDAR_TYPE',
  p_end_date_item=>'P10_CALENDAR_END_DATE',
  p_include_custom_cal=>'N',
  p_custom_cal_days=>3,
  p_primary_key_column=>'ORDER_ID',
  p_drag_drop_process_id=>7829860086311743011 + wwv_flow_api.g_id_offset,
  p_data_background_color=>'',
  p_item_link_primary_key_item=>'P29_ORDER_ID',
  p_item_link_date_item=>'P29_ORDER_TIMESTAMP',
  p_item_link_open_in=>'W',
  p_include_time_with_date=>'N',
  p_data_text_color=>'',
  p_agenda_cal_days_type=>'MONTH',
  p_agenda_cal_days=>30,
  p_calendar_type=>'A',
  p_template_id=>1020555361497437579 + wwv_flow_api.g_id_offset,
  p_calendar_comments=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 7829741772168622612 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 10,
  p_button_sequence=> 10,
  p_button_plug_id => 7829740362575622608+wwv_flow_api.g_id_offset,
  p_button_name    => 'MONTHLY',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Monthly',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''M'',''same''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_comment=>'Generated 07/08/2011',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1373128294298962864 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 10,
  p_button_sequence=> 40,
  p_button_plug_id => 7829740362575622608+wwv_flow_api.g_id_offset,
  p_button_name    => 'LISTVIEW',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'List',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''A'',''same''); void(0);',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7829742361246622612 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 10,
  p_button_sequence=> 60,
  p_button_plug_id => 7829740362575622608+wwv_flow_api.g_id_offset,
  p_button_name    => 'PREVIOUS',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Previous',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''S'',''previous''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'leftarrow',
  p_button_comment=>'Generated 07/08/2011',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7829742559599622612 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 10,
  p_button_sequence=> 70,
  p_button_plug_id => 7829740362575622608+wwv_flow_api.g_id_offset,
  p_button_name    => 'TODAY',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Today',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''S'',''today''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_comment=>'Generated 07/08/2011',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7829742788714622613 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 10,
  p_button_sequence=> 80,
  p_button_plug_id => 7829740362575622608+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Next',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''S'',''next''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'rightarrow',
  p_button_comment=>'Generated 07/08/2011',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7829741277371622611 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_CALENDAR_TYPE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 7829740362575622608+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'P10_CALENDAR_DISPLAY',
  p_source=>'P10_CALENDAR_TYPE',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => 'Generated by Calendar wizard on 07/08/2011');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7829741463519622611 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_CALENDAR_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 7829740362575622608+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'return sysdate;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'Start Date',
  p_source=>'P10_CALENDAR_DATE',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => 'Generated by Calendar wizard on 07/08/2011');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7829741660629622611 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_CALENDAR_END_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 7829740362575622608+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'return sysdate+7;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'End Date',
  p_source=>'P10_CALENDAR_END_DATE',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => 'Generated by Calendar wizard on 07/08/2011');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'    l_date_value         varchar2(32767) := apex_application.g_x01;'||unistr('\000a')||
'    l_primary_key_value  varchar2(32767) := apex_application.g_x02;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    update "DEMO_ORDERS" set "ORDER_TIMESTAMP" = to_date(l_date_value,''RRRRMMDDHH24MISS'') where "ORDER_ID"= l_primary_key_value;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 7829860086311743011 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 10,
  p_process_sequence=> 10,
  p_process_point=> 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Apex.Calendar.Drag_Drop.Process.f8950.p10',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 10
--
 
begin
 
null;
end;
null;
 
end;
/

 
