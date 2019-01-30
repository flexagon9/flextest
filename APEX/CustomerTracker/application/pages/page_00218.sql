--application/pages/page_00218
prompt  ...PAGE 218: Order Summary
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 218
 ,p_user_interface_id => 1725024220874723827 + wwv_flow_api.g_id_offset
 ,p_name => 'Order Summary'
 ,p_step_title => 'Create Order'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Order Summary'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188011359373082 + wwv_flow_api.g_id_offset
 ,p_step_template => 1024076559711455926 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20130213084312'
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
  p_id=> 1371936692230465441 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 218,
  p_plug_name=> 'Order Summary',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1024081552276455930+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 1024082775010455931+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 1725024315711723827+ wwv_flow_api.g_id_offset,
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
s:=s||'begin'||unistr('\000a')||
'for x in (select c.cust_first_name, c.cust_last_name, cust_street_address1, cust_street_address2, cust_city, cust_state, cust_postal_code from demo_customers c, demo_orders o'||unistr('\000a')||
'where c.customer_id = o.customer_id and o.order_id = :P218_ORDER_ID)'||unistr('\000a')||
'loop'||unistr('\000a')||
'  htp.p(''<span style="font-size:16px;font-weight:bold;">ORDER #'' || apex_escape.html(:P218_ORDER_ID) || ''</span><br />'');'||unistr('\000a')||
'  htp.p(apex_escape.htm';

s:=s||'l(x.cust_first_name) || '' '' || apex_escape.html(x.cust_last_name) || ''<br />'');'||unistr('\000a')||
'  htp.p(apex_escape.html(x.cust_street_address1) || ''<br />'');'||unistr('\000a')||
'  if x.cust_street_address2 is not null then'||unistr('\000a')||
'      htp.p(apex_escape.html(x.cust_street_address2) || ''<br />'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  htp.p(apex_escape.html(x.cust_city) || '', '' || apex_escape.html(x.cust_state) || ''  '' || apex_escape.html(x.cust_postal_code) || ''<br';

s:=s||' /><br />'');'||unistr('\000a')||
'end loop;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 1371936884650465441 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 218,
  p_plug_name=> 'Order Header',
  p_region_name=>'',
  p_parent_plug_id=>1371936692230465441 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_list_template_id=> 1024082775010455931+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 1725024315711723827+ wwv_flow_api.g_id_offset,
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
s:=s||'select p.product_name, oi.unit_price, oi.quantity, (oi.unit_price * oi.quantity) exteneded_price   '||unistr('\000a')||
'from demo_order_items oi, demo_product_info p'||unistr('\000a')||
'where oi.product_id = p.product_id and oi.order_id = :P218_ORDER_ID';

wwv_flow_api.create_report_region (
  p_id=> 1371937104559465442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 218,
  p_name=> 'Order Lines',
  p_region_name=>'',
  p_parent_plug_id=>1371936692230465441 + wwv_flow_api.g_id_offset,
  p_template=> 973953975527808808+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 1,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_report_total_text_format=> 'Report Total',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_template_id=> 1725024315711723827+ wwv_flow_api.g_id_offset,
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12"',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12"',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1371937296199465443 + wwv_flow_api.g_id_offset,
  p_region_id=> 1371937104559465442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'PRODUCT_NAME',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Product Name',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>1,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1371937395465465443 + wwv_flow_api.g_id_offset,
  p_region_id=> 1371937104559465442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'UNIT_PRICE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Unit Price',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1371937495046465443 + wwv_flow_api.g_id_offset,
  p_region_id=> 1371937104559465442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'QUANTITY',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Quantity',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'Y',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1371937605011465443 + wwv_flow_api.g_id_offset,
  p_region_id=> 1371937104559465442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'EXTENEDED_PRICE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Subtotal',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'Y',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1372054007047380671 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 218,
  p_plug_name=> 'Butons',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 80,
  p_plug_new_grid         => true,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 1372054401647380672 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 218,
  p_button_sequence=> 30,
  p_button_plug_id => 1372054007047380671+wwv_flow_api.g_id_offset,
  p_button_name    => 'Orders',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'View Orders',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:205:&SESSION.::&DEBUG.:::',
  p_button_cattributes=>'label="NEXT"',
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
  p_id=>1371937688306465443 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 218,
  p_name=>'P218_ORDER_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1371936692230465441+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 218
--
 
begin
 
null;
end;
null;
 
end;
/

 
