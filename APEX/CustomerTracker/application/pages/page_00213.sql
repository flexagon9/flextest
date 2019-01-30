--application/pages/page_00213
prompt  ...PAGE 213: Sales by State
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 213
 ,p_user_interface_id => 1725024220874723827 + wwv_flow_api.g_id_offset
 ,p_name => 'Sales by State'
 ,p_step_title => 'Sales by State'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188113783373791 + wwv_flow_api.g_id_offset
 ,p_step_template => 1024076559711455926 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20130410112001'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select initcap(s.state_name) label, '||unistr('\000a')||
'       SUM(oi.quantity * oi.unit_price) sales,'||unistr('\000a')||
'       null the_link'||unistr('\000a')||
'from demo_orders o, demo_order_items oi, demo_customers p, demo_states s'||unistr('\000a')||
'where o.order_id = oi.order_id'||unistr('\000a')||
'and o.customer_id = p.customer_id'||unistr('\000a')||
'and p.cust_state = s.st'||unistr('\000a')||
'and (nvl(:P31_PRODUCT_ID,''0'') = ''0'' or :P31_PRODUCT_ID = oi.product_id)'||unistr('\000a')||
'group by state_name '||unistr('\000a')||
'order by 3 desc';

wwv_flow_api.create_page_plug (
  p_id=> 1734059702450786881 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 213,
  p_plug_name=> 'Sales by State',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1024080949442455930+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
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
  p_attribute_02 => '$',
  p_attribute_10 => '15',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 213
--
 
begin
 
null;
end;
null;
 
end;
/

 
