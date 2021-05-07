prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Bug Calendar'
,p_step_title=>'Bug Calendar'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2508162743716731820)
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'    Bug Calendar',
'</h2>',
'<p>',
'    View the timeline or lifespan of bugs.',
'</p>',
'<p>',
'    <strong>Product</strong> - Select the Product from the drop-down list.',
'</p>',
'<p>',
'    <strong>Show</strong> - Select <strong>Show Created and Closed</strong> to view all bugs. Select the other options to only view Created or Closed bugs.',
'</p>',
'<h3>',
'    Calendar Controls',
'</h3>',
'<p>',
'    Click the left and right arrow buttons to switch the displayed month.',
'</p>',
'<p>',
'    Click the <strong>month</strong> button to view bugs plotted on a calendar by month.',
'</p>',
'<p>',
'    Click the <strong>list</strong> button to view a list of bugs. You can also click <strong>CSV</strong> to download a comma-separated list of bugs.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180111133932'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1370090418376729237)
,p_plug_name=>'Calendar'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     a.id,',
'     a.bug_number,',
'     a.bug_number||'': ''||substr(a.subject,1,40) bug_display,',
'     a.SUBJECT, ',
'     substr(a.SUBJECT,1,40) short_subject,',
'     STATUS_NAME, ',
'     URGENCY_NAME, ',
'     a.product_id,',
'     (select SEVERITY_NAME from EBA_BT_SEVERITY s where s.id = a.SEVERITY_id) severity,',
'     ( select username from eba_bt_users where id = a.submitted_by_id ) submitted_by,',
'     SUBMITTED_ON,',
'     e.PRODUCT_NAME,',
'     apex_util.prepare_url(''f?p='' || :app_id || '':48:'' || :app_session || '':::48:P48_ID:''||a.id) as url ,',
'     (select version_name from EBA_BT_VERSION v where v.id = a.FIXED_VERSION_ID) fixed_in,',
'      (select version_name from EBA_BT_VERSION v where v.id = a.FOUND_VERSION_ID) found_in,',
'      (select version_name from EBA_BT_VERSION v where v.id = a.FIX_BY_VERSION_ID) fix_by,',
'     a.created,',
'     a.created created_date,',
'     nvl(a.updated,a.created) updated,',
'     dbms_lob.substr(a.description,500,1) description, ',
'     a.tags,',
'     decode(b.is_open,''Y'',''Yes'',''N'',''No'',null,''Yes'') is_open,',
'     c.id priority_id,',
'     a.SEVERITY_id severity_id,',
'     ''Created'' action,',
'     ''apex-css-cal-01'' color',
'from EBA_BT_SW_DEFECTS a, ',
'    eba_bt_status b, ',
'    eba_bt_urgency c, ',
'    eba_bt_product e ',
'where a.STATUS_ID = b.id (+) and ',
'    a.URGENCY_ID = c.id (+) and ',
'    a.PRODUCT_ID = e.id (+) and',
'    (nvl(:P14_PRODUCT,0) = 0 or a.product_id = :P14_PRODUCT) and',
'    (NVL(:P14_SHOW,''0'') = ''0'' or :P14_SHOW = ''CREATED'')',
'union all',
'select',
'     a.id,',
'     a.bug_number,',
'     a.bug_number||'': ''||substr(a.subject,1,40) bug_display,',
'     a.SUBJECT , ',
'     substr(a.SUBJECT,1,40) short_subject,',
'     STATUS_NAME, ',
'     URGENCY_NAME, ',
'     a.product_id,',
'     (select SEVERITY_NAME from EBA_BT_SEVERITY s where s.id = a.SEVERITY_id) severity,',
'     ( select username from eba_bt_users where id = a.submitted_by_id ) submitted_by,',
'     SUBMITTED_ON,',
'     e.PRODUCT_NAME,',
'     apex_util.prepare_url(''f?p='' || :app_id || '':48:'' || :app_session || '':::48:P48_ID:''||a.id) as url ,',
'     (select version_name from EBA_BT_VERSION v where v.id = a.FIXED_VERSION_ID) fixed_in,',
'      (select version_name from EBA_BT_VERSION v where v.id = a.FOUND_VERSION_ID) found_in,',
'      (select version_name from EBA_BT_VERSION v where v.id = a.FIX_BY_VERSION_ID) fix_by,',
'     a.date_closed created,',
'     a.date_closed created_date,',
'     nvl(a.updated,a.created) updated,',
'     dbms_lob.substr(a.description,500,1) description, ',
'     a.tags,',
'     decode(b.is_open,''Y'',''Yes'',''N'',''No'',null,''Yes'') is_open,',
'     c.id priority_id,',
'     a.SEVERITY_id severity_id,',
'     ''Closed'' action,',
'     ''apex-css-cal-04'' color',
'from EBA_BT_SW_DEFECTS a, ',
'    eba_bt_status b, ',
'    eba_bt_urgency c, ',
'    eba_bt_product e ',
'where a.STATUS_ID = b.id (+) and ',
'    a.URGENCY_ID = c.id (+) and ',
'    a.PRODUCT_ID = e.id (+) and',
'    a.date_closed is not null and',
'   (nvl(:P14_PRODUCT,0) = 0 or a.product_id = :P14_PRODUCT) and',
'    (NVL(:P14_SHOW,''0'') = ''0'' or :P14_SHOW = ''CLOSED'')'))
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>'<br><p>Red indicates created, Green indicates closed.</p>'
,p_attribute_01=>'SUBMITTED_ON'
,p_attribute_03=>'BUG_DISPLAY'
,p_attribute_05=>'f?p=&APP_ID.:31:&APP_SESSION.:::31:P31_ID:&ID.'
,p_attribute_09=>'month:list:navigation'
,p_attribute_10=>'CSV'
,p_attribute_13=>'N'
,p_attribute_14=>'COLOR'
,p_attribute_16=>'&BUG_NUMBER. - &SHORT_SUBJECT. - &ACTION.'
,p_attribute_17=>'Y'
,p_attribute_19=>'Y'
,p_attribute_21=>'12'
,p_attribute_22=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1407770671269121430)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1408564123706829592)
,p_button_sequence=>10
,p_button_name=>'FLOW_RESET_BUTTON'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR:P14_PRODUCT:&PRODUCT_ID.'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1407770842098121443)
,p_name=>'P14_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1407770671269121430)
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
 p_id=>wwv_flow_api.id(1408561107520805587)
,p_name=>'P14_SHOW'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1407770671269121430)
,p_item_default=>'0'
,p_prompt=>'Show'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CREATED OR CLOSED OR BOTH'
,p_lov=>'.'||wwv_flow_api.id(1408561700918814759)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Show Created and Closed'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1415237440427064146)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1366273791919497052)
,p_name=>'refresh on product change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_PRODUCT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P14_PRODUCT'') == ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1366273892016497053)
,p_event_id=>wwv_flow_api.id(1366273791919497052)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P14_PRODUCT := 0;'
,p_attribute_02=>'P14_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1366273947621497054)
,p_event_id=>wwv_flow_api.id(1366273791919497052)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P14_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1366274080853497055)
,p_event_id=>wwv_flow_api.id(1366273791919497052)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_SHOW'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1366274146009497056)
,p_event_id=>wwv_flow_api.id(1366273791919497052)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1370090418376729237)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1366274304407497057)
,p_event_id=>wwv_flow_api.id(1366273791919497052)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_SHOW'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1366274460708497059)
,p_event_id=>wwv_flow_api.id(1366273791919497052)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1370090418376729237)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1366274368705497058)
,p_event_id=>wwv_flow_api.id(1366273791919497052)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1370090418376729237)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1366274670462497061)
,p_name=>'refresh on show change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_SHOW'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P14_PRODUCT'') != ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1366274792420497062)
,p_event_id=>wwv_flow_api.id(1366274670462497061)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P14_SHOW,P14_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1366274882283497063)
,p_event_id=>wwv_flow_api.id(1366274670462497061)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1370090418376729237)
,p_stop_execution_on_error=>'Y'
);
end;
/
