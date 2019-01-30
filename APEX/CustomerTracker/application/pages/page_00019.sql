--application/pages/page_00019
prompt  ...PAGE 19: Product Order Tree
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 19
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Product Order Tree'
 ,p_step_title => 'Sample Database Application - Product Order Tree'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Orders by Category'
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
 ,p_last_upd_yyyymmddhh24miss => '20120823082503'
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
  p_id=> 7567338871547769994 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 19,
  p_plug_name=> 'Product Orders',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1020544272523437571+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'JSTREE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_no_data_found=>'No data found.',
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'with data as ('||unistr('\000a')||
'select ''M'' as link_type,'||unistr('\000a')||
'       null as parent,'||unistr('\000a')||
'       ''All Categories'' as id,'||unistr('\000a')||
'       ''All Categories'' as name,'||unistr('\000a')||
'       null as sub_id'||unistr('\000a')||
'  from demo_product_info'||unistr('\000a')||
'union'||unistr('\000a')||
'select distinct(''C'') as link_type,'||unistr('\000a')||
'       ''All Categories'' as parent,'||unistr('\000a')||
'       category as id,'||unistr('\000a')||
'       category as name,'||unistr('\000a')||
'       null as sub_id'||unistr('\000a')||
'  from demo_product_info'||unistr('\000a')||
'union'||unistr('\000a')||
'select ''P'' as link_type,'||unistr('\000a')||
'       category parent,'||unistr('\000a')||
'';

a1:=a1||'       to_char(product_id) id,'||unistr('\000a')||
'       product_name as name,'||unistr('\000a')||
'       product_id as sub_id'||unistr('\000a')||
'  from demo_product_info'||unistr('\000a')||
'union'||unistr('\000a')||
'select ''O'' as link_type,'||unistr('\000a')||
'       to_char(product_id) as parent,'||unistr('\000a')||
'       null as id,'||unistr('\000a')||
'       (select c.cust_first_name || '' '' || c.cust_last_name  '||unistr('\000a')||
'          from demo_customers c, demo_orders o'||unistr('\000a')||
'         where c.customer_id = o.customer_id'||unistr('\000a')||
'           and o.order_id    = oi.order_id ) ';

a1:=a1||'|| '', ordered ''||to_char(oi.quantity) as name,'||unistr('\000a')||
'       order_id as sub_id'||unistr('\000a')||
'  from demo_order_items oi'||unistr('\000a')||
')'||unistr('\000a')||
'select case when connect_by_isleaf = 1 then 0'||unistr('\000a')||
'            when level = 1             then 1'||unistr('\000a')||
'            else                           -1'||unistr('\000a')||
'       end as status, '||unistr('\000a')||
'       level, '||unistr('\000a')||
'       name as title, '||unistr('\000a')||
'       null as icon, '||unistr('\000a')||
'       id as value, '||unistr('\000a')||
'       ''View'' as tooltip, '||unistr('\000a')||
'       case when link_type = ';

a1:=a1||'''M'''||unistr('\000a')||
'            then apex_util.prepare_url(''f?p=''||:APP_ID||'':3:''||:APP_SESSION||''::NO:RIR'')'||unistr('\000a')||
'            when link_type = ''C'''||unistr('\000a')||
'            then apex_util.prepare_url(''f?p=''||:APP_ID||'':3:''||:APP_SESSION||''::NO:CIR:IR_CATEGORY:'''||unistr('\000a')||
'                 ||name)'||unistr('\000a')||
'            when link_type = ''P'''||unistr('\000a')||
'            then apex_util.prepare_url(''f?p=''||:APP_ID||'':6:''||:APP_SESSION||''::NO::P6_PRODUCT_ID,P6_BRANCH:'''||unistr('\000a')||
'     ';

a1:=a1||'            ||sub_id||'',19'')'||unistr('\000a')||
'            when link_type = ''O'''||unistr('\000a')||
'            then apex_util.prepare_url(''f?p=''||:APP_ID||'':29:''||:APP_SESSION||''::NO::P29_ORDER_ID:'''||unistr('\000a')||
'                 || sub_id)'||unistr('\000a')||
'            else null'||unistr('\000a')||
'            end as link '||unistr('\000a')||
'from data'||unistr('\000a')||
'start with parent is null'||unistr('\000a')||
'connect by prior id = parent'||unistr('\000a')||
'order siblings by name';

wwv_flow_api.create_jstree(
  p_id => 7567339066810769996+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id => 19,
  p_region_id => 7567338871547769994+wwv_flow_api.g_id_offset,
  p_tree_template     =>'default',
  p_tree_source             =>'EMP',
  p_tree_query             =>a1,
  p_tree_node_title   =>'MGR',
  p_tree_node_value   =>'ENAME',
  p_tree_node_icon   =>'',
  p_tree_node_link   =>'',
  p_tree_node_hints   =>'ENAME',
  p_tree_start_item   =>'MGR',
  p_tree_start_value   =>'',
  p_tree_button_option   =>'CONTRACT_ALL:EXPAND_ALL',
  p_show_node_link   =>'',
  p_node_link_checksum_type   =>null,
  p_tree_comment          =>'',
  p_show_hints          =>'STATIC',
  p_tree_has_focus          =>'N',
  p_tree_hint_text          =>'View',
  p_tree_click_action          =>'S',
  p_selected_node          =>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 7567339271061770006 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 19,
  p_button_sequence=> 10,
  p_button_plug_id => 7567338871547769994+wwv_flow_api.g_id_offset,
  p_button_name    => 'CONTRACT_ALL',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020554059195437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Collapse All',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.tree.collapse_all(''tree'||to_char(7567339066810769996+wwv_flow_api.g_id_offset)||''');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7567339487637770011 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 19,
  p_button_sequence=> 10,
  p_button_plug_id => 7567338871547769994+wwv_flow_api.g_id_offset,
  p_button_name    => 'EXPAND_ALL',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020554059195437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Expand All',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.tree.expand_all(''tree'||to_char(7567339066810769996+wwv_flow_api.g_id_offset)||''');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 19
--
 
begin
 
null;
end;
null;
 
end;
/

 
