prompt --application/pages/page_00042
begin
wwv_flow_api.create_page(
 p_id=>42
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Bugs by Developer'
,p_step_title=>'Bugs by Developer'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141455855818868)
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'    Bugs by Developer and Status',
'</h2>',
'<p>',
'    View a chart of all developers and the total amount bugs assigned to each for a product.',
'</p>',
'<p>',
'    Select a product from the drop-down list and use the filtering tools to narrow the scope of the results.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180201115421'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1062939298396761742)
,p_plug_name=>'Bugs by Category'
,p_region_template_options=>'#DEFAULT#:i-h480:t-Region--hideHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select category_name, status_name, bug_count, category_name || '' ('' ||bug_count|| '')'' tooltip from ',
'(select c.category_name,',
'       s.status_name,',
'       NVL((',
'        select count(*) ',
'        from EBA_BT_SW_DEFECTS b ',
'        where b.ASSIGNED_TO_ID = c.id and ',
'              b.STATUS_ID = s.id and ',
'              b.product_id = NVL(:P42_PRODUCT,0) and',
'              b.status_id in (select id from eba_bt_status ',
'                              where (is_open = ''Y'' and :P42_STATUS = ''OPEN'') or (is_open = ''N'' and :P42_STATUS = ''CLOSED'') or (NVL(:P42_STATUS,''0'') = ''0'') ) and',
'              (NVL(:P42_FIX_BY,0) = 0 or b.FIX_BY_VERSION_ID = :P42_FIX_BY)',
'       ),0) bug_count',
'from (select distinct uu.username category_name, uu.id ',
'      from eba_bt_users uu, ',
'           EBA_BT_SW_DEFECTS dd ',
'      where uu.id = dd.ASSIGNED_TO_ID and dd.product_id = NVL(:P42_PRODUCT,0)) c,',
'     eba_bt_status s',
'where ',
'      s.id in (select id from eba_bt_status x where ((is_open = ''Y'' and :P42_STATUS = ''OPEN'') or (is_open = ''N'' and :P42_STATUS = ''CLOSED'') or (NVL(:P42_STATUS,''0'') = ''0'')) and ',
'               exists (select 1 from eba_bt_sw_defects swd where x.id = swd.status_id and swd.product_id = NVL(:P42_PRODUCT,0) and (NVL(:P42_FIX_BY,0) = 0 or swd.FIX_BY_VERSION_ID = :P42_FIX_BY) ))',
'order by 1, 2)'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P42_STATUS,P42_FIX_BY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1062939388966761743)
,p_region_id=>wwv_flow_api.id(1062939298396761742)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'on'
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
,p_show_label=>false
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1062939528313761744)
,p_chart_id=>wwv_flow_api.id(1062939388966761743)
,p_seq=>10
,p_name=>'Bugs by Category'
,p_location=>'REGION_SOURCE'
,p_series_name_column_name=>'STATUS_NAME'
,p_items_value_column_name=>'BUG_COUNT'
,p_items_label_column_name=>'CATEGORY_NAME'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1062939625779761745)
,p_chart_id=>wwv_flow_api.id(1062939388966761743)
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
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1062939716488761746)
,p_chart_id=>wwv_flow_api.id(1062939388966761743)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
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
 p_id=>wwv_flow_api.id(1534571441896459300)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(1225683943093288318)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(9594178551161609111)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1225705996474288347)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1534571903587459309)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1534572951980459313)
,p_button_sequence=>10
,p_button_name=>'RESET_PAGE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1534572100263459309)
,p_name=>'P42_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1534571903587459309)
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
 p_id=>wwv_flow_api.id(1534572618869459312)
,p_name=>'P42_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1534571903587459309)
,p_item_default=>'OPEN'
,p_prompt=>'Open/Closed'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SHOW OPEN OR CLOSED OR BOTH'
,p_lov=>'.'||wwv_flow_api.id(1342752977689698528)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1534572775937459312)
,p_name=>'P42_FIX_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1534571903587459309)
,p_item_default=>'0'
,p_prompt=>'Fix By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select version_name, id',
'from eba_bt_version v',
'where nvl(:P42_PRODUCT, 0) = 0 or (product_id = :P42_PRODUCT and exists (select 1 from eba_bt_sw_defects x where x.fix_by_version_id = v.id))',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_lov_cascade_parent_items=>'P42_PRODUCT'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1534794393707667116)
,p_computation_sequence=>200
,p_computation_item=>'PRODUCT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&P42_PRODUCT.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1496374950663049849)
,p_name=>'refresh report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_PRODUCT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P42_PRODUCT'') == ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496375075032049850)
,p_event_id=>wwv_flow_api.id(1496374950663049849)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P42_PRODUCT := 0;'
,p_attribute_02=>'P42_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496375367400049853)
,p_event_id=>wwv_flow_api.id(1496374950663049849)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P42_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496375165652049851)
,p_event_id=>wwv_flow_api.id(1496374950663049849)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_STATUS,P42_FIX_BY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496375442553049854)
,p_event_id=>wwv_flow_api.id(1496374950663049849)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_STATUS,P42_FIX_BY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496375610590049855)
,p_event_id=>wwv_flow_api.id(1496374950663049849)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1062939298396761742)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496375269776049852)
,p_event_id=>wwv_flow_api.id(1496374950663049849)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1062939298396761742)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1496375713651049856)
,p_name=>'refresh IRR after status change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_STATUS'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P42_PRODUCT'') != ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496375777289049857)
,p_event_id=>wwv_flow_api.id(1496375713651049856)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P42_STATUS'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496375882387049858)
,p_event_id=>wwv_flow_api.id(1496375713651049856)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1062939298396761742)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1496375969241049859)
,p_name=>'refresh IRR after fix by change'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_FIX_BY'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P42_PRODUCT'') != ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496376042694049860)
,p_event_id=>wwv_flow_api.id(1496375969241049859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P42_FIX_BY'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496376200336049861)
,p_event_id=>wwv_flow_api.id(1496375969241049859)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1062939298396761742)
,p_stop_execution_on_error=>'Y'
);
end;
/
