--application/pages/page_00199
prompt  ...PAGE 199: Global Page - jQuery Mobile Smartphone
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 199
 ,p_user_interface_id => 1725024220874723827 + wwv_flow_api.g_id_offset
 ,p_name => 'Global Page - jQuery Mobile Smartphone'
 ,p_step_title => 'Global Page - jQuery Mobile Smartphone'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188113783373791 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'D'
 ,p_cache_page_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20120822114106'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<style>'||unistr('\000a')||
'div.sideCartItem{padding:8px 8px 0 8px;font:normal 11px/14px Arial,sans-serif;} '||unistr('\000a')||
'div.sideCartItem a{color:#000;} '||unistr('\000a')||
'div.sideCartItem strong,div.sideCartItem span{display:block;text-align:right;padding:8px 0 0 0;} '||unistr('\000a')||
'div.sideCartItem span{padding:4px 0 0 0;} '||unistr('\000a')||
'div.sideCartItem span.subtotal{font-weight:bold;} '||unistr('\000a')||
'div.sideCartItem p{margin:4px 0 0 0;padding:0 0 8px 0;font:normal 11px/14px Arial,sans';

s:=s||'-serif;position:relative;} '||unistr('\000a')||
'div.sideCartItem p span{padding:0;font-weight:bold;text-align: right;} '||unistr('\000a')||
'div.sideCartTotal{border-top:1px solid #FFF;margin-top:8px;padding:8px;border-top:1px dotted #AAA;} '||unistr('\000a')||
'div.sideCartTotal span{display:block;text-align:right;font:normal 11px/14px Arial,sans-serif;padding:0 0 4px 0;} '||unistr('\000a')||
'div.sideCartTotal p{padding:0;margin:0;font:normal 11px/14px Arial,sans-serif;positio';

s:=s||'n:relative;} '||unistr('\000a')||
'div.sideCartTotal p.sideCartTotal{font:bold 12px/14px Arial,sans-serif;padding:8px 0 0 0;} '||unistr('\000a')||
'div.sideCartTotal p.sideCartTotal span{font:bold 12px/14px Arial,sans-serif;padding:8px 0 0 0;} '||unistr('\000a')||
'div.sideCartTotal p span{padding:0;position:absolute;right:0;top:0;} '||unistr('\000a')||
'div.demoCustomerInfo{}'||unistr('\000a')||
'div.demoCustomerInfo strong{font:bold 12px/16px Arial,sans-serif;display:block;width:120px;}'||unistr('\000a')||
'div.demoCus';

s:=s||'tomerInfo p{display:block;margin:0; font: normal 12px/16px Arial, sans-serif;}'||unistr('\000a')||
'div.demoProducts{clear:both;margin:16px 0 0 0;padding:0 8px 0 0;}'||unistr('\000a')||
'div.demoProducts table{border:1px solid #CCC;border-bottom:none;}'||unistr('\000a')||
'div.demoProducts table th{background-color:#DDD;color:#000;font:bold 12px/16px Arial,sans-serif;padding:4px 10px;text-align:right;border-bottom:1px solid #CCC;}'||unistr('\000a')||
'div.demoProducts table td{bo';

s:=s||'rder-bottom:1px solid #CCC;font:normal 12px/16px Arial,sans-serif;padding:4px 10px;text-align:right;}'||unistr('\000a')||
'div.demoProducts table td a{color:#000;}'||unistr('\000a')||
'div.demoProducts .left{text-align:left;}'||unistr('\000a')||
'div.demoCurrentOrder{margin:16px 0 0 0; border-left: 1px solid #CCC; padding: 0 0 0 8px}'||unistr('\000a')||
'strong.demoTitle{font:bold 12px/16px Arial,sans-serif;display:block;padding: 4px 10px; background-color: #DDD; border: 1px soli';

s:=s||'d #CCC}'||unistr('\000a')||
'a.demoAddtoCart {'||unistr('\000a')||
'display: block;'||unistr('\000a')||
'float: right;'||unistr('\000a')||
'padding: 2px 6px;'||unistr('\000a')||
'background-color: #CCC;'||unistr('\000a')||
'color: #FFF;'||unistr('\000a')||
'text-decoration: none;'||unistr('\000a')||
'-moz-border-radius: 4px;'||unistr('\000a')||
'-webkit-border-radius: 4px;'||unistr('\000a')||
'	}'||unistr('\000a')||
'a.demoAddtoCart:hover {background-color: #80A2BB; color: #FFF}'||unistr('\000a')||
'		</style>';

wwv_flow_api.create_page_plug (
  p_id=> 976812446778787189 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 199,
  p_plug_name=> 'Mobile Styles',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1729968603015849221 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 199,
  p_plug_name=> 'Header',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1024080368359455930+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '1001',
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1730214302087457492 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 199,
  p_plug_name=> 'Footer',
  p_region_name=>'',
  p_region_css_classes=>'ui-bar',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1024079756307455929+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'NEVER',
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1730410115073978236 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 199,
  p_plug_name=> 'Footer Controls',
  p_region_name=>'',
  p_region_attributes=> 'style="text-align:center"',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1024079756307455929+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 1730409303406978234 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 1024082145644455931+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '1001',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 1730340510304753168 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 199,
  p_button_sequence=> 10,
  p_button_plug_id => 1729968603015849221+wwv_flow_api.g_id_offset,
  p_button_name    => 'HOME',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1024083870312455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Home',
  p_button_position=> 'REGION_TEMPLATE_PREVIOUS',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::',
  p_button_condition=> '200',
  p_button_condition_type=> 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_button_cattributes=>'data-icon="home" data-iconpos="notext" data-direction="reverse"',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 199
--
 
begin
 
null;
end;
null;
 
end;
/

 
