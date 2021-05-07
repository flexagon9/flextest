prompt --application/pages/page_00052
begin
wwv_flow_api.create_page(
 p_id=>52
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Closure Rates'
,p_step_title=>'Closure Rates'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2509222245997328767)
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Change the select list filters at the top of the page to change the results displayed on this page. Change the select list filters at the top of a page region to change the results displayed in that page region.'
,p_last_upd_yyyymmddhh24miss=>'20180201115421'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1410308817517133708)
,p_plug_name=>'Filed vs Closed by Week'
,p_region_template_options=>'js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with the_dates as',
'(',
'select to_char(created,''YYYY'')||decode(to_char(created,''WW''), ''53'', ''52'', to_char(created,''WW'')) the_date ',
'from EBA_BT_SW_DEFECTS b',
'where created is not null and',
'      (NVL(:P52_PRODUCT,0) = 0 or product_id = :P52_PRODUCT) and',
'      (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) ',
'group by to_char(created,''YYYY'')||decode(to_char(created,''WW''), ''53'', ''52'', to_char(created,''WW''))',
'union',
'select to_char(date_closed,''YYYY'')||decode(to_char(date_closed,''WW''), ''53'', ''52'', to_char(date_closed,''WW'')) the_date ',
'from EBA_BT_SW_DEFECTS b',
'where DATE_CLOSED is not null and',
'      (NVL(:P52_PRODUCT,0) = 0 or product_id = :P52_PRODUCT) and',
'      (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) ',
'group by  to_char(date_closed,''YYYY'')||decode(to_char(date_closed,''WW''), ''53'', ''52'', to_char(date_closed,''WW''))',
')',
'select the_date, created, closed, created - closed delta, substr(the_date,5) year_week, ',
'       to_date( substr(the_date,1,4)|| to_char((7 * least(to_number(substr(the_date,5,2)),52) - 0)) ,''YYYYDDD'') week_start,',
'       to_char((7 * least(to_number(substr(the_date,5,2)),52) - 0)) day_of_year',
'from',
'(',
'select the_dates.the_date,',
'       (select count(*) ',
'        from EBA_BT_SW_DEFECTS b',
'        where to_char(created,''YYYY'')||decode(to_char(created,''WW''), ''53'', ''52'', to_char(created,''WW'')) = the_dates.the_date and',
'              (NVL(:P52_PRODUCT,0) = 0 or product_id = :P52_PRODUCT) and',
'              (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) ',
'        ) created,',
'       (select count(*) ',
'        from EBA_BT_SW_DEFECTS b',
'        where to_char(date_closed,''YYYY'')||decode(to_char(date_closed,''WW''), ''53'', ''52'', to_char(date_closed,''WW'')) = the_dates.the_date  and',
'              (NVL(:P52_PRODUCT,0) = 0 or product_id = :P52_PRODUCT) and',
'              (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) ',
'        ) closed',
'from the_dates',
') y'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1410309013454133717)
,p_name=>'Developers'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>1400239484450193892
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1410313295578142987)
,p_db_column_name=>'CREATED'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Filed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1410313393984142988)
,p_db_column_name=>'CLOSED'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Closed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1410630455445187612)
,p_db_column_name=>'THE_DATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'The Date'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1410695199122194714)
,p_db_column_name=>'DELTA'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'S999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1413853634885290064)
,p_db_column_name=>'YEAR_WEEK'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Year Week'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1420693559977814378)
,p_db_column_name=>'WEEK_START'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Week Ending'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY Day'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1421466548428156923)
,p_db_column_name=>'DAY_OF_YEAR'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Day of Year'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1410311037094133738)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'14002416'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WEEK_START:CREATED:CLOSED:DELTA:YEAR_WEEK'
,p_sort_column_1=>'WEEK_START'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'YEAR_MONTH'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'YEAR_WEEK'
,p_sort_direction_3=>'DESC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'DESC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_sum_columns_on_break=>'OPEN_BUGS:CLOSED_BUGS:OPEN_BUGS_S3:OPEN_BUGS_S2:OPEN_BUGS_S1:OPEN_BUGS_S4:OPEN_BUGS_P1:OPEN_BUGS_P3:OPEN_BUGS_P2:OPEN_BUGS_P4'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1410311707281133752)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1421794473316550821)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1506952159369262275)
,p_plug_name=>'Delta of filed minus closed by week'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1507133337883400127)
,p_region_id=>wwv_flow_api.id(1506952159369262275)
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
 p_id=>wwv_flow_api.id(1507133443755400128)
,p_chart_id=>wwv_flow_api.id(1507133337883400127)
,p_seq=>10
,p_name=>'Week Ending'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with the_dates as',
'/* get the distinct list of weeks */',
'(',
'select to_char(created,''YYYY'')||decode(to_char(created,''WW''), ''53'', ''52'', to_char(created,''WW'')) the_date ',
'from EBA_BT_SW_DEFECTS b',
'where created is not null and',
'      (NVL(:P52_PRODUCT,0) = 0 or product_id = :P52_PRODUCT) and',
'      created >= sysdate - :P52_SINCE and',
'      (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) ',
'group by to_char(created,''YYYY'')||decode(to_char(created,''WW''), ''53'', ''52'', to_char(created,''WW''))',
'union',
'select to_char(date_closed,''YYYY'')||decode(to_char(date_closed,''WW''), ''53'', ''52'', to_char(date_closed,''WW'')) the_date ',
'from EBA_BT_SW_DEFECTS b',
'where DATE_CLOSED is not null and',
'      (NVL(:P52_PRODUCT,0) = 0 or product_id = :P52_PRODUCT) and',
'      created >= sysdate - :P52_SINCE and',
'      (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) ',
'group by  to_char(date_closed,''YYYY'')||decode(to_char(date_closed,''WW''), ''53'', ''52'', to_char(date_closed,''WW''))',
')',
'/* report created minus closed */',
'select to_date( substr(the_date,1,4)||to_char((7 * to_number(substr(the_date,5,2)))),''YYYYDDD'') x, (NVL(created,0) - NVL(closed,0)) y',
'from',
'/* find fixed and filed for each week */',
'(',
'select the_dates.the_date,',
'       (select count(*) ',
'        from EBA_BT_SW_DEFECTS b',
'        where to_char(created,''YYYY'')||decode(to_char(created,''WW''), ''53'', ''52'', to_char(created,''WW'')) = the_dates.the_date and',
'              (NVL(:P52_PRODUCT,0) = 0 or product_id = :P52_PRODUCT) and',
'              created >= sysdate - :P52_SINCE and',
'      (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) ',
'        ) created,',
'       (select count(*) ',
'        from EBA_BT_SW_DEFECTS b',
'        where to_char(date_closed,''YYYY'')||decode(to_char(date_closed,''WW''), ''53'', ''52'', to_char(date_closed,''WW'')) = the_dates.the_date  and',
'              (NVL(:P52_PRODUCT,0) = 0 or product_id = :P52_PRODUCT) and',
'              DATE_CLOSED >= sysdate - :P52_SINCE and',
'              (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) ',
'        ) closed',
'from the_dates',
') y',
'order by 1',
''))
,p_ajax_items_to_submit=>'P52_SINCE'
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
 p_id=>wwv_flow_api.id(1507133715872400130)
,p_chart_id=>wwv_flow_api.id(1507133337883400127)
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
 p_id=>wwv_flow_api.id(1507133623177400129)
,p_chart_id=>wwv_flow_api.id(1507133337883400127)
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
 p_id=>wwv_flow_api.id(2179013645828189632)
,p_plug_name=>'Summary'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with fltr as (',
'    select decode(nvl(:P52_PRODUCT,0),0,'''',''IR_PRODUCT_ID'') cols,',
'        decode(nvl(:P52_PRODUCT,0),0,'''',:P52_PRODUCT) vals,',
'        decode(nvl(:P52_PRODUCT,0),0,''IR_IS_OPEN'',''IR_PRODUCT_ID,IR_IS_OPEN'') op_cols,',
'        decode(nvl(:P52_PRODUCT,0),0,''Yes'',:P52_PRODUCT||'',Yes'') op_vals,',
'        ''f?p=''||:APP_ID||'':23:''||:APP_SESSION||'':::23,RIR:'' base_url',
'    from dual',
'), pri as (',
'    select top_priority.id top_id,',
'        top_priority.name top_name',
'    from (  select bu.urgency_name name, bu.id, row_number() over (order by sequence_number) rn',
'            from eba_bt_urgency bu',
'            where is_active = ''Y'' ) top_priority',
'    where top_priority.rn = 1',
'), sev as (',
'    select top_severity.id top_id,',
'        top_severity.name top_name',
'    from (  select bs.severity_name name, bs.id id, row_number() over (order by sequence_number) rn',
'            from eba_bt_severity bs',
'            where bs.is_active = ''Y'' ) top_severity',
'    where top_severity.rn = 1',
')',
'-- Total',
'select ''Total Bugs'' label, count(*) val,',
'    fltr.base_url||fltr.cols||'':''||fltr.vals url',
'from eba_bt_sw_defects b, fltr',
'where (nvl(:P52_PRODUCT,0) = 0',
'    or product_id = :P52_PRODUCT)  and',
'      (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) and',
'    b.status_id not in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'')',
'union all',
'-- Total',
'select ''Open Bugs'' label, count(*) val,',
'    fltr.base_url||fltr.op_cols||'':''||fltr.op_vals url',
'from eba_bt_sw_defects b,',
'    eba_bt_status s,',
'    fltr',
'where b.status_id = s.id',
'    and b.status_id in ( select id from eba_bt_status where is_open = ''Y'')',
'    and (nvl(:P52_PRODUCT,0) = 0 or b.product_id = :P52_PRODUCT) and',
'      (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) and',
'    b.status_id not in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'')',
'union all',
'-- Total',
'select ''Open Priority: ''||pri.top_name label,',
'    (   select count(*)',
'        from eba_bt_sw_defects b',
'        where b.urgency_id = pri.top_id',
'            and b.status_id in ( select id from eba_bt_status where is_open = ''Y'')',
'            and (nvl(:P52_PRODUCT,0) = 0 or b.product_id = :P52_PRODUCT) ',
'            and (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) ',
'    ) val,',
'    fltr.base_url||fltr.op_cols||'',IR_PRIORITY_ID:''||fltr.op_vals||'',''',
'        ||nvl( pri.top_id, 0 ) url',
'from fltr, pri',
'union all',
'-- Total',
'select ''Open Severity: ''||sev.top_name label, ',
'    (   select count(*)',
'        from eba_bt_sw_defects b',
'        where severity_id = sev.top_id',
'            and (nvl(:P52_PRODUCT,0) = 0 or product_id = :P52_PRODUCT)',
'            and status_id in ( select id from eba_bt_status where is_open = ''Y'') ',
'            and (NVL(:P52_FIX_BY,0) = 0 or :P52_FIX_BY = b.FIX_BY_VERSION_ID) and',
'            b.status_id not in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'')',
'    ) val,',
'    fltr.base_url||fltr.op_cols||'',IR_SEVERITY_ID:''||fltr.op_vals||'',''||sev.top_id url',
'from fltr, sev'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_customized=>'1'
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VAL'
,p_attribute_04=>'&URL.'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1410311311741133748)
,p_button_sequence=>10
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1410311844970133752)
,p_name=>'P52_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1410311707281133752)
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
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1413907590430390080)
,p_name=>'P52_SINCE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1506952159369262275)
,p_item_default=>'140'
,p_prompt=>'Since'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SINCE'
,p_lov=>'.'||wwv_flow_api.id(3990156527528091805)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Show All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1414449079653967980)
,p_name=>'P52_FIX_BY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1410311707281133752)
,p_item_default=>'0'
,p_prompt=>'Fix By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select version_name, id',
'from eba_bt_version v',
'where nvl(:P52_PRODUCT, 0) = 0 or (product_id = :P52_PRODUCT and exists (select 1 from eba_bt_sw_defects x where x.fix_by_version_id = v.id))',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1415236857461045486)
,p_computation_sequence=>20
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1507166263155542875)
,p_name=>'refresh on product change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P52_PRODUCT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P52_PRODUCT'') == ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507204289115717026)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P52_PRODUCT := 0;'
,p_attribute_02=>'P52_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507204338067717027)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P52_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507204472958717028)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P52_FIX_BY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507204724328717030)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''.apex-rds-container'').parent(''div'').hide();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507206778541717051)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P52_FIX_BY'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507204559758717029)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P52_FIX_BY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507204913191717032)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2179013645828189632)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507204750842717031)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''.apex-rds-container'').parent(''div'').show();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507205059044717034)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506952159369262275)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507205297766717036)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1410308817517133708)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507205430593717038)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2179013645828189632)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507205599106717039)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'FALSE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506952159369262275)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507205657668717040)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'FALSE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1410308817517133708)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507204955433717033)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'FALSE'
,p_action_sequence=>90
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2179013645828189632)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507205178026717035)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'FALSE'
,p_action_sequence=>100
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506952159369262275)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507205360340717037)
,p_event_id=>wwv_flow_api.id(1507166263155542875)
,p_event_result=>'FALSE'
,p_action_sequence=>110
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1410308817517133708)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1507205794631717041)
,p_name=>'refresh on fix by change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P52_FIX_BY'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P52_PRODUCT'') != ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507205906726717042)
,p_event_id=>wwv_flow_api.id(1507205794631717041)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P52_FIX_BY'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507205931552717043)
,p_event_id=>wwv_flow_api.id(1507205794631717041)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2179013645828189632)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507206102805717044)
,p_event_id=>wwv_flow_api.id(1507205794631717041)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506952159369262275)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507206175609717045)
,p_event_id=>wwv_flow_api.id(1507205794631717041)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1410308817517133708)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1507206277180717046)
,p_name=>'Refresh Delta on since change'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P52_SINCE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P52_PRODUCT'') != ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507206365345717047)
,p_event_id=>wwv_flow_api.id(1507206277180717046)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P52_SINCE,P52_PRODUCT,P52_FIX_BY'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507206470558717048)
,p_event_id=>wwv_flow_api.id(1507206277180717046)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1506952159369262275)
,p_stop_execution_on_error=>'Y'
);
end;
/
