--application/pages/page_00001
prompt  ...PAGE 1: Sample Database Application
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Sample Database Application'
 ,p_step_title => 'Sample Database Application'
 ,p_allow_duplicate_submissions => 'Y'
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
'This is the Home Page of the Sample Database Application.  It is intended to be a sales dashboard of sorts - displaying some metrics which are derived in real-time from the database.'||unistr('\000a')||
'<p>'||unistr('\000a')||
'The <strong>My Quota</strong> region is a Flash chart type called  Dial Chart.  It is dynamically rendered based on a SQL Statement each time the page is viewed.  <strong>My Top Orders</strong> displays the top fi'||
've orders for the currently signed in user, based on order total.  The <strong>Tasks</strong> region is an example of using a List to provide easy navigation to common tasks.'
 ,p_last_upd_yyyymmddhh24miss => '20130410112431'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select to_char(o.order_timestamp,''Month DD, YYYY'') order_day,'||unistr('\000a')||
'       SUM(o.order_total) sales,'||unistr('\000a')||
'       ''f?p=&APP_ID.:4:''||:app_session||'':::RIR,4:IREQ_ORDER_DATE:''||trunc(order_timestamp) the_link'||unistr('\000a')||
'from demo_orders o'||unistr('\000a')||
'group by to_char(o.order_timestamp,''Month DD, YYYY''), order_timestamp'||unistr('\000a')||
'order by 2 desc'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 4168659543243827846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Top Orders by Date',
  p_region_name=>'',
  p_region_css_classes=>'m250',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1020545355391437572+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 6,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.CSS_BAR_CHART',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'VALUE_ABSOLUTE',
  p_attribute_10 => '5',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select tag, tag_count'||unistr('\000a')||
'from demo_tags_sum'||unistr('\000a')||
'where tag_count > 0'||unistr('\000a')||
'order by 2 desc, 1';

wwv_flow_api.create_page_plug (
  p_id=> 4168898325973969319 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Tags',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1020544272523437571+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD',
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
  p_attribute_01=> 'f?p=&APP_ID.:30:&APP_SESSION.:::30:P30_SEARCH,P30_OPTIONS:#TAG#,T',
  p_attribute_03 => 'Y',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'sys.htp.prn(''<p class="searchNote">'');'||unistr('\000a')||
'sys.htp.prn(apex_lang.message(''SEARCH_TERM_BLURB''));'||unistr('\000a')||
'sys.htp.prn(''</p>'');';

wwv_flow_api.create_page_plug (
  p_id=> 4169742431401462971 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Search',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_grid_column_span => 6,
  p_plug_display_column=> 4,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<div class="sCustomSearch">',
  p_plug_footer=> '</div>',
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
s:=s||'SELECT b.cust_last_name || '', '' || b.cust_first_name '||unistr('\000a')||
'|| '' - ''|| count(a.order_id) ||'' Order(s)'' customer_name '||unistr('\000a')||
', SUM(a.ORDER_TOTAL) order_total,  b.customer_id id'||unistr('\000a')||
'FROM demo_orders a, DEMO_CUSTOMERS b'||unistr('\000a')||
'WHERE a.customer_id = b.customer_id'||unistr('\000a')||
'GROUP BY b.customer_id, b.cust_last_name || '', '' || b.cust_first_name'||unistr('\000a')||
'ORDER BY NVL(SUM(a.ORDER_TOTAL),0) DESC';

wwv_flow_api.create_report_region (
  p_id=> 7563944891173503886 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_name=> 'Top Customers',
  p_region_name=>'',
  p_template=> 1020545355391437572+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_region_css_classes=>'m250',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => true,
  p_grid_column_span => 6,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 1020548364071437576+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '5',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '5',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7563946568017525523 + wwv_flow_api.g_id_offset,
  p_region_id=> 7563944891173503886 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CUSTOMER_NAME',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_CUSTOMER_ID,P7_BRANCH:#ID#,1',
  p_column_linktext=>'#CUSTOMER_NAME#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
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
  p_id=> 7563945383087503952 + wwv_flow_api.g_id_offset,
  p_region_id=> 7563944891173503886 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ORDER_TOTAL',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
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
  p_id=> 7563946695221525524 + wwv_flow_api.g_id_offset,
  p_region_id=> 7563944891173503886 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
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
s:=s||'Select p.product_name||'' - ''||SUM(oi.quantity)||'' x ''||to_char(p.list_price,''L999G99'')||'''' product,'||unistr('\000a')||
'       SUM(oi.quantity * oi.unit_price) sales,  p.product_id'||unistr('\000a')||
'from demo_order_items oi'||unistr('\000a')||
',    demo_product_info p'||unistr('\000a')||
'where oi.product_id = p.product_id'||unistr('\000a')||
'group by p.Product_id, p.product_name, p.list_price'||unistr('\000a')||
'order by 2 desc';

wwv_flow_api.create_report_region (
  p_id=> 7563946979922538487 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_name=> 'Top Products',
  p_region_name=>'',
  p_template=> 1020545355391437572+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_region_css_classes=>'m250',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => false,
  p_grid_column_span => 6,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 1020548364071437576+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '5',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '5',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7563947586849540473 + wwv_flow_api.g_id_offset,
  p_region_id=> 7563946979922538487 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'PRODUCT',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_PRODUCT_ID,P6_BRANCH:#PRODUCT_ID#,1',
  p_column_linktext=>'#PRODUCT#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
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
  p_id=> 7563947695856540473 + wwv_flow_api.g_id_offset,
  p_region_id=> 7563946979922538487 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'SALES',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
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
  p_id=> 7566968699292887430 + wwv_flow_api.g_id_offset,
  p_region_id=> 7563946979922538487 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'PRODUCT_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
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
s:=s||'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'||unistr('\000a')||
'    codebase="#HOST_PROTOCOL#://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"'||unistr('\000a')||
'    width="#WIDTH#"'||unistr('\000a')||
'    height="#HEIGHT#"'||unistr('\000a')||
'    id="#CHART_NAME#"'||unistr('\000a')||
'    align="top">'||unistr('\000a')||
'<param name="movie" value="#IMAGE_PREFIX#flashchart/anychart_5/swf/#CHART_TYPE#.swf?XMLFile=#HOST#apex_util.flash?p=&APP_ID.:1:&APP_SESSION.:FLOW_FL';

s:=s||'ASH_CHART5_R#REGION_ID#">'||unistr('\000a')||
'<param name="quality" value="high">'||unistr('\000a')||
'<param name="allowScriptAccess" value="sameDomain">'||unistr('\000a')||
'<param name="allowNetworking" value="all">'||unistr('\000a')||
'<param name="scale" value="noscale">'||unistr('\000a')||
'<param name="wmode" value="transparent">'||unistr('\000a')||
'<param name="FlashVars" value="initText=#FLASH_INIT#&xmlLoadingText=#FLASH_LOADING#&resourcesLoadingText=#FLASH_RESOURCES#&noDataText=#FLASH_NO_DATA#&waitingForDataT';

s:=s||'ext=#FLASH_WAITING#&templatesLoadingText=#FLASH_TEMPLATES#">'||unistr('\000a')||
''||unistr('\000a')||
'<embed src="#IMAGE_PREFIX#flashchart/anychart_5/swf/#CHART_TYPE#.swf?XMLFile=#HOST#apex_util.flash?p=&APP_ID.:1:&APP_SESSION.:FLOW_FLASH_CHART5_R#REGION_ID#"'||unistr('\000a')||
'       quality="high"'||unistr('\000a')||
'       width="#WIDTH#"'||unistr('\000a')||
'       height="#HEIGHT#"'||unistr('\000a')||
'       name="#CHART_NAME#"'||unistr('\000a')||
'       scale="noscale"'||unistr('\000a')||
'       align=""'||unistr('\000a')||
'       allowScriptAccess="sameDomain" '||unistr('\000a')||
'     ';

s:=s||'  allowNetworking="all"'||unistr('\000a')||
'       type="application/x-shockwave-flash"'||unistr('\000a')||
'       pluginspage="#HOST_PROTOCOL#://www.macromedia.com/go/getflashplayer"'||unistr('\000a')||
'       wmode="transparent"'||unistr('\000a')||
'       FlashVars="initText=#FLASH_INIT#&xmlLoadingText=#FLASH_LOADING#&resourcesLoadingText=#FLASH_RESOURCES#&noDataText=#FLASH_NO_DATA#&waitingForDataText=#FLASH_WAITING#&templatesLoadingText=#FLASH_TEMPLATES#">'||unistr('\000a')||
'</embed>'||unistr('\000a')||
'</objec';

s:=s||'t>'||unistr('\000a')||
'#CHART_REFRESH#';

wwv_flow_api.create_page_plug (
  p_id=> 7566775187931663779 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Sales for this Month',
  p_region_name=>'',
  p_region_css_classes=>'m250',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1020545355391437572+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_grid_column_span => 6,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'FLASH_CHART5',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_header=> '<div style="width: 350px; margin: 24px auto 0 auto;">',
  p_plug_footer=> '</div>',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1 := null;
wwv_flow_api.create_flash_chart5(
  p_id                     => 7566775384974663785+wwv_flow_api.g_id_offset,
  p_flow_id                => wwv_flow.g_flow_id,
  p_page_id                => 1,
  p_region_id              => 7566775187931663779+wwv_flow_api.g_id_offset,
  p_default_chart_type     =>'GaugeChart',
  p_chart_title            =>'',
  p_chart_rendering        =>'SVG_ONLY',
  p_chart_name             =>'chart_828829718297717919',
  p_chart_width            =>300,
  p_chart_height           =>180,
  p_chart_animation        =>'N',
  p_display_attr           =>':::V:X:N:N:::Y:None:::N:::Default:::S',
  p_dial_tick_attr         =>'T:::Auto:needle:1000:100:90:180::Inside:',
  p_gantt_attr             =>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y:I:N:S:E::',
  p_pie_attr               =>'Outside:::',
  p_map_attr               =>'Orthographic:RegionBounds:REGION_NAME',
  p_map_source             =>'',
  p_margins                =>'-10:3::-50',
  p_omit_label_interval    => null,
  p_bgtype                 =>'Trans',
  p_bgcolor1               =>'',
  p_bgcolor2               =>'',
  p_gradient_rotation      =>null,
  p_grid_bgtype            =>'',
  p_grid_bgcolor1          =>'',
  p_grid_bgcolor2          =>'',
  p_grid_gradient_rotation =>null,
  p_color_scheme           =>'1',
  p_custom_colors          =>'',
  p_map_undef_color_scheme =>'',
  p_map_undef_custom_colors =>'',
  p_x_axis_title           =>'',
  p_x_axis_min             =>null,
  p_x_axis_max             =>null,
  p_x_axis_decimal_place   =>null,
  p_x_axis_prefix          =>'',
  p_x_axis_postfix         =>'',
  p_x_axis_label_rotation  =>'',
  p_x_axis_label_font      =>'::',
  p_x_axis_major_interval  =>null,
  p_x_axis_minor_interval  =>null,
  p_y_axis_title           =>'',
  p_y_axis_min             =>null,
  p_y_axis_max             =>null,
  p_y_axis_decimal_place   =>null,
  p_y_axis_prefix          =>'',
  p_y_axis_postfix         =>'',
  p_y_axis_label_rotation  =>'',
  p_y_axis_label_font      =>'::',
  p_y_axis_major_interval  =>null,
  p_y_axis_minor_interval  =>null,
  p_async_update           =>'N',
  p_async_time             =>null,
  p_legend_title           =>'',
  p_legend_title_font      =>'',
  p_names_font             => null,
  p_names_rotation         => null,
  p_values_font            =>'Arial:10:#000000',
  p_values_rotation        =>null,
  p_values_prefix          =>'',
  p_values_postfix         =>'',
  p_hints_font             =>'Tahoma:10:',
  p_legend_font            =>'::',
  p_grid_labels_font       =>'',
  p_chart_title_font       =>'Tahoma:14:#000000',
  p_x_axis_title_font      =>'Tahoma:14:',
  p_x_axis_title_rotation  =>'',
  p_y_axis_title_font      =>'Tahoma:14:',
  p_y_axis_title_rotation  =>'',
  p_gauge_labels_font      =>'Tahoma:10:#000000',
  p_use_chart_xml          =>'N',
  p_chart_xml              => a1);
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select sum(o.order_total) total, 10000 max, 0 low, sum(o.order_total) high'||unistr('\000a')||
'from demo_orders o'||unistr('\000a')||
'where order_timestamp >= to_date(to_char(sysdate,''YYYYMM'')||''01'',''YYYYMMDD'')';

wwv_flow_api.create_flash_chart5_series(
  p_id                        => 7566775494742663796+wwv_flow_api.g_id_offset,
  p_chart_id                  => 7566775384974663785+wwv_flow_api.g_id_offset,
  p_flow_id                   => wwv_flow.g_flow_id,
  p_series_seq                =>10,
  p_series_name               =>'Series 1',
  p_series_query              => a1,
  p_series_type               =>'',
  p_series_query_type         =>'SQL_QUERY',
  p_series_ajax_items_to_submit=>'',
  p_series_query_parse_opt    =>'PARSE_CHART_QUERY',
  p_series_query_no_data_found=>'No sales found for current month.',
  p_series_query_row_count_max=>15,
  p_action_link               =>'',
  p_show_action_link          =>'N',
  p_action_link_checksum_type =>'',
  p_display_when_cond_type    =>'',
  p_display_when_condition    =>'',
  p_display_when_condition2   =>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 1738974792290922708 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 10,
  p_button_plug_id => 7566775187931663779+wwv_flow_api.g_id_offset,
  p_button_name    => 'VIEW_MONTH_ORDERS',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'View Orders for this Month',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RIR,4:IRGTE_ORDER_DATE:&P1_THIS_MONTH.',
  p_button_css_classes=>'rightarrow insetButton',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7563948483994558552 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 20,
  p_button_plug_id => 7563944891173503886+wwv_flow_api.g_id_offset,
  p_button_name    => 'VIEW_CUSTOMERS',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'View Customers',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::',
  p_button_css_classes=>'rightarrow insetButton',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7566789786489909330 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 40,
  p_button_plug_id => 7563946979922538487+wwv_flow_api.g_id_offset,
  p_button_name    => 'VIEW_PRODUCTS',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'View Products',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::',
  p_button_css_classes=>'rightarrow insetButton',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7566786890036891398 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 60,
  p_button_plug_id => 4168659543243827846+wwv_flow_api.g_id_offset,
  p_button_name    => 'VIEW_ORDERS',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'View Orders',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::',
  p_button_css_classes=>'rightarrow insetButton',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4168817425701507067 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 30,
  p_button_plug_id => 7563944891173503886+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD_CUSTOMER',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Add Customer',
  p_button_position=> 'REGION_TEMPLATE_EDIT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7:P7_BRANCH:1',
  p_button_css_classes=>'plus insetButton',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4168817641416520995 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 50,
  p_button_plug_id => 7563946979922538487+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD_PRODUCT',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Add Product',
  p_button_position=> 'REGION_TEMPLATE_EDIT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6:P6_BRANCH:1',
  p_button_css_classes=>'plus insetButton',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1367131783553478087 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 70,
  p_button_plug_id => 4168659543243827846+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD_ORDER',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020555073902437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Enter New Order',
  p_button_position=> 'REGION_TEMPLATE_EDIT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11:P11_BRANCH:1',
  p_button_css_classes=>'plus insetButton',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>4169752529023490647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:1,30:P30_SEARCH:&P1_SEARCH.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 13-APR-2012 07:39 by MIKE');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1738976220936955010 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_THIS_MONTH',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 7566775187931663779+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'PLSQL_EXPRESSION',
  p_prompt=>'This Month',
  p_source=>'select to_char(to_date(to_char(sysdate ,''YYMM'')||''01'',''YYMMDD''),''DS'') from dual',
  p_source_type=> 'QUERY',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4169743124259470299 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SEARCH',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4169742431401462971+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Search customers, orders and product data',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 70,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_css_classes=> 'searchField fullWidth',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1020553371836437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 4168663143421865721 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_computation_sequence => 10,
  p_computation_item=> 'LAST_VIEW',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '&APP_PAGE_ID.',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
