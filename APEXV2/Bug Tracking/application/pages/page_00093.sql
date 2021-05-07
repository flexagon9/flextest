prompt --application/pages/page_00093
begin
wwv_flow_api.create_page(
 p_id=>93
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Create Bug'
,p_page_mode=>'MODAL'
,p_step_title=>'Create Bug'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141455855818868)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(3797424040496072790)
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20180208112230'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(938549607197779326)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(938549719137779327)
,p_plug_name=>'Advanced'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(1225686614700288321)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7236345825883373388)
,p_plug_name=>'Bug'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937809803058804328)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(938549607197779326)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937811016535804332)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(938549607197779326)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Bug'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P93_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(937817879079804349)
,p_branch_name=>'Go To Page 31'
,p_branch_action=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP:P31_ID:&BUG_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(937811016535804332)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937782133816804260)
,p_name=>'P93_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(7236345825883373388)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937782565521804267)
,p_name=>'P93_BUG_NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(7236345825883373388)
,p_use_cache_before_default=>'NO'
,p_source=>'BUG_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P93_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'The unique number assigned to this bug.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937783523461804271)
,p_name=>'P93_SUBJECT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7236345825883373388)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Subject'
,p_source=>'SUBJECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(1593548698177354147)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937784416166804272)
,p_name=>'P93_STATUS_ID'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(7236345825883373388)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'STATUS_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_NAME d, id r',
'from   eba_bt_status where upper(IS_ACTIVE) = ''Y'' and NVL(upper(VALID_FOR_NEW),''Y'') = ''Y''',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548698177354147)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937785284468804274)
,p_name=>'P93_URGENCY_ID'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(7236345825883373388)
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
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1593548698177354147)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937786185740804275)
,p_name=>'P93_PRODUCT_ID'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(7236345825883373388)
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
,p_field_template=>wwv_flow_api.id(1593548698177354147)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937787055910804277)
,p_name=>'P93_NEW_PRODUCT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(7236345825883373388)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Product'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1593548698177354147)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937788247809804278)
,p_name=>'P93_DESCRIPTION'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(7236345825883373388)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>32767
,p_cHeight=>6
,p_field_template=>wwv_flow_api.id(1593548698177354147)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937799525414804289)
,p_name=>'P93_ASSIGNED_TO_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(7236345825883373388)
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
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937800353374804290)
,p_name=>'P93_SEVERITY_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(938549719137779327)
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
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'How severe the bug is to the system functions.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937801241337804291)
,p_name=>'P93_FOUND_VERSION_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(938549719137779327)
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
,p_lov_cascade_parent_items=>'P93_PRODUCT_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the version in which the bug was found.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937802150768804292)
,p_name=>'P93_FIX_BY_VERSION_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(938549719137779327)
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
,p_lov_cascade_parent_items=>'P93_PRODUCT_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the version in which the bug is or will be fixed.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937804861524804295)
,p_name=>'P93_CATEGORY_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(7236345825883373388)
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
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the category in which the bug belongs to.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937805802048804296)
,p_name=>'P93_NEW_CATEGORY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(938549719137779327)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Category'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1593548698177354147)
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
 p_id=>wwv_flow_api.id(937806648988804297)
,p_name=>'P93_OS_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(938549719137779327)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Operating System / Browser'
,p_source=>'OS_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the OS name in which the bug was found.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937807609460804298)
,p_name=>'P93_ASSIGNED_TO_GROUP_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(938549719137779327)
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
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Specify the group in which the bug belongs to.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937808486985804299)
,p_name=>'P93_TAGS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(938549719137779327)
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
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Give tags for this bug'
,p_attribute_02=>'Tags may not contain the following characters: : ; \ / ? &'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937809383085804301)
,p_name=>'P93_CUSTOMER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(938549719137779327)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Customer'
,p_source=>'CUSTOMER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(1593548578216354144)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(937811832850804338)
,p_validation_name=>'P93_SUBJECT Not Null'
,p_validation_sequence=>10
,p_validation=>'return trim(:P93_SUBJECT) is not null'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(937783523461804271)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(937812264105804338)
,p_validation_name=>'P93_NEW_PRODUCT Not Null'
,p_validation_sequence=>20
,p_validation=>'return trim(:P93_NEW_PRODUCT) is not null'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'P93_PRODUCT_ID'
,p_validation_condition2=>'0'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(937787055910804277)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(937811456085804336)
,p_validation_name=>'P46_NEW_CATEGORY Not Null'
,p_validation_sequence=>30
,p_validation=>'P93_NEW_CATEGORY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'P93_CATEGORY_ID'
,p_validation_condition2=>'0'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(937805802048804296)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937814539225804342)
,p_name=>'show new product'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93_PRODUCT_ID'
,p_condition_element=>'P93_PRODUCT_ID'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937815075117804344)
,p_event_id=>wwv_flow_api.id(937814539225804342)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93_NEW_PRODUCT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937815603593804345)
,p_event_id=>wwv_flow_api.id(937814539225804342)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93_NEW_PRODUCT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937815985246804345)
,p_name=>'show new category'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93_CATEGORY_ID'
,p_condition_element=>'P93_CATEGORY_ID'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937816521152804346)
,p_event_id=>wwv_flow_api.id(937815985246804345)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93_NEW_CATEGORY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937816962310804346)
,p_event_id=>wwv_flow_api.id(937815985246804345)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93_NEW_CATEGORY'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(384056021597709634)
,p_name=>'Cancel DIalog'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937809803058804328)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(384056109999709635)
,p_event_id=>wwv_flow_api.id(384056021597709634)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(937813332843804340)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_BT_SW_DEFECTS'
,p_attribute_02=>'EBA_BT_SW_DEFECTS'
,p_attribute_03=>'P93_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(937812991660804340)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create new product as needed'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_id number := null;',
'begin',
'if :P93_PRODUCT_ID = 0 then',
'    if :P93_NEW_PRODUCT is not null then',
'        insert into EBA_BT_PRODUCT (PRODUCT_NAME) values (:P93_NEW_PRODUCT)',
'        returning id into l_id;',
'        :P93_PRODUCT_ID := l_id;',
'    end if;',
'end if;',
'end;'))
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(937812593126804339)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create new category as needed'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_id number := null;',
'begin',
'if :P93_CATEGORY_ID = 0 then',
'    if :P93_NEW_CATEGORY is not null then',
'        insert into EBA_BT_CATEGORY (CATEGORY_NAME) values (:P93_NEW_CATEGORY)',
'        returning id into l_id;',
'        :P93_CATEGORY_ID := l_id;',
'    end if;',
'end if;',
'end;'))
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(937813801599804340)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_BT_SW_DEFECTS'
,p_attribute_02=>'EBA_BT_SW_DEFECTS'
,p_attribute_03=>'P93_ID'
,p_attribute_04=>'ID'
,p_attribute_09=>'BUG_ID'
,p_attribute_11=>'I'
,p_attribute_12=>'Y'
,p_process_error_message=>'Unable to process row of table EBA_BT_SW_DEFECTS.'
,p_process_when_button_id=>wwv_flow_api.id(937811016535804332)
,p_process_success_message=>'Bug Created'
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(937814211192804341)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
);
end;
/
