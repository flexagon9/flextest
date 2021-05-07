prompt --application/pages/page_00063
begin
wwv_flow_api.create_page(
 p_id=>63
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
,p_help_text=>'<p>Provide a product name and an id and click the <strong>Reset</strong> button to add the product and all of it''s associated bugs to this application. Click the <strong>Cancel</strong> button to return to the main Bug Synchronization page.</p>'
,p_last_upd_yyyymmddhh24miss=>'20180220110715'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16723930398000004)
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
 p_id=>wwv_flow_api.id(16727109317025833)
,p_plug_name=>'Refresh Bugs from Master Repository'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--hiddenOverflow:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
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
 p_id=>wwv_flow_api.id(236824109651648234)
,p_plug_name=>'Package Not Defined'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>wwv_flow_api.id(1225681960450288316)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(332495869603100148)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16724928869004959)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(332495869603100148)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16725839602017801)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(332495869603100148)
,p_button_name=>'SYNCHRONIZE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Synchronize'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from user_objects',
'where object_type = ''PACKAGE BODY''',
'    and object_name = ''EBA_BT_BUG_SYNC'''))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(33593801578808069)
,p_branch_name=>'back'
,p_branch_action=>'f?p=&APP_ID.:80:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16727835609031317)
,p_name=>'P63_MINIMUM_DATE'
,p_item_sequence=>45
,p_item_plug_id=>wwv_flow_api.id(16727109317025833)
,p_item_default=>'sysdate-7'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Minimum Date for closed bugs'
,p_format_mask=>'DD-MON-YYYY'
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
 p_id=>wwv_flow_api.id(16728234129031317)
,p_name=>'P63_MAXIMUM_ROWS'
,p_item_sequence=>65
,p_item_plug_id=>wwv_flow_api.id(16727109317025833)
,p_item_default=>'5000'
,p_prompt=>'Maximum Rows'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>The maximum number of bugs to import at a time.</p>'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16733886152142720)
,p_name=>'P63_EXTERNAL_ID'
,p_is_required=>true
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_api.id(16727109317025833)
,p_prompt=>'External ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704949468288344)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>The ID of the product as used by the synchronization process.</p.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16737970928180354)
,p_name=>'P63_PRODUCT_NAME'
,p_is_required=>true
,p_item_sequence=>15
,p_item_plug_id=>wwv_flow_api.id(16727109317025833)
,p_prompt=>'Product Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1225704949468288344)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'name of product when creating a new product, ignored for existing products'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16762440027579918)
,p_name=>'P63_OFFSET'
,p_item_sequence=>75
,p_item_plug_id=>wwv_flow_api.id(16727109317025833)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(941698516579969850)
,p_name=>'P63_DESCRIPTION'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_api.id(16727109317025833)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(992747900380451613)
,p_validation_name=>'P63_PRODUCT_NAME duplication check'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select null',
'from eba_bt_product',
'where upper(PRODUCT_NAME) = upper(:P63_PRODUCT_NAME)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Product already exists.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(332495977212100149)
,p_name=>'CNX'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(16724928869004959)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(332496125802100150)
,p_event_id=>wwv_flow_api.id(332495977212100149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(941698387915969849)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Product'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_bt_product ( product_name, description, is_active, external_id )',
'values( :P63_PRODUCT_NAME, :P63_DESCRIPTION, ''Y'', :P63_EXTERNAL_ID );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16736743822165884)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'new product'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_bt_bug_sync.eba_bt_bug_refesh (',
'    p_external_id       => :P63_EXTERNAL_ID,',
'    p_no_closed_before  => nvl(:P63_MINIMUM_DATE,add_months(sysdate,-12)),',
'    p_app_user          => :APP_USER,',
'    p_max_rows          => nvl(:P63_MAXIMUM_ROWS,5000),',
'    p_fast_or_full      => ''FULL'',',
'    p_product_name      => :P63_PRODUCT_NAME,',
'    p_fetch_body_inline => ''N'',',
'    p_offset            => nvl(:P63_OFFSET,0)',
');',
'commit;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16725839602017801)
,p_process_success_message=>'New Product Synconized'
);
end;
/
