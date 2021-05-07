prompt --application/pages/page_00088
begin
wwv_flow_api.create_page(
 p_id=>88
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Bugs Closed'
,p_step_title=>'Bugs Closed'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_help_text=>'By default this page shows a dashboard of bug data for all closed bugs in the application. You can change the Product, Category and/or Fix By filter values at the top of the page to change the displayed results. Click the <strong>Reset</strong> butto'
||'n to reset the page to its default values.'
,p_last_upd_yyyymmddhh24miss=>'20180202040737'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1408927282222565999)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1408927670186566003)
,p_plug_name=>'Top Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI:t-Form--leftLabels'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1409079274461836135)
,p_name=>'Bugs Closed By Month'
,p_template=>wwv_flow_api.id(1225690169574288324)
,p_display_sequence=>63
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--inline:t-Report--rowHighlightOff'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select month, bugs_with_closed_date, bugs_closed, owners, sev_1, sev_2, sev_3, sev_4, fix_by_versions Targeted_Fix_Bys',
'from (',
'select',
'     to_date(to_char(a.date_closed,''YYYYMM''),''YYYYMM'') Month,',
'     count(*) bugs_with_closed_date,',
'     sum(decode(b.is_open,''N'',1,0)) bugs_closed,',
'     count(distinct assigned_to_id) owners,',
'     sum(decode(b.is_open,''Y'',0,decode(s.SEQUENCE_NUMBER,1,1,0))) sev_1,',
'     sum(decode(b.is_open,''Y'',0,decode(s.SEQUENCE_NUMBER,2,1,0))) sev_2,',
'     sum(decode(b.is_open,''Y'',0,decode(s.SEQUENCE_NUMBER,3,1,0))) sev_3,',
'     sum(decode(b.is_open,''Y'',0,decode(s.SEQUENCE_NUMBER,4,1,0))) sev_4,',
'     count(distinct nvl(fix_by_version_id,0)) fix_by_versions',
'from EBA_BT_SW_DEFECTS a,',
'     eba_bt_status b,',
'     EBA_BT_SEVERITY s',
'where (:P88_PRODUCT = 0 or a.product_id = :P88_PRODUCT) and',
'      (:P88_CATEGORY = 0 or a.category_id = :P88_CATEGORY) and',
'      a.status_id = b.id (+) and',
'      a.severity_id = s.id (+) and',
'      a.date_closed is not null and',
'      (NVL(:P88_FIX_BY,0) = 0 or :P88_FIX_BY = a.FIX_BY_VERSION_ID)',
'group by to_date(to_char(a.date_closed,''YYYYMM''),''YYYYMM'')',
') x',
'order by 1 desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1225695925336288332)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1409079471969836137)
,p_query_column_id=>1
,p_column_alias=>'MONTH'
,p_column_display_sequence=>1
,p_column_heading=>'Month'
,p_use_as_row_header=>'N'
,p_column_format=>'Month YYYY'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1410304857363998454)
,p_query_column_id=>2
,p_column_alias=>'BUGS_WITH_CLOSED_DATE'
,p_column_display_sequence=>2
,p_column_heading=>'Bugs With Closed Date'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1410304929711998455)
,p_query_column_id=>3
,p_column_alias=>'BUGS_CLOSED'
,p_column_display_sequence=>3
,p_column_heading=>'Bugs Closed Status'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1409080977005852810)
,p_query_column_id=>4
,p_column_alias=>'OWNERS'
,p_column_display_sequence=>4
,p_column_heading=>'Owners'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1409081776197860687)
,p_query_column_id=>5
,p_column_alias=>'SEV_1'
,p_column_display_sequence=>5
,p_column_heading=>'Sev 1'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1409081862619860689)
,p_query_column_id=>6
,p_column_alias=>'SEV_2'
,p_column_display_sequence=>6
,p_column_heading=>'Sev 2'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1409081998261860689)
,p_query_column_id=>7
,p_column_alias=>'SEV_3'
,p_column_display_sequence=>7
,p_column_heading=>'Sev 3'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1409082107072860690)
,p_query_column_id=>8
,p_column_alias=>'SEV_4'
,p_column_display_sequence=>8
,p_column_heading=>'Sev 4'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1414326283883951702)
,p_query_column_id=>9
,p_column_alias=>'TARGETED_FIX_BYS'
,p_column_display_sequence=>9
,p_column_heading=>'Targeted Fix Bys'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1506950716289262260)
,p_plug_name=>'By Month'
,p_region_name=>'byMonth'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>33
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P88_PRODUCT,P88_CATEGORY,P88_FIX_BY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1506950815869262261)
,p_region_id=>wwv_flow_api.id(1506950716289262260)
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
 p_id=>wwv_flow_api.id(1506950863180262262)
,p_chart_id=>wwv_flow_api.id(1506950815869262261)
,p_seq=>10
,p_name=>'Month'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     to_date(to_char(a.date_closed,''YYYYMM''),''YYYYMM'') x,',
'     count(*) y',
'from EBA_BT_SW_DEFECTS a,',
'     eba_bt_status b',
'where (NVL(:P88_PRODUCT,0) = 0 or a.product_id = :P88_PRODUCT) and',
'      (NVL(:P88_CATEGORY,0) = 0 or a.category_id = :P88_CATEGORY) and',
'      a.status_id = b.id (+) and',
'      a.date_closed is not null and',
'      (NVL(:P88_FIX_BY,0) = 0 or nvl(:P88_FIX_BY,0) = a.FIX_BY_VERSION_ID) and',
'     a.date_closed > (systimestamp - 365)',
'group by to_date(to_char(a.date_closed,''YYYYMM''),''YYYYMM'')'))
,p_ajax_items_to_submit=>'P88_PRODUCT,P88_CATEGORY,P88_FIX_BY'
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
 p_id=>wwv_flow_api.id(1506951094197262264)
,p_chart_id=>wwv_flow_api.id(1506950815869262261)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
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
 p_id=>wwv_flow_api.id(1506950988792262263)
,p_chart_id=>wwv_flow_api.id(1506950815869262261)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'date-medium'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
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
 p_id=>wwv_flow_api.id(1506951135916262265)
,p_plug_name=>'Bug Closed Distribution'
,p_region_name=>'bugClosedDistribution'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>53
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P88_PRODUCT,P88_CATEGORY,P88_FIX_BY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1506951307718262266)
,p_region_id=>wwv_flow_api.id(1506951135916262265)
,p_chart_type=>'donut'
,p_height=>'600'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'N'
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
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1506951339008262267)
,p_chart_id=>wwv_flow_api.id(1506951307718262266)
,p_seq=>10
,p_name=>'Bugs'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with ',
'bugs as ',
'    ( select d.id, d.date_closed',
'      from eba_bt_sw_defects d, eba_bt_status b',
'      where d.STATUS_ID = b.id (+) and ',
'      (NVL(:P88_PRODUCT,0) = 0 or d.product_id = :P88_PRODUCT)  and',
'      (NVL(:P88_FIX_BY,0) = 0 or :P88_FIX_BY = d.FIX_BY_VERSION_ID)    )',
'select ''Last 7 Days'' l, count(b.id) v',
'from bugs b',
'where date_closed between localtimestamp - numtodsinterval( 7, ''day'' ) and localtimestamp',
'union all',
'select ''Last Month'' l, count(*) v',
'from bugs b',
'where date_closed between cast( add_months( localtimestamp,-1 ) as timestamp with time zone ) and localtimestamp - numtodsinterval( 7, ''day'' )',
'union all',
'select ''Last 6 Months'' l, count(*) v',
'from bugs b',
'where date_closed between cast( add_months( localtimestamp,-6 ) as timestamp with time zone ) and cast( add_months( localtimestamp,-1 ) as timestamp with time zone )',
'union all',
'select ''Last Year'' l, count(*) v',
'from bugs b',
'where date_closed between cast( add_months( localtimestamp,-12 ) as timestamp with time zone ) and cast( add_months( localtimestamp,-6 ) as timestamp with time zone )',
'union all',
'select ''Last 5 Years'' l, count(*) v',
'from bugs b',
'where date_closed between cast( add_months( localtimestamp,-12*5 ) as timestamp with time zone ) and cast( add_months( localtimestamp,-12 ) as timestamp with time zone )',
'union all',
'select ''Last 6 Years'' l, count(*) v',
'from bugs b',
'where date_closed between cast( add_months( localtimestamp,-12*6 ) as timestamp with time zone ) and cast( add_months( localtimestamp,-12*5 ) as timestamp with time zone )',
'union all',
'select ''Last 10 Years or More'' l, count(*) v',
'from bugs b',
'where date_closed <= cast( add_months( localtimestamp,-12*6 ) as timestamp with time zone )'))
,p_items_value_column_name=>'V'
,p_items_label_column_name=>'L'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'ALL'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1408927875546566003)
,p_button_sequence=>10
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1408928071151566005)
,p_name=>'P88_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1408927670186566003)
,p_item_default=>'0'
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Product -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Choose the product name'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1408928784730566007)
,p_name=>'P88_CATEGORY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1408927670186566003)
,p_item_default=>'0'
,p_prompt=>'Category'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select category_name d, id r',
'from   eba_bt_category c',
'where PARENT_ID is null and ',
'       upper(IS_ACTIVE) = ''Y'' and',
'       (:P88_PRODUCT = 0 or exists (select 1 from eba_bt_sw_defects d ',
'                                       where d.category_id = c.id',
'                                       and d.product_id = :P88_PRODUCT))',
'order by 1 '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1414230945011924591)
,p_name=>'P88_FIX_BY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1408927670186566003)
,p_item_default=>'0'
,p_prompt=>'Fix By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select version_name, id',
'from eba_bt_version v',
'where nvl(:P88_PRODUCT, 0) = 0 or (product_id = :P88_PRODUCT and exists (select 1 from eba_bt_sw_defects x where x.fix_by_version_id = v.id))',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1415236548641041818)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1507163435449542847)
,p_name=>'refresh on product change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P88_PRODUCT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P88_PRODUCT'') == ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507163576501542848)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P88_PRODUCT := 0;'
,p_attribute_02=>'P88_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507163711484542849)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P88_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507163763319542850)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P88_CATEGORY,P88_FIX_BY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507163950548542852)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''.apex-rds-container'').parent(''div'').hide();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507163836323542851)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P88_CATEGORY,P88_FIX_BY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507164153486542854)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506950716289262260)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507164076929542853)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''.apex-rds-container'').parent(''div'').show();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507164321068542855)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506951135916262265)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507164398762542856)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1409079274461836135)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507165747804542870)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506950716289262260)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507165881911542871)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'FALSE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506951135916262265)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507166010409542872)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'FALSE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1409079274461836135)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507164456791542857)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'FALSE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506950716289262260)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507164609212542858)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'FALSE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506951135916262265)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507164656043542859)
,p_event_id=>wwv_flow_api.id(1507163435449542847)
,p_event_result=>'FALSE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1409079274461836135)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1507164775788542860)
,p_name=>'refresh on category change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P88_CATEGORY'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P88_PRODUCT'') != ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507164865776542861)
,p_event_id=>wwv_flow_api.id(1507164775788542860)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P88_CATEGORY'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507164963841542862)
,p_event_id=>wwv_flow_api.id(1507164775788542860)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506950716289262260)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507165035818542863)
,p_event_id=>wwv_flow_api.id(1507164775788542860)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506951135916262265)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507165184110542864)
,p_event_id=>wwv_flow_api.id(1507164775788542860)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1409079274461836135)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1507165325748542865)
,p_name=>'refresh on fix by change'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P88_FIX_BY'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P88_PRODUCT'') != ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507165340174542866)
,p_event_id=>wwv_flow_api.id(1507165325748542865)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P88_FIX_BY'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507165453523542867)
,p_event_id=>wwv_flow_api.id(1507165325748542865)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506950716289262260)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507165603363542868)
,p_event_id=>wwv_flow_api.id(1507165325748542865)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506951135916262265)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507165663208542869)
,p_event_id=>wwv_flow_api.id(1507165325748542865)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1409079274461836135)
,p_stop_execution_on_error=>'Y'
);
end;
/
