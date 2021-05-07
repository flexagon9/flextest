prompt --application/pages/page_00058
begin
wwv_flow_api.create_page(
 p_id=>58
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Dashboard'
,p_step_title=>'Dashboard'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506150059449829428)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page displays a bubble chart of bugs by product and a bug number metrics report. Both regions on this page can be maximized by clicking the region''s <strong>Maximize</strong> button (in the upper right-hand corner of each region).'
,p_last_upd_yyyymmddhh24miss=>'20180201115421'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1669036909355851780)
,p_plug_name=>'Open Bugs by Product'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(720320576641820470)
,p_region_id=>wwv_flow_api.id(1669036909355851780)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
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
 p_id=>wwv_flow_api.id(720320684636820471)
,p_chart_id=>wwv_flow_api.id(720320576641820470)
,p_seq=>10
,p_name=>'Open Bugs by Product'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   id,',
'   product_name,',
'   product_name the_label,',
'   description,    --',
'    (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where b.PRODUCT_ID = p.id and',
'          status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'' and NVL(is_enhancement,''N'') = ''N'')) open_bugs,',
'   ''f?p=''||:APP_ID||'':1:''||:APP_SESSION||'':::1:P1_PRODUCT:''||p.id the_link',
'from EBA_BT_PRODUCT p'))
,p_items_value_column_name=>'OPEN_BUGS'
,p_items_label_column_name=>'THE_LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'#THE_LINK#'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(720320912122820473)
,p_chart_id=>wwv_flow_api.id(720320576641820470)
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
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(720320778971820472)
,p_chart_id=>wwv_flow_api.id(720320576641820470)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1669137304379317534)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--showBreadcrumb:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(1225683943093288318)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(9594178551161609111)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1225705996474288347)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1669196136335497656)
,p_plug_name=>'Metrics'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select the_label, to_char(the_value,''999G999G999G999G990'') the_value from',
'(',
'select',
'   ''Products''  the_label,',
'   (select count(*) from EBA_BT_PRODUCT p) the_value',
'from dual',
'union all',
'select',
'   ''Open Bugs''  the_label,',
'   (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where ',
'          status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'' and NVL(is_enhancement,''N'') = ''N'')) the_value',
'from dual',
'union all',
'select',
'   ''Bugs''  the_label,',
'   (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where ',
'          status_id in (select id',
'          from eba_bt_status ',
'          where NVL(is_enhancement,''N'') = ''N'')) the_value',
'from dual',
'union all',
'select',
'   ''Enhancements''  the_label,',
'   (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where ',
'          status_id in (select id',
'          from eba_bt_status ',
'          where NVL(is_enhancement,''N'') = ''Y'')) the_value',
'from dual',
'union all',
'select',
'   ''All Bugs and Enhancements''  the_label,',
'   (select count(*) ',
'    from EBA_BT_SW_DEFECTS b) the_value',
'from dual',
') x',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'THE_LABEL'
,p_attribute_02=>'THE_VALUE'
,p_attribute_04=>'#'
,p_attribute_05=>'2'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'Y'
);
end;
/
