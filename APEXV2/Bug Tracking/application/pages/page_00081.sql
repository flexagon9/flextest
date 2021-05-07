prompt --application/pages/page_00081
begin
wwv_flow_api.create_page(
 p_id=>81
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Synchronize Bugs'
,p_page_mode=>'MODAL'
,p_step_title=>'Synchronize Bugs'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141354470818444)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(3797358846252064904)
,p_required_patch=>wwv_flow_api.id(16725495374012530)
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20180220110633'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33565233443636416)
,p_plug_name=>'Refresh Bugs from Master Repository'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from user_objects',
'where object_type = ''PACKAGE BODY''',
'    and object_name = ''EBA_BT_BUG_SYNC'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33572639695636424)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225683943093288318)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(9594178551161609111)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1225705996474288347)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(236585747030303959)
,p_plug_name=>'Package Not Defined'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>wwv_flow_api.id(1225681960450288316)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Bug synchronization will only work if you <u>define</u> the EBA_BT_BUG_SYNC package, containing the EBA_BT_BUG_REFRESH procedure as outlined below.<br>',
'This package was not created, when the application was installed, as the code within the procedure will be specific to the bug system you are interfacing with.</p>',
'<pre>',
'create or replace package EBA_BT_BUG_SYNC as',
'',
'  procedure EBA_BT_BUG_REFRESH (',
'    p_product_id        in number,   ',
'       -- Product Id for the product in the Bug Tracker application',
'    p_external_id       in number,   ',
'       -- The unique identifier for the product in the system being interfaced to',
'    p_min_date          in date      ',
'       -- The minimum date for closed bugs',
'    p_app_user          in varchar2, ',
'       -- The APEX user synchronizing the data',
'    p_max_rows          in number,   ',
'       -- The maximum number of bugs to return',
'    p_fast_or_full      in varchar2 default "fast", ',
'       -- Full will delete existing bugs and completely reload the data ',
'       -- Fast will only load bugs updated since the last synchronization',
'    p_offset            in number    ',
'       -- Number of records to skip',
'  );',
'',
'end EBA_BT_BUG_SYNC;',
'</pre>',
'<p>When coding the EBA_BT_BUG_REFRESH procedure, select the maximum number of records (bugs) from the external bug system using the <code>p_external_id</code> parameter.',
'Merge (insert if new / update if existing) the records, associating them using the <code>p_product_id</code> parameter, into the EBA_BT_SW_DEFECTS table.<br>',
'Ensure the SYNC_LAST_UPD column is populated correctly, so it can be utilized when performing a "fast" refresh.</p> ',
'<p><em><strong>Note:</strong> Until the package and procedure have been defined and tested it is advisable to turn off <strong>Synchronize from Master System</strong> from Administration > Build Options.</em></p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from user_objects',
'where object_type = ''PACKAGE BODY''',
'    and object_name = ''EBA_BT_BUG_SYNC'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(941699109767969856)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33573743990636427)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(941699109767969856)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33602248121878809)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(941699109767969856)
,p_button_name=>'ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Refresh All'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from user_objects',
'where object_type = ''PACKAGE BODY''',
'    and object_name = ''EBA_BT_BUG_SYNC'''))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33573407321636427)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(941699109767969856)
,p_button_name=>'SYNCHRONIZE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh Selected Product'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from user_objects',
'where object_type = ''PACKAGE BODY''',
'    and object_name = ''EBA_BT_BUG_SYNC'''))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33568319654636420)
,p_name=>'P81_PRODUCT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(33565233443636416)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product'
,p_source=>'P81_SYNC_PRODUCT_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select product_name d, external_id r',
'from eba_bt_product',
'where external_id is not null',
'order by lower(product_name)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Product -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33569540225636421)
,p_name=>'P81_MAXIMUM_ROWS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(33565233443636416)
,p_item_default=>'5000'
,p_prompt=>'Maximum Bugs to Refresh'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_help_text=>'<p>The maximum number of bugs to import at a time.</p>'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(941698826520969853)
,p_name=>'P81_REFRESH_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(33565233443636416)
,p_item_default=>'FAST'
,p_prompt=>'Type'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_inline_help_text=>'Selecting "Full" will force a refresh of all bugs, but will be slower.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'FAST'
,p_attribute_03=>'Fast'
,p_attribute_04=>'FULL'
,p_attribute_05=>'Full'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(991600029530883435)
,p_name=>'P81_SYNC_PRODUCT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(33565233443636416)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select external_id',
'from EBA_BT_PRODUCT',
'where id = :PRODUCT_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(991620557083025822)
,p_name=>'P81_MINIMUM_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(33565233443636416)
,p_item_default=>'sysdate-7'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Minimum Date for closed bugs'
,p_format_mask=>'&APP_DATE_FORMAT.'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Do not refresh closed bugs older then this date.  All open bugs will always be fetched.'
,p_attribute_03=>'-1d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(991621604931031839)
,p_name=>'P81_OFFSET'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(33565233443636416)
,p_item_default=>'0'
,p_prompt=>'Offset'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Number of rows to ignore bofore taking action.'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(941698619036969851)
,p_validation_name=>'Product Specified'
,p_validation_sequence=>10
,p_validation=>'P81_PRODUCT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must be specified.'
,p_when_button_pressed=>wwv_flow_api.id(33573407321636427)
,p_associated_item=>wwv_flow_api.id(33568319654636420)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(34605936133652340)
,p_name=>'show working'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(33573407321636427)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34606330063652342)
,p_event_id=>wwv_flow_api.id(34605936133652340)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'SYNCHRONIZE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38159040160416853)
,p_name=>'show working for refresh all'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(33602248121878809)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38159498558416873)
,p_event_id=>wwv_flow_api.id(38159040160416853)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'ALL'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(941699210461969857)
,p_name=>'Cancel Dialog'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(33573743990636427)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(941699293335969858)
,p_event_id=>wwv_flow_api.id(941699210461969857)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33574529105636430)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'existing product'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_bt_bug_sync.eba_bt_bug_refesh (',
'    p_external_id       => :P81_PRODUCT,',
'    p_no_closed_before  => nvl(to_date(:P81_MINIMUM_DATE,:APP_DATE_FORMAT),add_months(sysdate,-12)),',
'    p_app_user          => :APP_USER,',
'    p_max_rows          => nvl(:P81_MAXIMUM_ROWS,8000),',
'    p_fast_or_full      => :P81_REFRESH_TYPE,',
'    p_fetch_body_inline => ''Y'',',
'    p_offset            => nvl(:P81_OFFSET,0)',
');',
'commit;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(33573407321636427)
,p_process_success_message=>'Selected Product (&P81_PRODUCT.) Refreshed'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33602701284886398)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'existing product ALL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (select external_id from eba_bt_product order by id) loop',
'    eba_bt_bug_sync.eba_bt_bug_refesh  (',
'        p_external_id       => c1.external_id,',
'        p_no_closed_before  => nvl(:P81_MINIMUM_DATE,add_months(sysdate,-12)),',
'        p_app_user          => :APP_USER,',
'        p_max_rows          => nvl(:P81_MAXIMUM_ROWS,8000),',
'        p_fast_or_full      => :P81_REFRESH_TYPE,',
'        p_fetch_body_inline => ''Y'',',
'        p_offset            => nvl(:P81_OFFSET,0)',
'    );',
'    commit;',
'end loop;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(33602248121878809)
,p_process_success_message=>'All Product Bugs Refreshed'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(941699356244969859)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
