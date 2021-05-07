prompt --application/pages/page_00053
begin
wwv_flow_api.create_page(
 p_id=>53
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Fix By'
,p_step_title=>'Fix By'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_help_text=>'Use the product and category select lists to filter this report by a specific product and/or category. Click the <strong>Reset</strong> button to reset the filters, bar graph, and report.'
,p_last_upd_yyyymmddhh24miss=>'20180201115421'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1065584754643299344)
,p_plug_name=>'Fix By Open Bugs'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l||'' (''||v||'')'' l,',
'       v,',
'       id',
'from(',
'select',
'     nvl(c.version_name,''NONE DEFINED'') l,',
'     count(*) v,',
'     nvl(c.id,0) id',
'from EBA_BT_SW_DEFECTS a,',
'     eba_bt_status b,',
'     eba_bt_version c',
'where (:P53_PRODUCT = 0 or a.product_id = :P53_PRODUCT) and',
'      (NVL(:P53_PRODUCT,0) != 0 ) and',
'      (:P53_CATEGORY = 0 or a.category_id = :P53_CATEGORY) and',
'      a.status_id = b.id (+) and',
'      a.FIX_BY_VERSION_ID = c.id (+) and',
'      b.is_open = ''Y'' and',
'      NVL(b.is_enhancement,''N'') = ''N''',
'group by nvl(c.version_name,''NONE DEFINED''), nvl(c.id,0)',
')',
'order by 1 desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1065584873284299345)
,p_region_id=>wwv_flow_api.id(1065584754643299344)
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
 p_id=>wwv_flow_api.id(1065584930647299346)
,p_chart_id=>wwv_flow_api.id(1065584873284299345)
,p_seq=>10
,p_name=>'Bugs'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'V'
,p_group_short_desc_column_name=>'L'
,p_items_label_column_name=>'L'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23:IR_IS_OPEN,IR_FIX_BY_VERSION_ID:YES,&ID.'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1065585214360299348)
,p_chart_id=>wwv_flow_api.id(1065584873284299345)
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
 p_id=>wwv_flow_api.id(1065585120932299347)
,p_chart_id=>wwv_flow_api.id(1065584873284299345)
,p_axis=>'x'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_api.id(1414455802201015260)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1414457452650015265)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1414457709983015266)
,p_name=>'Report of Open Bugs'
,p_template=>wwv_flow_api.id(1225690169574288324)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--inline:t-Report--rowHighlightOff'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     nvl(c.version_name,''NONE DEFINED'') Fix_by_version,',
'     c.release_date,',
'     count(*) assigned_bugs,',
'     nvl(c.id,0) version_id',
'from EBA_BT_SW_DEFECTS a,',
'     eba_bt_status b,',
'     eba_bt_version c',
'where (:P53_PRODUCT = 0 or a.product_id = :P53_PRODUCT) and',
'      NVL(:P53_PRODUCT,0) != 0 and',
'      (:P53_CATEGORY = 0 or a.category_id = :P53_CATEGORY) and',
'      a.status_id = b.id (+) and',
'      a.FIX_BY_VERSION_ID = c.id (+)  and',
'      b.is_open = ''Y'' and',
'      NVL(b.is_enhancement,''N'') = ''N''',
'group by nvl(c.version_name,''NONE DEFINED''), c.release_date, c.id',
'order by 1'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1225695925336288332)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No open bugs found.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1414646389770494700)
,p_query_column_id=>1
,p_column_alias=>'FIX_BY_VERSION'
,p_column_display_sequence=>1
,p_column_heading=>'Fix By Version'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1414646665255500349)
,p_query_column_id=>2
,p_column_alias=>'RELEASE_DATE'
,p_column_display_sequence=>3
,p_column_heading=>'Release Date'
,p_use_as_row_header=>'N'
,p_column_format=>'DD-MON-YYYY Day'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1414646450205494701)
,p_query_column_id=>3
,p_column_alias=>'ASSIGNED_BUGS'
,p_column_display_sequence=>2
,p_column_heading=>'Open Bug Count'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR:IR_FIX_BY_VERSION_ID,IR_IS_OPEN:#VERSION_ID#,Yes'
,p_column_linktext=>'#ASSIGNED_BUGS#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1414647949451526853)
,p_query_column_id=>4
,p_column_alias=>'VERSION_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Version Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1414456008555015260)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1414455802201015260)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--iconRight'
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
 p_id=>wwv_flow_api.id(1414456153195015261)
,p_name=>'P53_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1414455802201015260)
,p_item_default=>'0'
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Product -'
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
 p_id=>wwv_flow_api.id(1414456919356015264)
,p_name=>'P53_CATEGORY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1414455802201015260)
,p_item_default=>'0'
,p_prompt=>'Category'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select category_name d, id r',
'from   eba_bt_category c',
'where PARENT_ID is null and ',
'       upper(IS_ACTIVE) = ''Y'' and',
'       (:P53_PRODUCT = 0 or exists (select 1 from eba_bt_sw_defects d ',
'                                       where d.category_id = c.id',
'                                       and d.product_id = :P53_PRODUCT))',
'order by 1 '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All'
,p_lov_null_value=>'0'
,p_lov_cascade_parent_items=>'P53_PRODUCT'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1415235830522032705)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1438262156821750261)
,p_computation_sequence=>20
,p_computation_item=>'P53_CATEGORY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'0'
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_bt_sw_defects',
'where product_id = :P53_PRODUCT',
'and category_id = :P53_CATEGORY'))
,p_compute_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1438259251016750232)
,p_name=>'Dynamic Reload of regions'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P53_PRODUCT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P53_PRODUCT'') == ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438260533072750245)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P53_CATEGORY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438261185980750251)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P53_PRODUCT := 0;'
,p_attribute_02=>'P53_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438259979565750239)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P53_CATEGORY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438260640463750246)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1414457452650015265)
,p_attribute_01=>'$(''.apex-rds-container'').parent(''div'').show();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438260271215750242)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1414457452650015265)
,p_attribute_01=>'$(''.apex-rds-container'').parent(''div'').hide();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438260949336750249)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1065584754643299344)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438260391006750243)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1065584754643299344)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438261076220750250)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1414457709983015266)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438260437638750244)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1414457709983015266)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438260751342750247)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1065584754643299344)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438260888926750248)
,p_event_id=>wwv_flow_api.id(1438259251016750232)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1414457709983015266)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1438261233041750252)
,p_name=>'Refresh regions'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P53_CATEGORY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438261576006750255)
,p_event_id=>wwv_flow_api.id(1438261233041750252)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P53_CATEGORY'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438261403679750253)
,p_event_id=>wwv_flow_api.id(1438261233041750252)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1065584754643299344)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438261459842750254)
,p_event_id=>wwv_flow_api.id(1438261233041750252)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1414457709983015266)
,p_stop_execution_on_error=>'Y'
);
end;
/
