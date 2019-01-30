--application/pages/page_00029
prompt  ...PAGE 29: Order Details
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 29
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Order Details'
 ,p_step_title => 'Sample Database Application - Order Details'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188011359373082 + wwv_flow_api.g_id_offset
 ,p_javascript_code => 
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
'var htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';'
 ,p_inline_css => 
'table.uReport tr td {vertical-align: middle !important; }'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20130410111837'
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
  p_id=> 7547716611663280542 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 29,
  p_plug_name=> 'Order #&P29_ORDER_ID.',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1020541354291437570+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_grid_column_span => 8,
  p_plug_display_column=> 3,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
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
s:=s||'select oi.order_item_id, '||unistr('\000a')||
'       oi.order_id, '||unistr('\000a')||
'       oi.product_id, '||unistr('\000a')||
'       oi.unit_price, '||unistr('\000a')||
'       oi.quantity, '||unistr('\000a')||
'       (oi.unit_price * oi.quantity) extended_price,   '||unistr('\000a')||
'       dbms_lob.getlength(product_image) product_image ,'||unistr('\000a')||
'decode(nvl(dbms_lob.getlength(pi.product_image),0),0,null,'||unistr('\000a')||
'    ''<img style="border: 4px solid #CCC; -moz-border-radius: 4px; -webkit-border-radius: 4px;" ''||'||unistr('\000a')||
'    ''src="''||'||unistr('\000a')||
' ';

s:=s||'   apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',pi.product_id)||'||unistr('\000a')||
'    ''" height="75" width="75" alt="Product Image" title="Product Image" />'')'||unistr('\000a')||
'    detail_img'||unistr('\000a')||
'from DEMO_ORDER_ITEMS oi, DEMO_PRODUCT_INFO pi '||unistr('\000a')||
'where oi.ORDER_ID = :P29_ORDER_ID '||unistr('\000a')||
'and oi.product_id = pi.product_id (+)'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 29,
  p_name=> 'Items for Order #&P29_ORDER_ID.',
  p_region_name=>'',
  p_template=> 1020545355391437572+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => false,
  p_grid_column_span => 8,
  p_display_column=> 3,
  p_display_point=> 'BODY_2',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 1020548046412437576+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> '(null)',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'There are no items associated with this Order.',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_report_total_text_format=> '&nbsp;',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'blue_arrow_down.gif',
  p_query_asc_image_attr=> 'width="13" height="12"',
  p_query_desc_image=> 'blue_arrow_up.gif',
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
  p_id=> 7547720007283280599 + wwv_flow_api.g_id_offset,
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CHECK$01',
  p_column_display_sequence=> 1,
  p_column_heading=> '&nbsp;',
  p_column_alignment=>'CENTER',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'CHECKBOX',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_derived_column=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7547718911342280588 + wwv_flow_api.g_id_offset,
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ORDER_ITEM_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Item Id',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '5',
  p_is_required=> false,
  p_pk_col_source_type=> 'T',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'DEMO_ORDER_ITEMS',
  p_ref_column_name=> 'ORDER_ITEM_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7547719009895280588 + wwv_flow_api.g_id_offset,
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ORDER_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Order Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_default=> 'P29_ORDER_ID',
  p_column_default_type=> 'ITEM',
  p_ref_schema=> 'SAMPLE',
  p_ref_table_name=> 'DEMO_ORDER_ITEMS',
  p_ref_column_name=> 'ORDER_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7547719105741280589 + wwv_flow_api.g_id_offset,
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'PRODUCT_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Product Name',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>1,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>7549064320962061040 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_ref_schema=> 'SAMPLE',
  p_ref_table_name=> 'DEMO_ORDER_ITEMS',
  p_ref_column_name=> 'PRODUCT_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7547719213872280589 + wwv_flow_api.g_id_offset,
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'UNIT_PRICE',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Unit Price',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_ref_schema=> 'SAMPLE',
  p_ref_table_name=> 'DEMO_ORDER_ITEMS',
  p_ref_column_name=> 'UNIT_PRICE',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7547719297519280589 + wwv_flow_api.g_id_offset,
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'QUANTITY',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Quantity',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '5',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_default=> '1',
  p_column_default_type=> 'FUNCTION',
  p_lov_display_extra=> 'YES',
  p_ref_schema=> 'SAMPLE',
  p_ref_table_name=> 'DEMO_ORDER_ITEMS',
  p_ref_column_name=> 'QUANTITY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7549110715715570562 + wwv_flow_api.g_id_offset,
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'EXTENDED_PRICE',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Subtotal',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s:=s||'select oi.order_item_id, '||unistr('\000a')||
'       oi.order_id, '||unistr('\000a')||
'       oi.product_id, '||unistr('\000a')||
'       oi.unit_price, '||unistr('\000a')||
'       oi.quantity, '||unistr('\000a')||
'       (oi.unit_price * oi.quantity) extended_price,   '||unistr('\000a')||
'       dbms_lob.getlength(product_image) product_image '||unistr('\000a')||
'from DEMO_ORDER_ITEMS oi, DEMO_PRODUCT_INFO pi '||unistr('\000a')||
'where oi.ORDER_ID = :P29_ORDER_ID '||unistr('\000a')||
'and oi.product_id = pi.product_id (+)';

wwv_flow_api.create_report_columns (
  p_id=> 7402800222636018059 + wwv_flow_api.g_id_offset,
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'PRODUCT_IMAGE',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Product Image',
  p_column_format=> 'IMAGE:DEMO_PRODUCT_INFO:PRODUCT_IMAGE:PRODUCT_ID::MIMETYPE:FILENAME:IMAGE_LAST_UPDATE::attachment:Download',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7567091284061896275 + wwv_flow_api.g_id_offset,
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'DETAIL_IMG',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 7679554034744732021 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 29,
  p_button_sequence=> 30,
  p_button_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P29_ORDER_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7679555320484732041 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 29,
  p_button_sequence=> 50,
  p_button_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_button_name    => 'GET_PREVIOUS_ORDER_ID',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Previous',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:htmldb_goSubmit(''GET_PREVIOUS_ORDER_ID'')',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P29_ORDER_ID_PREV',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_css_classes=>'leftarrow',
  p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7679555211902732041 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 29,
  p_button_sequence=> 60,
  p_button_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_button_name    => 'GET_NEXT_ORDER_ID',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Next',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:htmldb_goSubmit(''GET_NEXT_ORDER_ID'')',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P29_ORDER_ID_NEXT',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_css_classes=>'rightarrow',
  p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7679556911879732073 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 29,
  p_button_sequence=> 80,
  p_button_plug_id => 7547718792999280580+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD_CHANGES_ADD',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Add Item to Order',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7679554227511732022 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 29,
  p_button_sequence=> 10,
  p_button_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:&P29_LAST_PAGE.:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7679553911078732021 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 29,
  p_button_sequence=> 40,
  p_button_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P29_ORDER_ID',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7679554130702732021 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 29,
  p_button_sequence=> 20,
  p_button_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P29_ORDER_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7679556825478732073 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 29,
  p_button_sequence=> 70,
  p_button_plug_id => 7547718792999280580+wwv_flow_api.g_id_offset,
  p_button_name    => 'APPLY_CHANGES_MRD',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete Checked Items',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''APPLY_CHANGES_MRD'');',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'select 1'||unistr('\000a')||
'from "#OWNER#"."DEMO_ORDER_ITEMS" oi'||unistr('\000a')||
'where "ORDER_ID" = :P29_ORDER_ID',
  p_button_condition_type=> 'EXISTS',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>7679555905718732057 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:29:&SESSION.::&DEBUG.::P29_ORDER_ID:&P29_ORDER_ID_PREV.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>7679555320484732041+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'This button is needed for Get Next or Previous Primary Key Value process.');
 
wwv_flow_api.create_page_branch(
  p_id=>7679555828715732056 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:29:&SESSION.::&DEBUG.::P29_ORDER_ID:&P29_ORDER_ID_NEXT.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>7679555211902732041+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'This button is needed for Get Next or Previous Primary Key Value process.');
 
wwv_flow_api.create_page_branch(
  p_id=>7681206711543965999 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:&P11_BRANCH.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 30,
  p_branch_condition_type=> 'REQUEST_IN_CONDITION',
  p_branch_condition=> 'SAVE,DELETE,CREATE',
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>7679557532836732078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 40,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>1020565758955689888 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_branch_name=> 'Calendar Redirect',
  p_branch_action=> 'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11:P11_BRANCH:10',
  p_branch_point=> 'BEFORE_HEADER',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 50,
  p_branch_condition_type=> 'ITEM_IS_NULL',
  p_branch_condition=> 'P29_ORDER_ID',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4168900033638999975 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_TAGS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 45,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tags',
  p_source=>'TAGS',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'PLUGIN_COM.ORACLE.APEX.TAGS',
  p_lov=> 'select tag'||unistr('\000a')||
'  from demo_tags_type_sum'||unistr('\000a')||
' where content_type = ''ORDER'''||unistr('\000a')||
' order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7386709274182280882 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_LAST_PAGE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
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
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7547717096486280547 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_ORDER_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Order Id',
  p_source=>'ORDER_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7547717213215280555 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_CUSTOMER_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Customer Id',
  p_source=>'CUSTOMER_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 22,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_tag_attributes  => 'onchange="htmldb_item_change(this)"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7547717412147280558 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_ORDER_TOTAL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Order Total',
  p_format_mask=>'FML999G999G999G999G990D00',
  p_source=>'ORDER_TOTAL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 8,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_tag_attributes  => 'onchange="htmldb_item_change(this)"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7547717500852280558 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_ORDER_TIMESTAMP',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Order Date',
  p_format_mask=>'DD-MON-YYYY HH:MIPM',
  p_source=>'ORDER_TIMESTAMP',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_tag_css_classes=> 'fullWidth',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Use to change the Sales Rep associated with this order.';

wwv_flow_api.create_page_item(
  p_id=>7547717608929280559 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_USER_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Sales Rep',
  p_source=>'USER_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select distinct user_name d, user_name r from demo_orders '||unistr('\000a')||
'union'||unistr('\000a')||
'select upper(:APP_USER) d, upper(:APP_USER) r from dual'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 22,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7547718211370280569 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_ORDER_ID_NEXT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_prompt=>'P29_ORDER_ID_NEXT',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
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
  p_item_comment => 'This item is needed for Get Next or Previous Primary Key Value process.');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7547718306706280569 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_ORDER_ID_PREV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_prompt=>'P29_ORDER_ID_PREV',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
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
  p_item_comment => 'This item is needed for Get Next or Previous Primary Key Value process.');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7547718397801280572 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_ORDER_ID_COUNT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'class="fielddata"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => 'This item is needed for Get Next or Previous Primary Key Value process.');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7549100097037527159 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 29,
  p_name=>'P29_CUSTOMER_INFO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 7547716611663280542+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Customer Info',
  p_source=>'select apex_escape.html(cust_first_name) || '' '' || apex_escape.html(cust_last_name) || ''<br />'' || apex_escape.html(cust_street_address1) || decode(cust_street_address2, null, null, ''<br />'' || apex_escape.html(cust_street_address2)) || ''</br>'' || apex_escape.html(cust_city) || '', '' || apex_escape.html(cust_state) || ''  '' || apex_escape.html(cust_postal_code) from demo_customers where customer_id = :P29_CUSTOMER_ID',
  p_source_type=> 'QUERY',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7789328884290993135 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_tabular_form_region_id => 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_validation_name => 'PRODUCT_ID Not Null',
  p_validation_sequence=> 10,
  p_validation => 'PRODUCT_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#COLUMN_HEADER# must have a value.',
  p_always_execute=>'N',
  p_associated_column=> 'PRODUCT_ID',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7789706186949135864 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_tabular_form_region_id => 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_validation_name => 'PRODUCT_ID not already entered',
  p_validation_sequence=> 20,
  p_validation => 'select ''x'' from demo_order_items'||unistr('\000a')||
'where order_id = :P29_ORDER_ID'||unistr('\000a')||
'and   order_item_id <> NVL(:ORDER_ITEM_ID, -1)'||unistr('\000a')||
'and   product_id = :PRODUCT_ID',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => '#COLUMN_HEADER# can only be entered once for each order.',
  p_always_execute=>'N',
  p_exec_cond_for_each_row=> 'Y',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'PRODUCT_ID',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7789301872862989861 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_tabular_form_region_id => 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_validation_name => 'QUANTITY Is Not Null (or Zero)',
  p_validation_sequence=> 50,
  p_validation => 'QUANTITY',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#COLUMN_HEADER# must have a value.',
  p_always_execute=>'N',
  p_exec_cond_for_each_row=> 'Y',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'QUANTITY',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7789462257241032716 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_tabular_form_region_id => 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_validation_name => 'QUANTITY is Numeric',
  p_validation_sequence=> 60,
  p_validation => 'QUANTITY',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => '#COLUMN_HEADER# must be numeric.',
  p_always_execute=>'N',
  p_associated_column=> 'QUANTITY',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7789359867105997688 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_tabular_form_region_id => 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_validation_name => 'QUANTITY is Betwwen 1 and 10',
  p_validation_sequence=> 70,
  p_validation => ':QUANTITY > 0 and :QUANTITY <= 10',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => '#COLUMN_HEADER# must be between 1 and 10.',
  p_always_execute=>'N',
  p_exec_cond_for_each_row=> 'Y',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'QUANTITY',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:DEMO_ORDERS:P29_ORDER_ID:ORDER_ID';

wwv_flow_api.create_page_process(
  p_id     => 7679554917975732038 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from DEMO_ORDERS',
  p_process_sql_clob => p,
  p_process_error_message=> 'Unable to fetch row.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:DEMO_ORDERS:ORDER_ID::ORDER_ID::P29_ORDER_ID:P29_ORDER_ID_NEXT:P29_ORDER_ID_PREV::::P29_ORDER_ID_COUNT:';

wwv_flow_api.create_page_process(
  p_id     => 7679555709510732053 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'GET_NEXT_OR_PREV_PK',
  p_process_name=> 'Get Next or Previous Primary Key Value',
  p_process_sql_clob => p,
  p_process_error_message=> 'Unable to run Get Next or Previous Primary Key Value process.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'if :REQUEST = ''CALENDAR'' then'||unistr('\000a')||
'  :P29_LAST_PAGE := ''10'';'||unistr('\000a')||
'elsif :REQUEST = ''SEARCH'' then'||unistr('\000a')||
'  :P29_LAST_PAGE := ''30'';'||unistr('\000a')||
'else'||unistr('\000a')||
'  :P29_LAST_PAGE := ''4'';'||unistr('\000a')||
'end if;';

wwv_flow_api.create_page_process(
  p_id     => 7386678559637276682 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Last Page',
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:DEMO_ORDERS:P29_ORDER_ID:ORDER_ID|IUD';

wwv_flow_api.create_page_process(
  p_id     => 7679555024769732041 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of DEMO_ORDERS',
  p_process_sql_clob => p,
  p_process_error_message=> 'Unable to process row of table DEMO_ORDERS.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> 'Action Processed.  ',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:DEMO_ORDER_ITEMS:ORDER_ITEM_ID';

wwv_flow_api.create_page_process(
  p_id     => 7679557020952732075 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_UPDATE',
  p_process_name=> 'ApplyMRU',
  p_process_sql_clob => p,
  p_process_error_message=> 'Unable to process update',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:DEMO_ORDER_ITEMS:ORDER_ITEM_ID';

wwv_flow_api.create_page_process(
  p_id     => 7679557113490732075 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_DELETE',
  p_process_name=> 'ApplyMRD',
  p_process_sql_clob => p,
  p_process_error_message=> 'Unable to process delete',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'APPLY_CHANGES_MRD,SAVE',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_process_success_message=> '#MRD_COUNT# row(s) deleted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'29';

wwv_flow_api.create_page_process(
  p_id     => 7679555128944732041 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>7679554130702732021 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'1';

wwv_flow_api.create_page_process(
  p_id     => 7679557419607732078 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 29,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_process_type=> 'ADD_ROWS_TO_TABULAR_FORM',
  p_process_name=> 'AddRows',
  p_process_sql_clob => p,
  p_process_error_message=> 'Unable to add rows',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>7679556911879732073 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 29
--
 
begin
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 7547727505128294903 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 1,
  p_query_column_name=> 'ORDER_ITEM_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 7547727621583294905 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 2,
  p_query_column_name=> 'ORDER_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 7547727695455294905 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 3,
  p_query_column_name=> 'PRODUCT_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 7547727795174294905 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 4,
  p_query_column_name=> 'UNIT_PRICE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 7547727917749294905 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 5,
  p_query_column_name=> 'QUANTITY',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 7549110609497570552 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 6,
  p_query_column_name=> 'EXTENDED_PRICE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 7402800121794018058 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 7,
  p_query_column_name=> 'PRODUCT_IMAGE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 7567091199069896271 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 7547718792999280580 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 8,
  p_query_column_name=> 'DETAIL_IMG',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
null;
end;
null;
 
end;
/

 
