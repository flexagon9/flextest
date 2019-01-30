--application/pages/page_00004
prompt  ...PAGE 4: Orders
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 4
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Orders'
 ,p_step_title => 'Sample Database Application - Orders'
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
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20130411082433'
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
  p_id=> 1368350999637792456 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Order Pages',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 1,
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
s:=s||'select  '||unistr('\000a')||
'   lpad(to_char(o.order_id),4,''0000'') order_number,'||unistr('\000a')||
'   o.order_id,  '||unistr('\000a')||
'   to_date(to_char(o.order_timestamp,''mm yyyy''), ''mm yyyy'') order_month,   '||unistr('\000a')||
'   trunc(o.order_timestamp) order_date,'||unistr('\000a')||
'   o.user_name sales_rep, '||unistr('\000a')||
'   o.order_total,  '||unistr('\000a')||
'   c.cust_last_name || '', '' || c.cust_first_name customer_name,'||unistr('\000a')||
'   (select count(*) from demo_order_items  oi where oi.order_id = o.order_id) order_items,'||unistr('\000a')||
'   o';

s:=s||'.tags tags'||unistr('\000a')||
' from  '||unistr('\000a')||
'   demo_orders o,  '||unistr('\000a')||
'   demo_customers c'||unistr('\000a')||
' where  '||unistr('\000a')||
'   o.customer_id = c.customer_id '||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 7558452088013420239 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Orders',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_rest_enabled=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select  '||unistr('\000a')||
'   lpad(to_char(o.order_id),4,''0000'') order_number,'||unistr('\000a')||
'   o.order_id,  '||unistr('\000a')||
'   to_date(to_char(o.order_timestamp,''mm yyyy''), ''mm yyyy'') order_month,   '||unistr('\000a')||
'   trunc(o.order_timestamp) order_date,'||unistr('\000a')||
'   o.user_name sales_rep, '||unistr('\000a')||
'   o.order_total,  '||unistr('\000a')||
'   c.cust_last_name || '', '' || c.cust_first_name customer_name,'||unistr('\000a')||
'   (select count(*) from demo_order_items  oi where oi.order_id = o.order_id) order_items,'||unistr('\000a')||
'   o';

a1:=a1||'.tags tags'||unistr('\000a')||
' from  '||unistr('\000a')||
'   demo_orders o,  '||unistr('\000a')||
'   demo_customers c'||unistr('\000a')||
' where  '||unistr('\000a')||
'   o.customer_id = c.customer_id '||unistr('\000a')||
'';

wwv_flow_api.create_worksheet(
  p_id=> 7558452190633420239+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_region_id=> 7558452088013420239+wwv_flow_api.g_id_offset,
  p_name=> 'My Orders',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '1000000',
  p_max_row_count_message=> 'The maximum row count for this report is #MAX_ROW_COUNT# rows. Please apply a filter to reduce the number of records in your query.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'Y',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'N',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'Y',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'DPEAKE',
  p_internal_uid=> 1);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7558452595708420321+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ORDER_ID',
  p_display_order          =>1,
  p_column_identifier      =>'C',
  p_column_label           =>'Order ID',
  p_report_label           =>'Order ID',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7563359694705467283+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ORDER_MONTH',
  p_display_order          =>2,
  p_column_identifier      =>'J',
  p_column_label           =>'Order Month',
  p_report_label           =>'Order Month',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_format_mask            =>'Month YYYY',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7560969068069103318+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CUSTOMER_NAME',
  p_display_order          =>4,
  p_column_identifier      =>'H',
  p_column_label           =>'Customer Name',
  p_report_label           =>'Customer Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7560969169509103319+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ORDER_ITEMS',
  p_display_order          =>8,
  p_column_identifier      =>'I',
  p_column_label           =>'Order Items',
  p_report_label           =>'Order Items',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7558452689085420321+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ORDER_TOTAL',
  p_display_order          =>13,
  p_column_identifier      =>'D',
  p_column_label           =>'Order Total',
  p_report_label           =>'Order Total',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_format_mask            =>'FML999G999G999G999G990D00',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7828419688093031297+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SALES_REP',
  p_display_order          =>14,
  p_column_identifier      =>'L',
  p_column_label           =>'Sales Rep',
  p_report_label           =>'Sales Rep',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 4168890229400413591+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'TAGS',
  p_display_order          =>16,
  p_column_identifier      =>'N',
  p_column_label           =>'Tags',
  p_report_label           =>'Tags',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 986545050859123689+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ORDER_NUMBER',
  p_display_order          =>17,
  p_column_identifier      =>'O',
  p_column_label           =>'Order #',
  p_report_label           =>'Order #',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP,29:P29_ORDER_ID,P11_BRANCH:#ORDER_ID#,4',
  p_column_linktext        =>'<span>#ORDER_NUMBER#</span>',
  p_column_link_attr       =>'class="uButton uAltButton" style="text-decoration: none;"',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 986545175031123689+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ORDER_DATE',
  p_display_order          =>18,
  p_column_identifier      =>'P',
  p_column_label           =>'Order Date',
  p_report_label           =>'Order Date',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ORDER_NUMBER:ORDER_ID:CUSTOMER_NAME:SALES_REP:ORDER_ITEMS:ORDER_TOTAL:TAGS:ORDER_DATE:ORDER_MONTH:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 7558453096722420789+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'order_primary',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'ORDER_DATE',
  p_sort_direction_1        =>'DESC',
  p_sort_column_2           =>'ORDER_NUMBER',
  p_sort_direction_2        =>'DESC',
  p_sort_column_3           =>'0',
  p_sort_direction_3        =>'ASC',
  p_sort_column_4           =>'0',
  p_sort_direction_4        =>'ASC',
  p_sort_column_5           =>'0',
  p_sort_direction_5        =>'ASC',
  p_sort_column_6           =>'0',
  p_sort_direction_6        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ORDER_MONTH:ORDER_ID:CUSTOMER_NAME:SALES_REP:ORDER_ITEMS:ORDER_TOTAL:TAGS:ORDER_NUMBER:ORDER_DATE';

wwv_flow_api.create_worksheet_rpt(
  p_id => 7566972376144984854+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_ALTERNATIVE',
  p_name                    =>'Monthly Review',
  p_report_seq              =>10,
  p_report_type             =>'CHART',
  p_report_alias            =>'8290268',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'ORDER_ID',
  p_sort_direction_1        =>'ASC',
  p_sort_column_2           =>'0',
  p_sort_direction_2        =>'ASC',
  p_sort_column_3           =>'0',
  p_sort_direction_3        =>'ASC',
  p_sort_column_4           =>'0',
  p_sort_direction_4        =>'ASC',
  p_sort_column_5           =>'0',
  p_sort_direction_5        =>'ASC',
  p_sort_column_6           =>'0',
  p_sort_direction_6        =>'ASC',
  p_break_on                =>'ORDER_MONTH',
  p_break_enabled_on        =>'ORDER_MONTH',
  p_avg_columns_on_break    =>'ORDER_TOTAL',
  p_flashback_enabled       =>'N',
  p_chart_type              =>'HCOLUMN',
  p_chart_label_column      =>'ORDER_MONTH',
  p_chart_label_title       =>'Month',
  p_chart_value_column      =>'ORDER_TOTAL',
  p_chart_aggregate         =>'SUM',
  p_chart_value_title       =>'Total Monthly Orders',
  p_chart_sorting           =>'LABEL_ASC',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 7291423882899638834+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_report_id => 7566972376144984854+wwv_flow_api.g_id_offset,
  p_name                    =>'Orders <= $900',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'ORDER_TOTAL',
  p_operator                =>'<=',
  p_expr                    =>'900',
  p_condition_sql           =>' (case when ("ORDER_TOTAL" <= to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# <= #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_row_bg_color            =>'#FFFF99',
  p_row_font_color          =>'#FF0033',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 7291423980124638834+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_report_id => 7566972376144984854+wwv_flow_api.g_id_offset,
  p_name                    =>'Orders > $2,000',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'ORDER_TOTAL',
  p_operator                =>'>',
  p_expr                    =>'2000',
  p_condition_sql           =>' (case when ("ORDER_TOTAL" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_bg_color         =>'#99FF99',
  p_column_font_color       =>'#0033FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_group_by(
  p_id => 7291424078515638834+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_worksheet_id => 7558452190633420239+wwv_flow_api.g_id_offset,
  p_report_id => 7566972376144984854+wwv_flow_api.g_id_offset,
  p_group_by_columns =>'ORDER_MONTH',
  p_function_01 =>'AVG',
  p_function_column_01 =>'ORDER_TOTAL',
  p_function_db_column_name_01 =>'APXWS_GBFC_01',
  p_function_label_01 =>'Average Order Total',
  p_function_format_mask_01 =>'FML999G999G999G999G990D00',
  p_function_sum_01 =>'N',
  p_function_02 =>'COUNT',
  p_function_column_02 =>'ORDER_ITEMS',
  p_function_db_column_name_02 =>'APXWS_GBFC_02',
  p_function_label_02 =>'Number of Orders',
  p_function_sum_02 =>'N',
  p_sort_column_01 =>'ORDER_MONTH',
  p_sort_direction_01 =>'ASC',
  p_sort_direction_12 =>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 7527666698339752335 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 20,
  p_button_plug_id => 7558452088013420239+wwv_flow_api.g_id_offset,
  p_button_name    => 'ENTER_NEW_ORDER',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(1020554846275437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enter New Order',
  p_button_position=> 'RIGHT_OF_IR_SEARCH_BAR',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'rightarrow',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>7527666896701752362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:11:P11_BRANCH:4&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>7527666698339752335+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>7525404217007385611 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&FLOW_ID.:4:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 4168746036262071839 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_computation_sequence => 10,
  p_computation_item=> 'LAST_VIEW',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '4',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 4
--
 
begin
 
null;
end;
null;
 
end;
/

 
