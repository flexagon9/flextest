--application/pages/page_00214
prompt  ...PAGE 214: Tags
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 214
 ,p_user_interface_id => 1725024220874723827 + wwv_flow_api.g_id_offset
 ,p_name => 'Tags'
 ,p_step_title => 'Tags'
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
 ,p_last_upd_yyyymmddhh24miss => '20130410112004'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select tag, tag_count'||unistr('\000a')||
'  from demo_tags_type_sum'||unistr('\000a')||
' where content_type = ''CUSTOMER'''||unistr('\000a')||
'   and tag_count > 0';

wwv_flow_api.create_page_plug (
  p_id=> 1734260716891585475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 214,
  p_plug_name=> 'Customer Tags',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1024081250412455930+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'f?p=&APP_ID.:201:&APP_SESSION.:::201:P201_TAGS,P201_DISPLAY_TAGS:#TAG#,#TAG#',
  p_attribute_03 => 'Y',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select tag, tag_count'||unistr('\000a')||
'  from demo_tags_type_sum'||unistr('\000a')||
' where content_type = ''PRODUCT'''||unistr('\000a')||
'   and tag_count > 0';

wwv_flow_api.create_page_plug (
  p_id=> 1734261020610587910 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 214,
  p_plug_name=> 'Product Tags',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1024081250412455930+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'f?p=&APP_ID.:203:&APP_SESSION.:::203:P203_TAGS,P203_DISPLAY_TAGS:#TAG#,#TAG#',
  p_attribute_03 => 'Y',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select tag, tag_count'||unistr('\000a')||
'  from demo_tags_type_sum'||unistr('\000a')||
' where content_type = ''ORDER'''||unistr('\000a')||
'   and tag_count > 0';

wwv_flow_api.create_page_plug (
  p_id=> 1734261606196593214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 214,
  p_plug_name=> 'Order Tags',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1024081250412455930+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'f?p=&APP_ID.:205:&APP_SESSION.:::205:P205_TAGS:#TAG#',
  p_attribute_03 => 'Y',
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
-- ...updatable report columns for page 214
--
 
begin
 
null;
end;
null;
 
end;
/

 
