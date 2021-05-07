prompt --application/pages/page_00048
begin
wwv_flow_api.create_page(
 p_id=>48
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Bug'
,p_step_title=>'Bug'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141455855818868)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(3797424040496072790)
,p_help_text=>'Edit attributes of the bug and click the <strong>Apply Changes</strong> button to save your changes. Click the <strong>Delete</strong> button to delete the bug from this app. Click the <strong>Cancel</strong> button to leave this page.'
,p_last_upd_yyyymmddhh24miss=>'20180206023051'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1420830491323340880)
,p_plug_name=>'Region Display Selector'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>15
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6308634069096508990)
,p_plug_name=>'Bug'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--hideHeader'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6308825095436623557)
,p_plug_name=>'Description'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
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
 p_id=>wwv_flow_api.id(6308831471588645037)
,p_plug_name=>'Flex'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6308831680592647700)
,p_plug_name=>'Audit'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P48_ID'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6308831889249650138)
,p_plug_name=>'Attributes'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
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
 p_id=>wwv_flow_api.id(6308634598218508990)
,p_button_sequence=>10
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6308634488076508990)
,p_button_sequence=>20
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--danger:t-Button--gapLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P48_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6308634383864508990)
,p_button_sequence=>30
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P48_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6308634292435508990)
,p_button_sequence=>40
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Bug'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P48_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2726647557762445374)
,p_branch_name=>'On Delete'
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6308634488076508990)
,p_branch_sequence=>5
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6308635288778508992)
,p_branch_action=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::P31_ID:&P48_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1436678107643561449)
,p_name=>'P48_CUSTOMER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Customer'
,p_source=>'CUSTOMER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2151222954611974066)
,p_name=>'P48_NEW_CATEGORY'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Category'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704949468288344)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_help_text=>'Specify the new product'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4526694637083182401)
,p_name=>'P48_DATE_CLOSED'
,p_item_sequence=>122
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date Closed'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'DATE_CLOSED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Specify the date in which the bug was fixed.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5497218583175402521)
,p_name=>'P48_NEW_PRODUCT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(6308634069096508990)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Product'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704949468288344)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_help_text=>'Specify the new product'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5503560676207758647)
,p_name=>'P48_BUG_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6308634069096508990)
,p_use_cache_before_default=>'NO'
,p_source=>'BUG_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P48_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The unique number assigned to this bug.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5505089991025524236)
,p_name=>'P48_SEVERITY_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Severity'
,p_source=>'SEVERITY_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEVERITY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select severity_name d, id r',
'from   EBA_BT_SEVERITY',
'order by nvl(sequence_number,99), severity_name'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'How severe the bug is to the system functions.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308635490390508992)
,p_name=>'P48_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6308634069096508990)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308635677054509002)
,p_name=>'P48_SUBJECT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6308634069096508990)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Subject'
,p_source=>'SUBJECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(1225704949468288344)
,p_help_text=>'The subject that describes the bug.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308636081449509018)
,p_name=>'P48_SUBMITTED_ON'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(6308831680592647700)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Submitted On:'
,p_format_mask=>'SINCE'
,p_source=>'SUBMITTED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The date on which this bug was submitted on.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308636287123509019)
,p_name=>'P48_CATEGORY_ID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Category'
,p_source=>'CATEGORY_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''- New Category -'' d, 0 r',
'from dual',
'union all',
'select category_name d, id r',
'from eba_bt_category c',
'where upper(IS_ACTIVE) = ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the category in which the bug belongs to.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308636496191509019)
,p_name=>'P48_ASSIGNED_TO_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Assigned To'
,p_source=>'ASSIGNED_TO_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'USERLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username d, id r',
'from eba_bt_users',
'order by lower(username)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Assignee -'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The person responsable of fixing this bug'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308636674807509019)
,p_name=>'P48_ASSIGNED_ON'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(6308831680592647700)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Assigned On:'
,p_format_mask=>'SINCE'
,p_source=>'ASSIGNED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The person responsable of this bug.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308636878146509021)
,p_name=>'P48_DESCRIPTION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(6308825095436623557)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>32767
,p_cHeight=>8
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(1225704767981288342)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308637076464509022)
,p_name=>'P48_OS_NAME'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Operating System / Browser'
,p_source=>'OS_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the OS name in which the bug was found.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308637284414509023)
,p_name=>'P48_PRODUCT_ID'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(6308634069096508990)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product'
,p_source=>'PRODUCT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCT LIST - WITH NEW PRODUCT OPTION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'union all',
'select ''- New Product -'' d,',
'          0 r',
'from dual',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704949468288344)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The product name for which this bug was found'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308637490755509023)
,p_name=>'P48_FOUND_VERSION_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Found in Version'
,p_source=>'FOUND_VERSION_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'VERSION LIST P48'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v.version_name d, v.id r',
'  from eba_bt_version v',
' where nvl(v.product_id, :P48_PRODUCT_ID) = :P48_PRODUCT_ID',
' order by 1'))
,p_lov_cascade_parent_items=>'P48_PRODUCT_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the version in which the bug was found.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308637692779509023)
,p_name=>'P48_STATUS_ID'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6308634069096508990)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'STATUS_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUSLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_NAME d, id r',
'from   eba_bt_status where upper(IS_ACTIVE) = ''Y''',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704949468288344)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The current status of the bug.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308637867161509024)
,p_name=>'P48_URGENCY_ID'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6308634069096508990)
,p_use_cache_before_default=>'NO'
,p_item_default=>'3'
,p_prompt=>'Development Priority'
,p_source=>'URGENCY_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'URGENCYLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select URGENCY_NAME d, ',
'         id  r',
'from   eba_bt_urgency ',
'where upper(IS_ACTIVE) = ''Y''',
'order by 1',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704949468288344)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The urgency level in fixing this bug.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308638090215509024)
,p_name=>'P48_ASSIGNED_TO_GROUP_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Assigned To Group'
,p_source=>'ASSIGNED_TO_GROUP_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'GROUPLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select GROUP_NAME d, id r',
'from eba_bt_group  where IS_ACTIVE = ''Y'' order by 1 '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Not Assigned -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the group in which the bug belongs to.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308638267192509025)
,p_name=>'P48_FIXED_VERSION_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fixed In Version'
,p_source=>'FIXED_VERSION_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'VERSION LIST P48'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v.version_name d, v.id r',
'  from eba_bt_version v',
' where nvl(v.product_id, :P48_PRODUCT_ID) = :P48_PRODUCT_ID',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Fixed In -'
,p_lov_cascade_parent_items=>'P48_PRODUCT_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the version in which the bug is fixed.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308638486977509025)
,p_name=>'P48_FIX_BY_VERSION_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fix By Version'
,p_source=>'FIX_BY_VERSION_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'VERSION LIST P48'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v.version_name d, v.id r',
'  from eba_bt_version v',
' where nvl(v.product_id, :P48_PRODUCT_ID) = :P48_PRODUCT_ID',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Fix By -'
,p_lov_cascade_parent_items=>'P48_PRODUCT_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the version in which the bug is or will be fixed.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308638896335509026)
,p_name=>'P48_FLEX_01'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(6308831471588645037)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 01'
,p_source=>'FLEX_01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The additional field'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308639073310509027)
,p_name=>'P48_FLEX_02'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(6308831471588645037)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 02'
,p_source=>'FLEX_02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The additional field'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308639280126509027)
,p_name=>'P48_FLEX_03'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(6308831471588645037)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 03'
,p_source=>'FLEX_03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The additional field'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308639482289509027)
,p_name=>'P48_FLEX_04'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(6308831471588645037)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 04'
,p_source=>'FLEX_04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The additional field'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308639690276509028)
,p_name=>'P48_FLEX_05'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(6308831471588645037)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 05'
,p_source=>'FLEX_05'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The additional field'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308639888342509028)
,p_name=>'P48_CREATED'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(6308831680592647700)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created On:'
,p_format_mask=>'SINCE'
,p_source=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'This bug was created on.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308640095102509029)
,p_name=>'P48_CREATED_BY'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(6308831680592647700)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created By:'
,p_source=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'This bug was created by.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308640289432509029)
,p_name=>'P48_UPDATED'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(6308831680592647700)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated On:'
,p_format_mask=>'SINCE'
,p_source=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'This bug was upldated on.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308640488789509030)
,p_name=>'P48_UPDATED_BY'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(6308831680592647700)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated By:'
,p_source=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'This bug was updated by.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308640681078509030)
,p_name=>'P48_TAGS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(6308831889249650138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.TAGS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'  from eba_bt_tags_type_sum',
' where content_type = ''DEFECT'''))
,p_cSize=>80
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Give tags for this bug'
,p_attribute_02=>'Tags may not contain the following characters: : ; \ / ? &'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2714603037334693098)
,p_validation_name=>'P48_SUBJECT Not Null'
,p_validation_sequence=>10
,p_validation=>'return trim(:P48_SUBJECT) is not null'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(6308635677054509002)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2714603745301704562)
,p_validation_name=>'P48_NEW_PRODUCT Not Null'
,p_validation_sequence=>20
,p_validation=>'return trim(:P48_NEW_PRODUCT) is not null'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'P48_PRODUCT_ID'
,p_validation_condition2=>'0'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(5497218583175402521)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2151223319364974069)
,p_validation_name=>'P46_NEW_CATEGORY Not Null'
,p_validation_sequence=>30
,p_validation=>'P48_NEW_CATEGORY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'P48_CATEGORY_ID'
,p_validation_condition2=>'0'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(2151222954611974066)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5497218871532408658)
,p_name=>'show new product'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P48_PRODUCT_ID'
,p_condition_element=>'P48_PRODUCT_ID'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5497219193740408665)
,p_event_id=>wwv_flow_api.id(5497218871532408658)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_NEW_PRODUCT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5497219375531408670)
,p_event_id=>wwv_flow_api.id(5497218871532408658)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_NEW_PRODUCT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2151223050202974067)
,p_name=>'show new category'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P48_CATEGORY_ID'
,p_condition_element=>'P48_CATEGORY_ID'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2151223184646974068)
,p_event_id=>wwv_flow_api.id(2151223050202974067)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_NEW_CATEGORY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2151223484974974071)
,p_event_id=>wwv_flow_api.id(2151223050202974067)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_NEW_CATEGORY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6308640882060509031)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_BT_SW_DEFECTS'
,p_attribute_02=>'EBA_BT_SW_DEFECTS'
,p_attribute_03=>'P48_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5497219889240442138)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create new product as needed'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_id number := null;',
'begin',
'if :P48_PRODUCT_ID = 0 then',
'    if :P48_NEW_PRODUCT is not null then',
'        insert into EBA_BT_PRODUCT (PRODUCT_NAME) values (:P48_NEW_PRODUCT)',
'        returning id into l_id;',
'        :P48_PRODUCT_ID := l_id;',
'    end if;',
'end if;',
'end;'))
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2151223358103974070)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create new category as needed'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_id number := null;',
'begin',
'if :P48_CATEGORY_ID = 0 then',
'    if :P48_NEW_CATEGORY is not null then',
'        insert into EBA_BT_CATEGORY (CATEGORY_NAME) values (:P48_NEW_CATEGORY)',
'        returning id into l_id;',
'        :P48_CATEGORY_ID := l_id;',
'    end if;',
'end if;',
'end;'))
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6308641082870509031)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_BT_SW_DEFECTS'
,p_attribute_02=>'EBA_BT_SW_DEFECTS'
,p_attribute_03=>'P48_ID'
,p_attribute_04=>'ID'
,p_attribute_09=>'P48_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>'Unable to process row of table EBA_BT_SW_DEFECTS.'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6308641270269509032)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_api.id(6308634488076508990)
);
end;
/
