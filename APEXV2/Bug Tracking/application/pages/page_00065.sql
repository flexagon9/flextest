prompt --application/pages/page_00065
begin
wwv_flow_api.create_page(
 p_id=>65
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Customer'
,p_step_title=>'Customer'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20180201115421'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1436525073962779363)
,p_plug_name=>'&PRODUCT_NAME. Customers'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(d.customer,''Not Specified'') customer,',
'       count(*) c,',
'       sum(decode(c.is_open,''Y'',1,0)) count_open,',
'       sum(decode(c.is_open,''N'',1,0)) count_closed,',
'       max(d.updated) last_update,',
'       max(d.sync_last_upd) sync_last_upd,',
'       max(d.created) last_created',
'from EBA_BT_SW_DEFECTS d,',
'     eba_bt_status c',
'where c.id = d.status_id ',
'        and nvl(d.is_active,''Y'') = ''Y''',
'	and d.product_id = nvl(:P65_PRODUCT,d.product_id)',
'group by nvl(d.customer,''Not Specified'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P65_PRODUCT'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1436525236666779365)
,p_name=>'Releases'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>1426455707662839540
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1436525490639779370)
,p_db_column_name=>'C'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Bug Count'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR:IR_CATEGORY_ID:#ID#'
,p_column_linktext=>'#C#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1436528156277818551)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Customer'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RIR:IR_CUSTOMER:#CUSTOMER#'
,p_column_linktext=>'#CUSTOMER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1436528250821818552)
,p_db_column_name=>'COUNT_OPEN'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Open'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,RIR:IR_CUSTOMER,IR_IS_OPEN:#CUSTOMER#,Yes'
,p_column_linktext=>'#COUNT_OPEN#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1436531065038876272)
,p_db_column_name=>'LAST_UPDATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Last Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1436531206506876273)
,p_db_column_name=>'LAST_CREATED'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Last Filed'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1436674319061390944)
,p_db_column_name=>'SYNC_LAST_UPD'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Sync Data Last Upd'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1436677581717527666)
,p_db_column_name=>'COUNT_CLOSED'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Closed'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,RIR:IR_CUSTOMER,IR_IS_OPEN:#CUSTOMER#,No'
,p_column_linktext=>'#COUNT_CLOSED#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1436525823500779371)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'14264563'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CUSTOMER:C:COUNT_OPEN:COUNT_CLOSED:LAST_CREATED:SYNC_LAST_UPD:'
,p_sort_column_1=>'C'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'TARGETED_BY_OPEN'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'VERSION_NAME'
,p_sort_direction_3=>'DESC'
,p_sort_column_4=>'RELEASE_DATE'
,p_sort_direction_4=>'DESC NULLS LAST'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1436676362365484146)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1506949153568262245)
,p_plug_name=>'Bugs By Month (12 month trailing)'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P65_PRODUCT'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1506949292475262246)
,p_region_id=>wwv_flow_api.id(1506949153568262245)
,p_chart_type=>'lineWithArea'
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
,p_time_axis_type=>'mixedFrequency'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1506949379462262247)
,p_chart_id=>wwv_flow_api.id(1506949292475262246)
,p_seq=>10
,p_name=>'Dates'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     to_date(to_char(d.created,''YYYYMM''),''YYYYMM'') x,',
'     count(*) y',
'from EBA_BT_SW_DEFECTS d,',
'     eba_bt_status c',
'where c.id = d.status_id ',
'        and nvl(d.is_active,''Y'') = ''Y''',
'	and d.product_id = nvl(:P65_PRODUCT,d.product_id)',
'        and d.created > sysdate - 365',
'group by to_date(to_char(d.created,''YYYYMM''),''YYYYMM'')',
'order by 1'))
,p_items_value_column_name=>'Y'
,p_items_label_column_name=>'X'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'circle'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1506949515121262248)
,p_chart_id=>wwv_flow_api.id(1506949292475262246)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'date-medium'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_major_tick_rendered=>'on'
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
 p_id=>wwv_flow_api.id(1506949563328262249)
,p_chart_id=>wwv_flow_api.id(1506949292475262246)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
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
 p_id=>wwv_flow_api.id(1506949682597262250)
,p_plug_name=>'Bugs by Month - Non Internal (12 month trailing)'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1506949765258262251)
,p_region_id=>wwv_flow_api.id(1506949682597262250)
,p_chart_type=>'lineWithArea'
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
,p_time_axis_type=>'enabled'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1506949869561262252)
,p_chart_id=>wwv_flow_api.id(1506949765258262251)
,p_seq=>10
,p_name=>'Dates'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     to_date(to_char(d.created,''YYYYMM''),''YYYYMM'') x,',
'     count(*) y',
'from EBA_BT_SW_DEFECTS d,',
'     eba_bt_status c',
'where c.id = d.status_id ',
'        and nvl(d.is_active,''Y'') = ''Y''',
'	and d.product_id = nvl(:P65_PRODUCT,d.product_id)',
'        and d.created > sysdate - 365',
'        and instr(d.customer,''INTERNAL'') = 0',
'group by to_date(to_char(d.created,''YYYYMM''),''YYYYMM'')',
'order by 1'))
,p_ajax_items_to_submit=>'P65_PRODUCT'
,p_items_value_column_name=>'Y'
,p_items_label_column_name=>'X'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'circle'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1506950055317262254)
,p_chart_id=>wwv_flow_api.id(1506949765258262251)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
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
 p_id=>wwv_flow_api.id(1506949997583262253)
,p_chart_id=>wwv_flow_api.id(1506949765258262251)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'date-medium'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
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
 p_id=>wwv_flow_api.id(2247914148257519903)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>20
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1436526158954779375)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1436525073962779363)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2247914841297519914)
,p_name=>'P65_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2247914148257519903)
,p_item_default=>'&PRODUCT_ID.'
,p_prompt=>'Product'
,p_source=>'&PRODUCT_ID.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1436526925546779385)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2247925260206542373)
,p_name=>'Refresh Reports'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P65_PRODUCT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2247925723543542374)
,p_event_id=>wwv_flow_api.id(2247925260206542373)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1436525073962779363)
,p_stop_execution_on_error=>'Y'
);
end;
/
