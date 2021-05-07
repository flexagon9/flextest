prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Products Dashboard'
,p_step_title=>'Products Dashboard'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506150059449829428)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_help_text=>'This page shows several charts and graphs for products that the bugs in this application have been logged against. Changing the product filter on this page not only changes the results displayed on this page, but it also sets the selected product as '
||'the default product to report on in several other pages of the application. Click the <strong>Create Bug</strong> button to create a new bug. The "Recent Bugs" region has a <strong>+</strong> button that can be used to create a new bug as well. All c'
||'hart regions have a maximize button in their upper right-hand corner of their region. Most chart regions have a <strong>></strong> button that, when clicked, will display more details about the chart''s data.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190510062452'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37836208666131722)
,p_plug_name=>'Open External Customer Bugs'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>120
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(c.customer_Name) the_name, ',
'       count(*) c,',
'       c.id',
'from EBA_BT_SW_DEFECTS d,',
'     EBA_BT_CUSTOMERS c',
'where c.id = d.customer_id and ',
'      (product_id = :P1_PRODUCT or nvl(:P1_PRODUCT,0) = 0) and',
'      d.status_id not in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'') and',
'      NVL(c.is_internal_yn,''N'') = ''N'' and',
'      d.status_id  in (select id from eba_bt_status where NVL(is_open,''Y'') = ''Y'') ',
'group by upper(c.customer_Name)  , c.ID',
'order by 2 desc '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_ajax_items_to_submit=>'P1_PRODUCT'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'THE_NAME'
,p_attribute_03=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR,:IR_CUSTOMER_ID,IR_IS_OPEN:&ID.,Yes'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'50'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No open external customer bugs found.'
,p_plug_comment=>'style="height: 208px; overflow: hidden;" data-grid="col_2" data-grid-start="no" '
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(678331167275157242)
,p_plug_name=>'Open vs Closed'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:i-h320:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_comment=>'I changed this from "All Bugs by Status" to "All Bugs by Product" due to bug 17217799 - Allan 8-AUG-2013'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(678331265553157243)
,p_region_id=>wwv_flow_api.id(678331167275157242)
,p_chart_type=>'donut'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>.02
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'No bugs found.'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(678331377090157244)
,p_chart_id=>wwv_flow_api.id(678331265553157243)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     decode(b.is_open,''Y'',''Open'',''N'',''Closed'',null,''Open'') bug_status,',
'     count(*) c',
'from EBA_BT_SW_DEFECTS a, ',
'    eba_bt_status b ',
'where a.STATUS_ID = b.id (+) and',
'      (nvl(:P1_PRODUCT,0) = 0 or product_id = :P1_PRODUCT)',
'      and NVL(b.is_enhancement,''N'') = ''N''',
'group by decode(b.is_open,''Y'',''Open'',''N'',''Closed'',null,''Open'')'))
,p_items_value_column_name=>'C'
,p_items_label_column_name=>'BUG_STATUS'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(678331633554157247)
,p_plug_name=>'Open Bugs by Status'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:i-h320:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_plug_comment=>' style="height: 400px; overflow: hidden;" data-grid="col_2" data-grid-start="yes"  '
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(678331783577157248)
,p_region_id=>wwv_flow_api.id(678331633554157247)
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
 p_id=>wwv_flow_api.id(678331925975157249)
,p_chart_id=>wwv_flow_api.id(678331783577157248)
,p_seq=>10
,p_name=>'Open Bugs by Status'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select substr(c.status_name,1,20) status_name,',
'       count(*) c',
'from EBA_BT_SW_DEFECTS d,',
'                EBA_BT_STATUS c ',
'where  c.id = d.status_id and ',
'       (product_id = :P1_PRODUCT or nvl(:P1_PRODUCT,0) = 0) and',
'       c.id in (select id from eba_bt_status where nvl(is_open,''Y'') = ''Y'') and',
'       c.id not in (select id from eba_bt_status where nvl(is_enhancement,''N'') = ''Y'') ',
'group by c.status_name',
'order by 2 desc'))
,p_items_value_column_name=>'C'
,p_items_label_column_name=>'STATUS_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(678331936555157250)
,p_chart_id=>wwv_flow_api.id(678331783577157248)
,p_axis=>'x'
,p_is_rendered=>'on'
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
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(678332033169157251)
,p_chart_id=>wwv_flow_api.id(678331783577157248)
,p_axis=>'y'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_api.id(883556854784459871)
,p_plug_name=>'Open Bugs by Status'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select substr(c.status_name,1,20) status_name,',
'       d.status_id,',
'       count(*) c,',
'       c.status_name full_status_name',
'  from EBA_BT_SW_DEFECTS d,',
'       EBA_BT_STATUS c ',
' where c.id = d.status_id and ',
'       (product_id = NVL(:P1_PRODUCT,0) or nvl(:P1_PRODUCT,0) = 0) and',
'       c.id in (select id from eba_bt_status where nvl(is_open,''Y'') = ''Y'') and',
'       c.id not in (select id from eba_bt_status where nvl(is_enhancement,''N'') = ''Y'') ',
' group by c.status_name, d.status_id',
' order by 3 desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_customized=>'1'
,p_plug_comment=>' style="height: 400px; overflow: hidden;" data-grid="col_2" data-grid-start="yes"  '
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(883557093180459873)
,p_region_id=>wwv_flow_api.id(883556854784459871)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
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
 p_id=>wwv_flow_api.id(883557178505459874)
,p_chart_id=>wwv_flow_api.id(883557093180459873)
,p_seq=>10
,p_name=>'Bugs'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'C'
,p_group_short_desc_column_name=>'FULL_STATUS_NAME'
,p_items_label_column_name=>'FULL_STATUS_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR:IRC_STATUS_NAME,IREQ_PRODUCT_ID:&STATUS_ID.,&P1_PRODUCT.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(934808672812867926)
,p_chart_id=>wwv_flow_api.id(883557093180459873)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>50
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
 p_id=>wwv_flow_api.id(883557229873459875)
,p_chart_id=>wwv_flow_api.id(883557093180459873)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'none'
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
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1251654876762743539)
,p_name=>'Recent Bugs'
,p_template=>wwv_flow_api.id(1225690169574288324)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--horizontalBorders'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select bug_number, ',
'       subject,',
'       status,',
'       updated,',
'       assignee, ',
'       bug_id, ',
'       null details,',
'       upd_date',
'from (',
'select ',
'    BUG_NUMBER,',
'    subject,',
'    (select substr(status_name,1,50) from EBA_BT_STATUS c where c.id = d.status_id) status,',
'    nvl(d.created, nvl(d.updated,d.submitted_on)) submitted_on,',
'    p.PRODUCT_NAME,',
'    d.ASSIGNED_TO_ID,',
'    (select username from eba_bt_users u where u.id = d.ASSIGNED_TO_ID) assignee,',
'    (select SEVERITY_NAME from EBA_BT_SEVERITY c where c.id = d.SEVERITY_id) severity,',
'    (select URGENCY_NAME from eba_bt_urgency u where d.urgency_id = u.id) priority,',
'    d.id bug_id,',
'    decode(b.is_open,''Y'',''Yes'',''N'',''No'',''Yes'') is_open,',
'    d.updated,',
'    nvl(d.updated,d.submitted_on) upd_date',
'from  EBA_BT_SW_DEFECTS d,',
'      eba_bt_product p,',
'      eba_bt_status b',
'where p.id = d.product_id and',
'      d.STATUS_ID = b.id (+) and ',
'      (d.product_id = :P1_PRODUCT or nvl(:P1_PRODUCT,0) = 0) and',
'      nvl(d.is_active,''Y'') = ''Y'' and',
'      NVL(b.is_enhancement,''N'') = ''N''',
'order by nvl(d.updated,d.submitted_on) desc)',
'where rownum <= 20',
'order by upd_date desc'))
,p_customized=>'1'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1_PRODUCT'
,p_query_row_template=>wwv_flow_api.id(1225695925336288332)
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_row_count_max=>20
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1366275067226497065)
,p_query_column_id=>1
,p_column_alias=>'BUG_NUMBER'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1366275197360497066)
,p_query_column_id=>2
,p_column_alias=>'SUBJECT'
,p_column_display_sequence=>2
,p_column_heading=>'Bug'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:31:&APP_SESSION.::NO:RP,31:P31_ID:#BUG_ID#">#BUG_NUMBER#: #SUBJECT#</a><br />',
'<small>Assigned to #ASSIGNEE#</small>'))
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1366275242393497067)
,p_query_column_id=>3
,p_column_alias=>'STATUS'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1366275528227497069)
,p_query_column_id=>4
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1366275812490497072)
,p_query_column_id=>5
,p_column_alias=>'ASSIGNEE'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1366276112706497075)
,p_query_column_id=>6
,p_column_alias=>'BUG_ID'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1525493133636756857)
,p_query_column_id=>7
,p_column_alias=>'DETAILS'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1525493300015756858)
,p_query_column_id=>8
,p_column_alias=>'UPD_DATE'
,p_column_display_sequence=>8
,p_column_heading=>'<spab class="u-VisuallyHidden">Updated</span>'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE_SHORT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1342080310132321049)
,p_plug_name=>'Open Bugs by Product Category'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.category_name,',
'       count(*) c',
'  from eba_bt_sw_defects d,',
'       eba_bt_category p,',
'       eba_bt_status c',
' where p.id = d.category_id ',
'   and c.id = d.status_id ',
'   and nvl(d.is_active,''Y'') = ''Y''',
'   and (d.product_id = :P1_PRODUCT or nvl(:P1_PRODUCT,0) = 0)',
'   and c.id in (select id from eba_bt_status where nvl(is_open,''Y'') = ''Y'')',
' group by P.category_name ',
' order by 2 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P1_PRODUCT'
,p_plug_display_when_cond2=>'0'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'CATEGORY_NAME'
,p_attribute_03=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR,:IR_CATEGORY,IR_IS_OPEN:&CATEGORY_NAME.,Yes'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'20'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No data found.'
,p_plug_comment=>' style="height: 608px; overflow: hidden;" data-grid="col_2" data-grid-start="no"  '
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4388516439434739855)
,p_plug_name=>'Tags'
,p_region_template_options=>'js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>130
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ts.tag, ts.tag_count',
'  from eba_bt_tags_sum ts',
' where ts.tag_count > 0',
'order by ts.tag_count desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_no_data_found=>'No tags found.'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'f?p=&APP_ID.:23:&APP_SESSION.:::RIR:IRC_TAGS:#TAG#'
,p_attribute_02=>'100'
,p_attribute_03=>'Y'
,p_plug_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'data-grid="col_1" data-grid-start="yes" ',
''))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4396775241072571997)
,p_plug_name=>'Time Zone'
,p_region_css_classes=>'infoTextRegion'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>'"TIMEZONE"'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5496427380280940723)
,p_plug_name=>'Top Bar'
,p_region_template_options=>'t-Region--noPadding:#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(883556580021459868)
,p_plug_name=>'Product Filter'
,p_parent_plug_id=>wwv_flow_api.id(5496427380280940723)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2434965735049417453)
,p_plug_name=>'Bug Summary'
,p_parent_plug_id=>wwv_flow_api.id(5496427380280940723)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--stacked:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with fltr as (',
'    select decode(nvl(:P1_PRODUCT,0),0,'''',''IR_PRODUCT_ID'') cols,',
'        decode(nvl(:P1_PRODUCT,0),0,'''',:P1_PRODUCT) vals,',
'        decode(nvl(:P1_PRODUCT,0),0,''IR_IS_OPEN'',''IR_PRODUCT_ID,IR_IS_OPEN'') op_cols,',
'        decode(nvl(:P1_PRODUCT,0),0,''Yes'',:P1_PRODUCT||'',Yes'') op_vals,',
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
'            where bs.is_active = ''Y''  ) top_severity',
'    where top_severity.rn = 1',
')',
'-- Total',
'select ''Total Bugs'' label, ',
'        trim(to_char(count(*),''999G999G999G999G990'')) val,',
'        fltr.base_url||fltr.cols||'':''||fltr.vals url',
'from eba_bt_sw_defects b, eba_bt_status s, fltr',
'where (nvl(:P1_PRODUCT,0) = 0',
'    or product_id = :P1_PRODUCT) and ',
'    b.status_id = s.id and',
'    b.status_id not in ( select id from eba_bt_status where NVL(is_enhancement,''N'')=''Y'')',
'union all',
'-- Total',
'select ''Open Bugs'' label, trim(to_char(count(*),''999G999G999G999G990'')) val,',
'    fltr.base_url||fltr.op_cols||'':''||fltr.op_vals url',
'from eba_bt_sw_defects b,',
'    eba_bt_status s,',
'    fltr',
'where b.status_id = s.id',
'    and b.status_id in ( select id from eba_bt_status where is_open = ''Y'' and NVL(is_enhancement,''N'')=''N'')',
'    and (nvl(:P1_PRODUCT,0) = 0 or b.product_id = :P1_PRODUCT)',
'union all',
'-- Total',
'select ''Open Priority: ''||pri.top_name label,',
'    trim (to_char ( (   select count(*)',
'        from eba_bt_sw_defects b',
'        where b.urgency_id = pri.top_id',
'            and b.status_id in ( select id from eba_bt_status where is_open = ''Y'')',
'            and b.status_id not in ( select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'')',
'            and (nvl(:P1_PRODUCT,0) = 0 or b.product_id = :P1_PRODUCT)',
'    ),''999G999G999G999G990'')) val,',
'    fltr.base_url||fltr.op_cols||'',IR_PRIORITY_ID:''||fltr.op_vals||'',''',
'        ||nvl( pri.top_id, 0 ) url',
'from fltr, pri',
'union all',
'-- Total',
'select ''Open Severity: ''||sev.top_name label, ',
'    trim( to_char ( (   select count(*)',
'        from eba_bt_sw_defects ',
'        where severity_id = sev.top_id',
'            and (nvl(:P1_PRODUCT,0) = 0 or product_id = :P1_PRODUCT)',
'            and status_id in ( select id from eba_bt_status where is_open = ''Y'')',
'            and status_id not in ( select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'')',
'    ),''999G999G999G999G990''))  val,',
'    fltr.base_url||fltr.op_cols||'',IR_SEVERITY_ID:''||fltr.op_vals||'',''||sev.top_id url',
'from fltr, sev'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_customized=>'1'
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VAL'
,p_attribute_04=>'&URL.'
,p_attribute_05=>'4'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5587574083078024019)
,p_plug_name=>'Open Bugs by Product'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.PRODUCT_NAME,',
'       count(*) c',
'	from EBA_BT_SW_DEFECTS d,',
'             eba_bt_product p,',
'             eba_bt_status c',
'	where p.id = d.product_id ',
'        and c.id = d.status_id ',
'        and nvl(d.is_active,''Y'') = ''Y''',
'	and (d.product_id = :P1_PRODUCT or nvl(:P1_PRODUCT,0) = 0)',
'and',
'       c.id in (select id from eba_bt_status where nvl(is_open,''Y'') = ''Y'') and',
'       NVL(c.is_enhancement,''N'') = ''N''',
'	group by P.PRODUCT_NAME ',
'	order by 2 desc '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_PRODUCT'
,p_plug_display_when_cond2=>'0'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'PRODUCT_NAME'
,p_attribute_03=>'f?p=&APP_ID.:23:&APP_SESSION.::&DEBUG.:23,RIR,RP:IR_PRODUCT_NAME:&PRODUCT_NAME.'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'20'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No data found.'
,p_plug_comment=>' style="height: 608px; overflow: hidden;" data-grid="col_2" data-grid-start="no"  '
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5597464174112010049)
,p_plug_name=>'Open Bugs by Severity '
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.SEVERITY_NAME SEVERITY_NAME, ',
'       count(*) c,',
'       c.sequence_number SEVERITY_NUMBER',
'from EBA_BT_SW_DEFECTS d,',
'                EBA_BT_SEVERITY c,',
'      EBA_BT_STATUS s',
'where s.id = d.status_id and',
'      c.id = d.SEVERITY_id and ',
'      (product_id = :P1_PRODUCT or nvl(:P1_PRODUCT,0) = 0) and',
'      s.id not in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'') and',
'      s.id in (select id from eba_bt_status where nvl(is_open,''Y'') = ''Y'') ',
'group by c.sequence_number, c.SEVERITY_NAME  ',
'order by 3 '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'SEVERITY_NAME'
,p_attribute_03=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR,:IR_SEVERITY_NUMBER,IR_IS_OPEN:&SEVERITY_NUMBER.,Yes'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'5'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No data found.'
,p_plug_comment=>'style="height: 208px; overflow: hidden;" data-grid="col_2" data-grid-start="no" '
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5597466580055115818)
,p_plug_name=>'Top Open Bug Assignees'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(u.username) as label,',
'       count(*) c,',
'       assigned_to_id',
'from eba_bt_sw_defects d,',
'                eba_bt_users u ',
'where ASSIGNED_TO_ID = u.id and ',
'      (product_id = :P1_PRODUCT or nvl(:P1_PRODUCT,0) = 0) and',
'      d.status_id not in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'') and',
'      d.status_id  in (select id from eba_bt_status where NVL(is_open,''Y'') = ''Y'')',
'group by lower(u.username ), assigned_to_id',
'order by 2 desc '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'LABEL'
,p_attribute_03=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR,:IR_ASSIGNED_TO_ID,IR_IS_OPEN:&ASSIGNED_TO_ID.,Yes'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'20'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No data found.'
,p_plug_comment=>' style="height: 208px; overflow: hidden;" data-grid="col_2" data-grid-start="yes"  '
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5497236964960832444)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(883556580021459868)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1066008428611563569)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9594180850946618485)
,p_button_name=>'CREATE_BUG'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Super Puper New Bug'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:RP,93::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(883556992904459872)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(883556854784459871)
,p_button_name=>'VIEW_STATUS2_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View by Status'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP:P12_CONTROL_BREAK:STATUS'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1342080393652321050)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1342080310132321049)
,p_button_name=>'VIEW_PRODUCTS_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View Products'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1058274075502793521)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9594180850946618485)
,p_button_name=>'SYNC'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Sync'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_required_patch=>wwv_flow_api.id(16725495374012530)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5496433183276007850)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1251654876762743539)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:93::'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5496434287348027894)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(1251654876762743539)
,p_button_name=>'VIEW_BUGS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View Bugs'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4399393057487224201)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(5597466580055115818)
,p_button_name=>'VIEW_assignees'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View Assignees'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4399392427705215562)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(5587574083078024019)
,p_button_name=>'VIEW_PRODUCTS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View Products'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4399393550476241088)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(5597464174112010049)
,p_button_name=>'VIEW_SEVERITY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View by Severity'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP:P12_CONTROL_BREAK:SEVERITY'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4454822044638086053)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(4388516439434739855)
,p_button_name=>'VIEW_TAGS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View Tags'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4390474550029521014)
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,66:P66_TAG,P66_ASSIGNEE,P66_BUG_NUMBER,P66_STATUS,P66_PRODUCT:,,,'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 23-FEB-2012 13:19 by MIKE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5496427774178948474)
,p_name=>'P1_PRODUCT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(883556580021459868)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Choose the product name'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6325282581800521944)
,p_name=>'P1_LAST_PAGE_VISITED'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4396775241072571997)
,p_use_cache_before_default=>'NO'
,p_source=>'&P1_LAST_PAGE_VISITED.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4390474239987518085)
,p_computation_sequence=>10
,p_computation_item=>'P66_SEARCH'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&P1_SEARCH.'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5597468190631232421)
,p_computation_sequence=>20
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(941699882240969864)
,p_name=>'Refresh Regions on Sync'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(1058274075502793521)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(941700024537969865)
,p_event_id=>wwv_flow_api.id(941699882240969864)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5587574083078024019)
,p_attribute_01=>'location.reload();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1350261644543451853)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set product ID and name'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':PRODUCT_ID := nvl(:P1_PRODUCT,0);',
':P6_PRODUCT := :PRODUCT_ID;',
':P12_PRODUCT := :PRODUCT_ID;',
':P14_PRODUCT := :PRODUCT_ID;',
':P22_PRODUCT := :PRODUCT_ID;',
':P15_PRODUCT := :PRODUCT_ID;',
':P34_PRODUCT := :PRODUCT_ID;',
':P52_PRODUCT := :PRODUCT_ID;',
':P88_PRODUCT := :PRODUCT_ID;',
':P53_PRODUCT := :PRODUCT_ID;',
':P55_PRODUCT := :PRODUCT_ID;',
':P38_PRODUCT := :PRODUCT_ID;',
':P42_PRODUCT := :PRODUCT_ID;',
':P420_PRODUCT := :PRODUCT_ID;',
':P86_PRODUCT := :PRODUCT_ID;',
':P85_PRODUCT := :PRODUCT_ID;',
':P90_PRODUCT := :PRODUCT_ID;',
'',
':PRODUCT_NAME := null;',
'for c1 in (select product_name from eba_bt_product where id = :PRODUCT_ID) loop',
'   :PRODUCT_NAME := c1.product_name;',
'end loop;'))
);
end;
/
