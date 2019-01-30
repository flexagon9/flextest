--application/pages/page_00209
prompt  ...PAGE 209: Customer Orders
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 209
 ,p_user_interface_id => 1725024220874723827 + wwv_flow_api.g_id_offset
 ,p_name => 'Customer Orders'
 ,p_step_title => 'Customer Orders'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Customer Orders'
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
 ,p_last_upd_yyyymmddhh24miss => '20130410111950'
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
  p_id=> 1734048518721454522 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 209,
  p_plug_name=> 'Customer Orders',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1024080949442455930+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
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
  p_id                     => 1734048705497454524+wwv_flow_api.g_id_offset,
  p_flow_id                => wwv_flow.g_flow_id,
  p_page_id                => 209,
  p_region_id              => 1734048518721454522+wwv_flow_api.g_id_offset,
  p_default_chart_type     =>'StackedHorizontal2DColumn',
  p_chart_title            =>'',
  p_chart_rendering        =>'SVG_ONLY',
  p_chart_name             =>'chart_373251116349146479',
  p_chart_width            =>475,
  p_chart_height           =>475,
  p_chart_animation        =>'Appear',
  p_display_attr           =>':H:N::Y::Top::H:Y:None:::N:::Default:::S',
  p_dial_tick_attr         =>':::::::::::',
  p_gantt_attr             =>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y:I:N:S:E::',
  p_pie_attr               =>'Outside:::',
  p_map_attr               =>'Orthographic:RegionBounds:REGION_NAME',
  p_map_source             =>'',
  p_margins                =>':::',
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
  p_x_axis_title           =>'Customer',
  p_x_axis_min             =>null,
  p_x_axis_max             =>null,
  p_x_axis_decimal_place   =>null,
  p_x_axis_prefix          =>'',
  p_x_axis_postfix         =>'',
  p_x_axis_label_rotation  =>'',
  p_x_axis_label_font      =>'Tahoma:10:#000000',
  p_x_axis_major_interval  =>null,
  p_x_axis_minor_interval  =>null,
  p_y_axis_title           =>'Order Total',
  p_y_axis_min             =>null,
  p_y_axis_max             =>null,
  p_y_axis_decimal_place   =>null,
  p_y_axis_prefix          =>'',
  p_y_axis_postfix         =>'',
  p_y_axis_label_rotation  =>'',
  p_y_axis_label_font      =>'Tahoma:10:#000000',
  p_y_axis_major_interval  =>null,
  p_y_axis_minor_interval  =>null,
  p_async_update           =>'N',
  p_async_time             =>null,
  p_legend_title           =>'Categories',
  p_legend_title_font      =>'',
  p_names_font             => null,
  p_names_rotation         => null,
  p_values_font            =>'Tahoma:10:#000000',
  p_values_rotation        =>null,
  p_values_prefix          =>'',
  p_values_postfix         =>'',
  p_hints_font             =>'Tahoma:10:#000000',
  p_legend_font            =>'Tahoma:10:#000000',
  p_grid_labels_font       =>'Tahoma:10:',
  p_chart_title_font       =>'Tahoma:14:#000000',
  p_x_axis_title_font      =>'Tahoma:14:#000000',
  p_x_axis_title_rotation  =>'',
  p_y_axis_title_font      =>'Tahoma:14:#000000',
  p_y_axis_title_rotation  =>'',
  p_gauge_labels_font      =>'Tahoma:10:',
  p_use_chart_xml          =>'N',
  p_chart_xml              => a1);
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select c.rowid link,'||unistr('\000a')||
'       c.cust_last_name||'', ''||c.cust_first_name Customer_Name,'||unistr('\000a')||
'       sum (decode(p.category,''Accessories'',oi.quantity * oi.unit_price,0)) "Accessories",'||unistr('\000a')||
'       sum (decode(p.category,''Mens'',oi.quantity * oi.unit_price,0)) "Mens",'||unistr('\000a')||
'       sum (decode(p.category,''Womens'',oi.quantity * oi.unit_price,0)) "Womens"'||unistr('\000a')||
'from demo_customers c'||unistr('\000a')||
',    demo_orders o'||unistr('\000a')||
',    demo_order_items oi'||unistr('\000a')||
',';

a1:=a1||'    demo_product_info p'||unistr('\000a')||
'where c.customer_id = o.customer_id'||unistr('\000a')||
'and   o.order_id = oi.order_id'||unistr('\000a')||
'and   oi.product_id = p.product_id'||unistr('\000a')||
'group by c.rowid, c.customer_id, c.cust_last_name, c.cust_first_name'||unistr('\000a')||
'order by c.cust_last_name';

wwv_flow_api.create_flash_chart5_series(
  p_id                        => 1734048793857454524+wwv_flow_api.g_id_offset,
  p_chart_id                  => 1734048705497454524+wwv_flow_api.g_id_offset,
  p_flow_id                   => wwv_flow.g_flow_id,
  p_series_seq                =>10,
  p_series_name               =>'Series 1',
  p_series_query              => a1,
  p_series_type               =>'Bar',
  p_series_query_type         =>'SQL_QUERY',
  p_series_ajax_items_to_submit=>'',
  p_series_query_parse_opt    =>'PARSE_CHART_QUERY',
  p_series_query_no_data_found=>'no data found',
  p_series_query_row_count_max=>15,
  p_action_link               =>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:202:P202_ROWID:#LINK#',
  p_show_action_link          =>'C',
  p_action_link_checksum_type =>'',
  p_display_when_cond_type    =>'',
  p_display_when_condition    =>'',
  p_display_when_condition2   =>'');
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
-- ...updatable report columns for page 209
--
 
begin
 
null;
end;
null;
 
end;
/

 
