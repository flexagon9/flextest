prompt --application/pages/page_00420
begin
wwv_flow_api.create_page(
 p_id=>420
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Dashboard'
,p_step_title=>'Dashboard'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506150059449829428)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'    Assignee Dashboard',
'</h2>',
'<p>',
'    View an overview of all open bugs by assigned developer and other metrics.',
'</p>',
'<p>',
'    Select a product from the drop-down list to narrow the overview to that product.',
'</p>',
'<p>',
'    Click a user to view a detailed report of all bugs assigned to that user.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180201115421'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1669211542593617813)
,p_plug_name=>'Metrics'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>40
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
'          where is_open = ''Y'')) the_value',
'from dual',
'union all',
'select',
'   ''All Bugs''  the_label,',
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
,p_attribute_05=>'1'
,p_attribute_06=>'B'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1669211976392617814)
,p_plug_name=>'Open Bugs by Owner'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(720320952340820474)
,p_region_id=>wwv_flow_api.id(1669211976392617814)
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
 p_id=>wwv_flow_api.id(720321083892820475)
,p_chart_id=>wwv_flow_api.id(720320952340820474)
,p_seq=>10
,p_name=>'Open Bugs by Owner'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'    login_Name the_name,',
'    open_bugs the_value,',
'    the_link',
'from (  select id,',
'            u.username as "LOGIN_NAME",',
'            (   select count(*) ',
'                from eba_bt_sw_defects d,',
'                    eba_bt_status c ',
'                where c.id = d.status_id',
'                    and  u.id = d.assigned_to_id',
'                    and c.is_open = ''Y''',
'                    and (nvl(:P420_PRODUCT,0) = 0 or :P420_PRODUCT = d.product_id )',
'            ) open_bugs,',
'            apex_util.prepare_url(''f?p=''||:APP_ID||'':23:''||:APP_SESSION||'':::23,RIR:IR_LOGIN_NAME,IR_IS_OPEN:''||u.username||'',Yes'')  the_link',
'        from eba_bt_users u',
'        where exists (  select null',
'                        from eba_bt_sw_defects d ',
'                        where d.assigned_to_id = u.id',
'                            and (nvl(:P420_PRODUCT,0) = 0',
'                                or :P420_PRODUCT = d.product_id )',
'            )',
'    ) x',
'where x.open_bugs > 0'))
,p_items_value_column_name=>'THE_VALUE'
,p_items_label_column_name=>'THE_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'#THE_LINK#'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(726360704746672327)
,p_chart_id=>wwv_flow_api.id(720320952340820474)
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
 p_id=>wwv_flow_api.id(726360586060672326)
,p_chart_id=>wwv_flow_api.id(720320952340820474)
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
 p_id=>wwv_flow_api.id(1669220406029642071)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--showBreadcrumb:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(1225683943093288318)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(9594178551161609111)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1225705996474288347)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1670092117623445925)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1670092350030445927)
,p_name=>'P420_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1670092117623445925)
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
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Products -'
,p_lov_null_value=>'0'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1676894485667405258)
,p_computation_sequence=>10
,p_computation_item=>'PRODUCT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&P420_PRODUCT_ID.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1676895464654417465)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set product_id'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':PRODUCT_ID := nvl(:P420_PRODUCT,0);',
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
'',
':PRODUCT_NAME := null;',
'for c1 in (select product_name from eba_bt_product where id = :PRODUCT_ID) loop',
'   :PRODUCT_NAME := c1.product_name;',
'end loop;'))
);
end;
/
