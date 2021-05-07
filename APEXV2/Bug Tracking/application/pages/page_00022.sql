prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Bugs by Assignee and Submitter'
,p_step_title=>'Bugs by Assignee and Submitter'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2508162743716731820)
,p_step_template=>wwv_flow_api.id(1225655852966288293)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'<p>Use the filters on the left to reduce the number of results displayed in each bar graph below.</p>'
,p_last_upd_yyyymmddhh24miss=>'20180201115421'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1062937646106761726)
,p_plug_name=>'Bugs by Assignee'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select login_name, c, login_name ||'' ('' || c || '')'' tooltip',
'from ( select nvl(username,:APP_NOT_ASSIGNED_TEXT) as login_name,',
'       count(*) c',
'  from EBA_BT_SW_DEFECTS a,',
'       eba_bt_users b,',
'       eba_bt_status c',
' where a.assigned_to_id = b.id (+) ',
'   and (nvl(:P22_PRODUCT,0) = 0 or :P22_PRODUCT = a.product_id)',
'   and (nvl(:P22_STATUS,0) = 0 or :P22_STATUS = a.status_id)',
'   and (nvl(:P22_PRIORITY,0) = 0 or :P22_PRIORITY = a.URGENCY_ID)',
'   and (nvl(:P22_SEVERITY,0) = 0 or :P22_SEVERITY = a.SEVERITY_id)',
'   and (:P22_OPEN_OR_CLOSED = ''0'' or (c.is_open = ''Y'' and :P22_OPEN_OR_CLOSED = ''OPEN'') or (c.is_open = ''N'' and :P22_OPEN_OR_CLOSED = ''CLOSED''))',
'   and a.status_id = c.id (+)',
'   and (NVL(:P22_FIX_BY,0) = 0 or :P22_FIX_BY = a.FIX_BY_VERSION_ID)',
'   and (:P22_SINCE is null or a.created >= (sysdate - :P22_SINCE))',
'group by username',
'order by 2 desc )',
''))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P22_PRODUCT,P22_STATUS,P22_OPEN_OR_CLOSED,P22_PRIORITY,P22_SEVERITY,P22_FIX_BY,P22_SINCE'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1062937749800761727)
,p_region_id=>wwv_flow_api.id(1062937646106761726)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1062937891671761728)
,p_chart_id=>wwv_flow_api.id(1062937749800761727)
,p_seq=>10
,p_name=>'Bugs by Assignee'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'C'
,p_items_label_column_name=>'LOGIN_NAME'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,CIR:IRC_STATUS_NAME,IREQ_LOGIN_NAME,IREQ_PRIORITY_ID,IRC_SEVERITY,IRGTE_CREATED,IREQ_FIX_BY_VERSION_ID,IREQ_IS_OPEN:&P22_STATUS.,&LOGIN_NAME.,&P22_PRIORITY.,&P22_SEVERITY.,&P22_CREATED.,&P22_FIX_BY.,&P22_IS_OP'
||'EN.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1062938058478761730)
,p_chart_id=>wwv_flow_api.id(1062937749800761727)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Bug Count'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>5
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1062937990325761729)
,p_chart_id=>wwv_flow_api.id(1062937749800761727)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Developer'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1062938139888761731)
,p_plug_name=>'Bugs by Submitter'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select login_name, c, login_name || '' ('' || c || '')'' tooltip',
'from ( select nvl(a.created_by,''UNKNOWN'') as login_name,',
'       count(*) c',
'  from EBA_BT_SW_DEFECTS a,',
'       eba_bt_status c',
' where (nvl(:P22_PRODUCT,0) = 0 or :P22_PRODUCT = a.product_id)',
'   and (nvl(:p22_status,0) = 0 or :p22_status = status_id)',
'   and (nvl(:p22_priority,0) = 0 or :p22_priority = urgency_id)',
'   and (nvl(:P22_SEVERITY,0) = 0 or :P22_SEVERITY = a.SEVERITY_id)',
'   and (:P22_OPEN_OR_CLOSED = ''0'' or (c.is_open = ''Y'' and :P22_OPEN_OR_CLOSED = ''OPEN'') or (c.is_open = ''N'' and :P22_OPEN_OR_CLOSED = ''CLOSED''))',
'   and a.status_id = c.id (+)',
'   and (NVL(:P22_FIX_BY,0) = 0 or :P22_FIX_BY = a.FIX_BY_VERSION_ID)',
'   and (:P22_SINCE is null or a.created >= (sysdate - :P22_SINCE))',
'group by nvl(a.created_by,''UNKNOWN'')',
'order by 2 desc )'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P22_PRODUCT,P22_STATUS,P22_OPEN_OR_CLOSED,P22_PRIORITY,P22_SEVERITY,P22_FIX_BY,P22_SINCE'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1062938251679761732)
,p_region_id=>wwv_flow_api.id(1062938139888761731)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1062938403152761733)
,p_chart_id=>wwv_flow_api.id(1062938251679761732)
,p_seq=>10
,p_name=>'Bugs by Submitter'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'C'
,p_items_label_column_name=>'LOGIN_NAME'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,CIR:IRC_STATUS_NAME,IREQ_CREATED_BY,IREQ_PRIORITY_ID,IRC_SEVERITY,IRGTE_CREATED,IREQ_FIX_BY_VERSION_ID,IREQ_IS_OPEN:&P22_STATUS.,&LOGIN_NAME.,&P22_PRIOROTY.,&P22_SEVERITY.,&P22_CREATED.,&P22_FIX_BY.,&P22_IS_OP'
||'EN.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1062938493333761734)
,p_chart_id=>wwv_flow_api.id(1062938251679761732)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Developer'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1062938556614761735)
,p_chart_id=>wwv_flow_api.id(1062938251679761732)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Bug Count'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_step=>5
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1347824220131080131)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6366378574706931565)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--stacked:t-Region--scrollBody:t-Form--stretchInputs:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1342799454256958262)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_button_name=>'P22_reset'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,22::'
,p_icon_css_classes=>'fa-undo'
,p_request_source=>'RESET'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6366381981571931576)
,p_branch_name=>'Go To Page 22'
,p_branch_action=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6366382203913931576)
,p_branch_action=>'f?p=&FLOW_ID.:22:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7132688625883801337)
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6366381801564931576)
,p_branch_action=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16282762391174735)
,p_name=>'P22_CREATED'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16283313563174740)
,p_name=>'P22_IS_OPEN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1342767015409826417)
,p_name=>'P22_OPEN_OR_CLOSED'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_item_default=>'0'
,p_prompt=>'Open or Closed'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SHOW OPEN OR CLOSED OR BOTH'
,p_lov=>'.'||wwv_flow_api.id(1342752977689698528)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Bugs can be categoriezed broadly as open or closed, choose how to filter this report.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1347880874550171741)
,p_name=>'P22_SEVERITY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_item_default=>'0'
,p_prompt=>'Severity'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEVERITY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select severity_name d, id r',
'from   EBA_BT_SEVERITY',
'order by nvl(sequence_number,99), severity_name'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Choose a filter for all reports on this page.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1420701518042879006)
,p_name=>'P22_FIX_BY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_item_default=>'0'
,p_prompt=>'Fix By'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select version_name, id',
'from eba_bt_version v',
'where nvl(:P22_PRODUCT, 0) = 0 or (product_id = :P22_PRODUCT and exists (select 1 from eba_bt_sw_defects x where x.fix_by_version_id = v.id))',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_cascade_parent_items=>'P22_PRODUCT'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1420701722038882853)
,p_name=>'P22_SINCE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_item_default=>'730'
,p_prompt=>'Filed Since'
,p_source=>'730'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SINCE'
,p_lov=>'.'||wwv_flow_api.id(3990156527528091805)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Show All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6366380299990931570)
,p_name=>'P22_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Products -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Select the Product for which the Bug is submitted.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6366380790592931571)
,p_name=>'P22_LAST_PAGE_VISITED'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_use_cache_before_default=>'NO'
,p_source=>'1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6366540190287741653)
,p_name=>'P22_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'&P22_STATUS.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUSLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_NAME d, id r',
'from   eba_bt_status where upper(IS_ACTIVE) = ''Y''',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Statuses -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Select the Status for which you want the Chart.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6366541787086759618)
,p_name=>'P22_PRIORITY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6366378574706931565)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Priority'
,p_source=>'&P22_PRIORITY.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'URGENCYLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select URGENCY_NAME d, ',
'         id  r',
'from   eba_bt_urgency ',
'where upper(IS_ACTIVE) = ''Y''',
'order by 1',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Priorities -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Select the Priority for which you want the Chart.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16283178929174739)
,p_computation_sequence=>10
,p_computation_item=>'P22_CREATED'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'to_char(sysdate - :P22_SINCE,''DD-MON-YY'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16284171290174749)
,p_computation_sequence=>20
,p_computation_item=>'P22_IS_OPEN'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'case',
'    when :P22_OPEN_OR_CLOSED = ''OPEN'' then',
'        ''Yes''',
'    when :P22_OPEN_OR_CLOSED = ''CLOSED'' then',
'        ''No''',
'    else',
'        null',
'end'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(38745394709812726)
,p_computation_sequence=>30
,p_computation_item=>'P22_OPEN_OR_CLOSED'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'nvl(:P22_OPEN_OR_CLOSED,0)'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1415237320419052608)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16282871651174736)
,p_name=>'Set Created'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P22_SINCE'
,p_condition_element=>'P22_SINCE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16283007101174737)
,p_event_id=>wwv_flow_api.id(16282871651174736)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P22_CREATED'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'to_char(sysdate - nvl(:P22_SINCE,730),''DD-MON-YY'')'
,p_attribute_07=>'P22_SINCE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16283039837174738)
,p_event_id=>wwv_flow_api.id(16282871651174736)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_03=>'P22_CREATED'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16283373252174741)
,p_name=>'Set is open to Yes'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P22_OPEN_OR_CLOSED'
,p_condition_element=>'P22_OPEN_OR_CLOSED'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'''OPEN'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16283443477174742)
,p_event_id=>wwv_flow_api.id(16283373252174741)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P22_IS_OPEN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'''Yes'''
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16283728590174744)
,p_event_id=>wwv_flow_api.id(16283373252174741)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_03=>'P22_IS_OPEN'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16283912867174746)
,p_name=>'Set is open to No'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P22_OPEN_OR_CLOSED'
,p_condition_element=>'P22_OPEN_OR_CLOSED'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'''CLOSED'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16283953250174747)
,p_event_id=>wwv_flow_api.id(16283912867174746)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P22_IS_OPEN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'''No'''
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16284107458174748)
,p_event_id=>wwv_flow_api.id(16283912867174746)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_03=>'P22_IS_OPEN'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(724170010845634168)
,p_name=>'Refresh Charts'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P22_PRODUCT,P22_STATUS,P22_OPEN_OR_CLOSED,P22_PRIORITY,P22_SEVERITY,P22_FIX_BY,P22_SINCE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1062938758617761737)
,p_event_id=>wwv_flow_api.id(724170010845634168)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1062938139888761731)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1062938708522761736)
,p_event_id=>wwv_flow_api.id(724170010845634168)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1062937646106761726)
,p_stop_execution_on_error=>'Y'
);
end;
/
