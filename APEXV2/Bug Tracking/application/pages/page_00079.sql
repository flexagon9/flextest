prompt --application/pages/page_00079
begin
wwv_flow_api.create_page(
 p_id=>79
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Remove Product'
,p_page_mode=>'MODAL'
,p_step_title=>'Remove Product'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141354470818444)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(3797358846252064904)
,p_required_patch=>wwv_flow_api.id(16725495374012530)
,p_help_text=>'Select a product and then whether you want to remove all of the bugs for the selected product, or all of the bugs along with the selected product itself. Click the <strong>Remove</strong> button to submit the page or the <strong>Cancel</strong> butto'
||'n to not remove anything.'
,p_last_upd_yyyymmddhh24miss=>'20180216101129'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16742377851334865)
,p_plug_name=>'Remove Product and Bugs'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--danger:t-Alert--removeHeading'
,p_plug_template=>wwv_flow_api.id(1225681960450288316)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>Please select a product and what types of data you would like to remove.</p>'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16743429607350830)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(16742377851334865)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16743816827353784)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(16742377851334865)
,p_button_name=>'REMOVE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Remove '
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''REMOVE'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(36712493964832610)
,p_branch_name=>'back go admin'
,p_branch_action=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16742754284338202)
,p_name=>'P79_PRODUCT_ID'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16742377851334865)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Product -'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16744816053374616)
,p_name=>'P79_MODE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(16742377851334865)
,p_prompt=>'Data to Remove'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'DELETE MODE'
,p_lov=>'.'||wwv_flow_api.id(16745177846378359)||'.'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1103713935178490330)
,p_name=>'P79_BUG_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(16742377851334865)
,p_prompt=>'Bug Count'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(1225704767981288342)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1103714258381490333)
,p_name=>'Refresh Bug Count'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_PRODUCT_ID'
,p_condition_element=>'P79_PRODUCT_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1103714891225490339)
,p_event_id=>wwv_flow_api.id(1103714258381490333)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P79_BUG_COUNT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1103714463739490335)
,p_event_id=>wwv_flow_api.id(1103714258381490333)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P79_BUG_COUNT'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select count(*)||'' bugs'' from eba_bt_sw_defects where product_id = :P79_PRODUCT_ID'
,p_attribute_07=>'P79_PRODUCT_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1103714343612490334)
,p_event_id=>wwv_flow_api.id(1103714258381490333)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P79_BUG_COUNT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(314224332604918135)
,p_name=>'CNX'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(16743429607350830)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(314224490616918136)
,p_event_id=>wwv_flow_api.id(314224332604918135)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16743187324346840)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete bugs'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P79_MODE = ''PRODUCT'' then',
'   delete from eba_bt_sw_defects where product_id = :P79_PRODUCT_ID;',
'   commit;',
'   delete from EBA_BT_VERSION where product_id =  :P79_PRODUCT_ID;',
'   commit;',
'   delete from eba_bt_product where id = :P79_PRODUCT_ID;',
'   commit;',
'else',
'   delete from eba_bt_sw_defects where product_id = :P79_PRODUCT_ID;',
'   commit;',
'end if;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16743816827353784)
,p_process_success_message=>'Action Processed'
);
end;
/
