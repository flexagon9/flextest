prompt --application/pages/page_00027
begin
wwv_flow_api.create_page(
 p_id=>27
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_tab_set=>'TS2'
,p_name=>'Bug Details Page'
,p_step_title=>'Bug Change Log'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_html_page_onload=>'onLoad="closeWindow();"'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141354470818444)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'function closeWindow() {',
'if ( document.getElementById("P27_SAVESTATUS").value == ''Y'' )',
'{',
'window.opener.location.href=window.opener.location.href;',
'window.close();',
'}',
'}',
'',
'function mypopupURL(url,windowName)',
'',
'{w = open(url,windowName,"Scrollbars=1,resizable=1,width=800,height=600");',
'',
'if (w.opener == null)',
'',
'w.opener = self;',
'',
'w.focus();}',
'',
'',
'//-->',
'</script>'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(3797358846252064904)
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20180111133932'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10436918293168788471)
,p_plug_name=>'Bug Change Log'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'&CHANGE_LOG_MESSAGE.'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10436918905725788477)
,p_button_sequence=>30
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'return :P27_ID is null or (:P27_ID is not null and :P27_DETAIL_TYPE = ''U'') ;'
,p_button_condition_type=>'FUNCTION_BODY'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10436918687144788477)
,p_button_sequence=>10
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:window.close();'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10436918489809788475)
,p_button_sequence=>20
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P27_ID is not null and :P27_DETAIL_TYPE = ''U'' then ',
'   return true;',
'else',
'   return false;',
'end if;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10436922504767788516)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.::P27_ID:'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 22-FEB-2006 01:48 by SATHISH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6323645687653232381)
,p_name=>'P27_DETAIL_TYPE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_use_cache_before_default=>'NO'
,p_source=>'P27_DETAIL_TYPE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10436919302130788478)
,p_name=>'P27_PRODUCT_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_use_cache_before_default=>'NO'
,p_source=>'&P27_PRODUCT_ID.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10436919497168788488)
,p_name=>'P27_SAVESTATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_use_cache_before_default=>'NO'
,p_source=>'&P27_SAVESTATUS.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10436919700533788488)
,p_name=>'P27_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_use_cache_before_default=>'NO'
,p_source=>'&P27_ID.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10436920094330788489)
,p_name=>'P27_DESCRIPTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'&P27_DESCRIPTION.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10436920491569788489)
,p_name=>'P27_REQUEST'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_use_cache_before_default=>'NO'
,p_source=>'&P27_REQUEST.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10436920699279788490)
,p_name=>'P27_BUILDPOPUPURL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_display_as=>'NATIVE_HIDDEN'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10436920902345788490)
,p_name=>'P27_NOTES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notes'
,p_source=>'P27_NOTES'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>32767
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10436921100099788490)
,p_name=>'P27_BUILD_EDITPOPUPURL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_use_cache_before_default=>'NO'
,p_source=>'&P27_BUILD_EDITPOPUPURL.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10437446506615841589)
,p_name=>'P27_STATUS_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'&P27_STATUS_ID.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUSLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_NAME d, id r',
'from   eba_bt_status where upper(IS_ACTIVE) = ''Y''',
''))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10437478703115887804)
,p_name=>'P27_PROBLEM_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(10436918293168788471)
,p_use_cache_before_default=>'NO'
,p_source=>'&P27_PROBLEM_ID.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10436921879926788507)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'if :P27_NOTES is null then',
'  select localtimestamp',
'    into :P27_NOTES',
'    from dual;',
'end if;',
'',
':P27_BUILDPOPUPURL := apex_util.PREPARE_URL(''f?p='' || v(''APP_ID'') || '':20:'' || V(''SESSION'') || ''::NO::P20_VERSION_ID,P20_BUILD_NAME,P20_ID,P20_SAVESTATUS,P20_BUILD_DATE,P20_DESCRIPTION:'' || :P27_ID || '',,,,,''  ) ;',
'',
':P27_BUILD_EDITPOPUPURL := apex_util.PREPARE_URL(''f?p='' || v(''APP_ID'') || '':20:'' || V(''SESSION'') || '':EDIT:NO::P20_SAVESTATUS,P20_ID:,'' ) ;',
'',
'END ;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10436922099924788513)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'10'
,p_process_when_button_id=>wwv_flow_api.id(10436918489809788475)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10436922282408788515)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert Record'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    l_assigned_to_id number ;',
'BEGIN',
'',
'for c1 in ( ',
'     select assigned_to_id from EBA_BT_SW_DEFECTS where id = :p27_PROBLEM_ID ',
')',
'loop',
'    l_assigned_to_id := c1.assigned_to_id ;',
'end loop ;',
'',
':P27_SAVESTATUS := ''Y'' ;',
'',
'END ;'))
,p_process_when_button_id=>wwv_flow_api.id(10436918905725788477)
,p_process_success_message=>'Record Inserted'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6323651501346349802)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Row'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  :P27_SAVESTATUS := ''Y'' ;',
'end;'))
,p_process_when_button_id=>wwv_flow_api.id(10436918489809788475)
);
end;
/
