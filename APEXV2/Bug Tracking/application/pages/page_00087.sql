prompt --application/pages/page_00087
begin
wwv_flow_api.create_page(
 p_id=>87
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Timeline'
,p_step_title=>'Timeline'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141455855818868)
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_help_text=>'Choose a product and a status to get a history of the corresponding bug changes that were made. Click the <strong>Reset</strong> button to reset the page.'
,p_last_upd_yyyymmddhh24miss=>'20180111133935'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87100791751380564)
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
 p_id=>wwv_flow_api.id(87120715294443819)
,p_name=>'Timeline'
,p_template=>wwv_flow_api.id(1225690169574288324)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'h.change_date SORT_COLUMN,',
'null EVENT_ATTRIBUTES,',
'''u-color-''|| (ora_hash(h.changed_by,44) + 1) USER_COLOR,',
'upper(',
'          decode(instr(replace(h.changed_by,''.'','' ''),'' ''),',
'                 0, ',
'                 substr(h.changed_by,1,2),',
'                 substr(h.changed_by,1,1)||substr(h.changed_by,instr(replace(h.changed_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'lower(h.changed_by) USER_NAME,',
'h.change_date EVENT_DATE,',
'''fa fa-file'' EVENT_ICON,',
'''is-updated'' EVENT_STATUS,',
'--''is-new is-updated is-removed',
'initcap(replace(replace(h.column_name,''_ID'',null),''_'','' '')) EVENT_TYPE,',
'b.BUG_NUMBER||''. ''||b.subject EVENT_TITLE,',
'initcap(replace(replace(h.column_name,''_ID'',null),''_'','' '')) ||',
'    '' changed from <strong>''||apex_escape.html(substr(h.old_value,1,1000))||''</strong>'' ||',
'    '' to <strong>''||apex_escape.html(substr(h.new_value,1,1000))||''</strong>'' EVENT_DESC,',
'apex_util.prepare_url(''f?p=''||:APP_ID||'':31:''||:APP_SESSION||'':::31:P31_ID:''||h.COMPONENT_ID) event_link',
'from eba_bt_history h, ',
'     EBA_BT_SW_DEFECTS b',
'where h.change_date > (systimestamp - 30) and',
'      h.component_id = b.id and',
'      b.PRODUCT_ID = :P87_PRODUCT and',
'      b.status_id in (select id ',
'               from eba_bt_status x ',
'               where ((is_open = ''Y'' and :P87_STATUS = ''OPEN'') or (is_open = ''N'' and :P87_STATUS = ''CLOSED'') or (NVL(:P87_STATUS,''0'') = ''0'')) )',
'order by h.change_date desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P87_PRODUCT,P87_STATUS'
,p_query_row_template=>wwv_flow_api.id(87907123231057300)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No timeline entries found.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87121295363443833)
,p_query_column_id=>1
,p_column_alias=>'SORT_COLUMN'
,p_column_display_sequence=>1
,p_column_heading=>'Sort Column'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87121725449443834)
,p_query_column_id=>2
,p_column_alias=>'EVENT_ATTRIBUTES'
,p_column_display_sequence=>2
,p_column_heading=>'Event Attributes'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87122066742443834)
,p_query_column_id=>3
,p_column_alias=>'USER_COLOR'
,p_column_display_sequence=>3
,p_column_heading=>'User Color'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87122458810443834)
,p_query_column_id=>4
,p_column_alias=>'USER_AVATAR'
,p_column_display_sequence=>4
,p_column_heading=>'User Avatar'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87122858096443835)
,p_query_column_id=>5
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>5
,p_column_heading=>'User Name'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87123284370443835)
,p_query_column_id=>6
,p_column_alias=>'EVENT_DATE'
,p_column_display_sequence=>6
,p_column_heading=>'Event Date'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87123629493443835)
,p_query_column_id=>7
,p_column_alias=>'EVENT_ICON'
,p_column_display_sequence=>7
,p_column_heading=>'Event Icon'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87124040963443836)
,p_query_column_id=>8
,p_column_alias=>'EVENT_STATUS'
,p_column_display_sequence=>8
,p_column_heading=>'Event Status'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87124462743443837)
,p_query_column_id=>9
,p_column_alias=>'EVENT_TYPE'
,p_column_display_sequence=>9
,p_column_heading=>'Event Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87124866906443837)
,p_query_column_id=>10
,p_column_alias=>'EVENT_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Event Title'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87125275041443837)
,p_query_column_id=>11
,p_column_alias=>'EVENT_DESC'
,p_column_display_sequence=>11
,p_column_heading=>'Event Desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(87125686542443838)
,p_query_column_id=>12
,p_column_alias=>'EVENT_LINK'
,p_column_display_sequence=>12
,p_column_heading=>'Event Link'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87149040176491202)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225683943093288318)
,p_plug_display_sequence=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(9594178551161609111)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1225705996474288347)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(87103200647380588)
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
 p_id=>wwv_flow_api.id(87101154355380565)
,p_name=>'P87_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(87100791751380564)
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
 p_id=>wwv_flow_api.id(87102079909380573)
,p_name=>'P87_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(87100791751380564)
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
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(87104817211380595)
,p_computation_sequence=>200
,p_computation_item=>'PRODUCT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&P87_PRODUCT.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(87924302264079724)
,p_name=>'refresh report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_PRODUCT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v(''P87_PRODUCT'') == ''0'' || $v(''P87_PRODUCT'') == undefined',
''))
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496373806314049837)
,p_event_id=>wwv_flow_api.id(87924302264079724)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P87_PRODUCT := 0;'
,p_attribute_02=>'P87_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496374085123049840)
,p_event_id=>wwv_flow_api.id(87924302264079724)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P87_PRODUCT,P87_STATUS'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496373885993049838)
,p_event_id=>wwv_flow_api.id(87924302264079724)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_STATUS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496374164472049841)
,p_event_id=>wwv_flow_api.id(87924302264079724)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_STATUS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87924688275079728)
,p_event_id=>wwv_flow_api.id(87924302264079724)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(87120715294443819)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496373994025049839)
,p_event_id=>wwv_flow_api.id(87924302264079724)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(87120715294443819)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496374262562049842)
,p_event_id=>wwv_flow_api.id(87924302264079724)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(87120715294443819)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1496374353285049843)
,p_name=>'Refresh IRR on Status Change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_STATUS'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P87_PRODUCT'') != ''0'' && $v(''P87_PRODUCT'') != undefined'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496374481084049844)
,p_event_id=>wwv_flow_api.id(1496374353285049843)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P87_STATUS'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496374650742049846)
,p_event_id=>wwv_flow_api.id(1496374353285049843)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(87120715294443819)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496374550134049845)
,p_event_id=>wwv_flow_api.id(1496374353285049843)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(87120715294443819)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
