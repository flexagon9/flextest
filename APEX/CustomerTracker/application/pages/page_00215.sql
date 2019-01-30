--application/pages/page_00215
prompt  ...PAGE 215: Order Calendar
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 215
 ,p_user_interface_id => 1725024220874723827 + wwv_flow_api.g_id_offset
 ,p_name => 'Order Calendar'
 ,p_step_title => 'Order Calendar'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Order Calendar'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188113783373791 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20130708094708'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select o.rowid,'||unistr('\000a')||
'       order_id,'||unistr('\000a')||
'       (select cust_first_name||'' ''||cust_last_name '||unistr('\000a')||
'        from demo_customers c'||unistr('\000a')||
'        where c.customer_id = o.customer_id)'||unistr('\000a')||
'        ||'' [''||to_char(order_total,''FML999G999G999G999G990D00'')||'']'' customer,'||unistr('\000a')||
'       order_timestamp'||unistr('\000a')||
'from demo_orders o';

wwv_flow_api.create_calendar (
  p_id=> 1737245289415416845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 215,
  p_plug_name=> 'Order Calendar',
  p_region_name=>'',
  p_plug_source=> s,
  p_plug_source_type  => 'CALENDAR',
  p_plug_template=> 1024080949442455930+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column  => null,
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
  p_cal_id=>1737245489560416846 + wwv_flow_api.g_id_offset,
  p_start_date=>'',
  p_end_date=>'',
  p_begin_at_start_of_interval=>'Y',
  p_date_item=>'P215_CALENDAR_DATE',
  p_display_as=>'M',
  p_display_item=>'',
  p_display_type=>'COL',
  p_item_format=>'',
  p_easy_sql_owner=>'',
  p_easy_sql_table=>'',
  p_date_column=>'ORDER_TIMESTAMP',
  p_end_date_column=>'',
  p_display_column=>'CUSTOMER',
  p_start_of_week=>'19721105',
  p_day_link=>'',
  p_item_link=>'f?p=&FLOW_ID.:206:&SESSION.::&DEBUG.:206:P206_ROWID,P206_ORDER_TIMESTAMP:#PRIMARY_KEY_VALUE#,#DATE_VALUE#',
  p_start_time=>'',
  p_end_time=>'',
  p_time_format=>'',
  p_week_start_day=>'',
  p_week_end_day=>'',
  p_date_type_column=>'P215_CALENDAR_TYPE',
  p_end_date_item=>'P215_CALENDAR_END_DATE',
  p_include_custom_cal=>'N',
  p_custom_cal_days=>3,
  p_primary_key_column=>'ROWID',
  p_data_background_color=>'',
  p_item_link_primary_key_item=>'P206_ROWID',
  p_item_link_date_item=>'P206_ORDER_TIMESTAMP',
  p_item_link_open_in=>'W',
  p_include_time_with_date=>'N',
  p_data_text_color=>'',
  p_agenda_cal_days_type=>'MONTH',
  p_agenda_cal_days=>30,
  p_calendar_type=>'A',
  p_template_id=>1024084372876455932 + wwv_flow_api.g_id_offset,
  p_calendar_comments=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1737246299961416849 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 215,
  p_plug_name=> 'Calendar Buttons',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1730214302087457492+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 1737246502490416849 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 215,
  p_button_sequence=> 10,
  p_button_plug_id => 1737246299961416849+wwv_flow_api.g_id_offset,
  p_button_name    => 'MONTHLY',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Monthly',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''M'',''same''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_cattributes=>'data-mini="true"',
  p_button_comment=>'Generated 08/10/2012',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1737246707879416849 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 215,
  p_button_sequence=> 20,
  p_button_plug_id => 1737246299961416849+wwv_flow_api.g_id_offset,
  p_button_name    => 'WEEKLY',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Weekly',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''W'',''same''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_condition_type=> 'NEVER',
  p_button_cattributes=>'data-mini="true"',
  p_button_comment=>'Generated 08/10/2012',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1737246912239416849 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 215,
  p_button_sequence=> 30,
  p_button_plug_id => 1737246299961416849+wwv_flow_api.g_id_offset,
  p_button_name    => 'DAILY',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Daily',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''D'',''same''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_condition_type=> 'NEVER',
  p_button_cattributes=>'data-mini="true"',
  p_button_comment=>'Generated 08/10/2012',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1737247112558416850 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 215,
  p_button_sequence=> 40,
  p_button_plug_id => 1737246299961416849+wwv_flow_api.g_id_offset,
  p_button_name    => 'LISTVIEW',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'List',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''A'',''same''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_cattributes=>'data-mini="true"',
  p_button_comment=>'Generated 08/10/2012',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1737247301299416850 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 215,
  p_button_sequence=> 50,
  p_button_plug_id => 1737246299961416849+wwv_flow_api.g_id_offset,
  p_button_name    => 'PREVIOUS',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> '<',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''S'',''previous''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_cattributes=>'data-mini="true"',
  p_button_comment=>'Generated 08/10/2012',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1737247512815416850 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 215,
  p_button_sequence=> 60,
  p_button_plug_id => 1737246299961416849+wwv_flow_api.g_id_offset,
  p_button_name    => 'TODAY',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Today',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''S'',''today''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_cattributes=>'data-mini="true"',
  p_button_comment=>'Generated 08/10/2012',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1737247692156416850 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 215,
  p_button_sequence=> 70,
  p_button_plug_id => 1737246299961416849+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> '>',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:apex.widget.calendar.ajax_calendar(''S'',''next''); void(0);',
  p_button_execute_validations=>'Y',
  p_button_cattributes=>'data-mini="true"',
  p_button_comment=>'Generated 08/10/2012',
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
  p_id=>1737245706770416847 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 215,
  p_name=>'P215_CALENDAR_TYPE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1737245289415416845+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'P215_CALENDAR_DISPLAY',
  p_source=>'P215_CALENDAR_TYPE',
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
  p_item_comment => 'Generated by Calendar wizard on 08/10/2012');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1737245894707416848 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 215,
  p_name=>'P215_CALENDAR_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1737245289415416845+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'return sysdate;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'Start Date',
  p_source=>'P215_CALENDAR_DATE',
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
  p_item_comment => 'Generated by Calendar wizard on 08/10/2012');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1737246113991416848 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 215,
  p_name=>'P215_CALENDAR_END_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1737245289415416845+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'return sysdate+3;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'End Date',
  p_source=>'P215_CALENDAR_END_DATE',
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
  p_item_comment => 'Generated by Calendar wizard on 08/10/2012');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 215
--
 
begin
 
null;
end;
null;
 
end;
/

 
