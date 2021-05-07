prompt --application/pages/page_00061
begin
wwv_flow_api.create_page(
 p_id=>61
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Load Bugs from Spreadsheet'
,p_page_mode=>'MODAL'
,p_step_title=>'Load Bugs from Spreadsheet'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141455855818868)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function set_item()',
'{',
'$x(''P61_COPY_PASTE'').value= $v(''P61_SAMPLE_DATA'');',
'$x(''P61_SEPARATOR'').value= '','';',
'$s(''P61_FIRST_ROW'', ''Y'');',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(3797424040496072790)
,p_help_text=>'<p>This wizard allows uploading of software defect (bug) data. Two options are provided to upload data. The first option is by copy and paste and the second option is by uploading a comma separated file (.CSV). When mapping bug data to be loaded into'
||' this bug system, a number of columns use foreign keys including Status, Priority, Assigned To, Severity, Found In, Fixed By and Fixed In.  These foreign keys will be mapped during the upload process.  It highly recommended that the first row contain'
||' column headings and these column headings be exactly as described in the <strong>how to Upload Data</strong> explanation below.</p>'
,p_last_upd_yyyymmddhh24miss=>'20180220142951'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(332494685379100136)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1103611251998053570)
,p_plug_name=>'Load Bugs from Spreadsheet'
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(1934310451094840868)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_api.id(4393977456980521252)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1225704044613288342)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2753783246238523786)
,p_plug_name=>'How to Upload Data'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225686614700288321)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   c integer := 0;',
'begin',
'sys.htp.p(''<p>It is recommended that the data to be uploaded from cut and paste or from CSV file be structured with column headings in the first row that match the column names in the table below.</p>'');',
'',
'sys.htp.p(''<table summary="sample data" class="u-Report" border="0">',
'<thead>',
'<tr>',
'<th>Column Name</th>',
'<th>Acceptable Values</th>',
'<th>Comments</th>',
'</tr>',
'</thead>'');',
'sys.htp.p(''<tbody>'');',
'',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td>BUG_NUMBER</td><td>May be number or characters</td><td>Required.  Bug matches are processed as updates</td>'');',
'sys.htp.p(''</tr>'');',
'',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td>PRODUCT_ID</td><td>'');',
'c := 0; for c1 in (select PRODUCT_NAME x from eba_bt_product order by 1) loop c := c + 1; ',
'if c > 1 then sys.htp.prn('', ''); end if;',
'sys.htp.prn(''"''||apex_escape.html(c1.x)||''"'');',
'end loop;',
'sys.htp.p(''</td><td>Define from admin console</td>'');',
'sys.htp.p(''</tr>'');',
'',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td>SUBJECT</td><td>500 characters or less</td><td>Required</td>'');',
'sys.htp.p(''</tr>'');',
'',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td>STATUS_ID</td><td>'');',
'c := 0; for c1 in (select  STATUS_NAME x from eba_bt_status order by 1) loop c := c + 1; ',
'if c > 1 then sys.htp.prn('', ''); end if;',
'sys.htp.prn(''"''||apex_escape.html(c1.x)||''"'');',
'end loop;',
'sys.htp.p(''</td><td>Define from admin console</td>'');',
'sys.htp.p(''</tr>'');',
'',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td>URGENCY_ID</td><td>'');',
'c := 0; for c1 in (select urgency_name x from eba_bt_urgency order by 1) loop c := c + 1; ',
'if c > 1 then sys.htp.prn('', ''); end if;',
'sys.htp.prn(''"''||apex_escape.html(c1.x)||''"'');',
'end loop;',
'sys.htp.p(''</td><td>Define from admin console as severity codes</td>'');',
'sys.htp.p(''</tr>'');',
'',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td>ASSIGNED_TO_ID</td><td>'');',
'c := 0; for c1 in (select username x from EBA_BT_USERs order by 1) loop c := c + 1; ',
'if c > 1 then sys.htp.prn('', ''); end if;',
'sys.htp.prn(''"''||apex_escape.html(c1.x)||''"'');',
'if c > 20 then',
'  sys.htp.prn(''...'');',
'  exit;',
'end if;',
'end loop;',
'sys.htp.p(''</td><td>Assigned from Assignees tab</td>'');',
'sys.htp.p(''</tr>'');',
'',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td>SEVERITY_ID</td><td>'');',
'c := 0; for c1 in (select  SEVERITY_NAME x from EBA_BT_SEVERITY order by sequence_number, severity_name) loop c := c + 1; ',
'if c > 1 then sys.htp.prn('', ''); end if;',
'sys.htp.prn(''"''||apex_escape.html(c1.x)||''"'');',
'end loop;',
'sys.htp.p(''</td><td></td>'');',
'sys.htp.p(''</tr>'');',
'',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td>FOUND_VERSION_ID</td><td>'');',
'',
'for c1 in (',
'    select product_name x, id ',
'    from eba_bt_product ',
'    order by 1) loop ',
'c := 0; ',
'sys.htp.p(''<strong>''||apex_escape.html(c1.x)||''</strong>: '');',
'for c2 in (',
'   select version_name x ',
'   from EBA_BT_VERSION ',
'   where PRODUCT_ID = c1.id order by RELEASE_DATE) loop',
'c := c + 1; ',
'if c > 1 then sys.htp.prn('', ''); end if;',
'sys.htp.prn(''"''||apex_escape.html(c2.x)||''"'');',
'end loop;',
'end loop;',
'sys.htp.p(''</td><td>Not required</td>'');',
'sys.htp.p(''</tr>'');',
'',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td>FIX_BY_VERSION_ID</td><td>same as above</td><td>Not required.  Versions listed by product</td>'');',
'sys.htp.p(''</tr>'');',
'',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td>FIXED_VERSION_ID</td><td>same as above</td><td>Not required</td>'');',
'sys.htp.p(''</tr>'');',
'sys.htp.p(''</tbody></table>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4393979741365521261)
,p_plug_name=>'Data Load Source'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:100%;max-width:none;"'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4393983138262521267)
,p_plug_name=>'Globalization'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_region_attributes=>'style="width:100%;max-width:none;"'
,p_plug_template=>wwv_flow_api.id(1225686614700288321)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4393980030145521262)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(332494685379100136)
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
 p_id=>wwv_flow_api.id(4424285253551061471)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(332494685379100136)
,p_button_name=>'TRY_SAMPLE_DATA'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Try Sample Data'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'javascript:set_item();'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4393980150328521262)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(332494685379100136)
,p_button_name=>'NEXT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.widget.textareaClob.upload(''P61_COPY_PASTE'', ''NEXT'');'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4393986353706521272)
,p_branch_action=>'f?p=&APP_ID.:71:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4393980150328521262)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4393980456617521264)
,p_name=>'P61_IMPORT_FROM'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4393979741365521261)
,p_item_default=>'PASTE'
,p_prompt=>'Import From'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'DATA_LOAD_OPTION'
,p_lov=>'.'||wwv_flow_api.id(3410843146551786985)||'.'
,p_field_template=>wwv_flow_api.id(269498005044969761)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4393980532010521264)
,p_name=>'P61_FILE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4393979741365521261)
,p_prompt=>'File Name'
,p_display_as=>'NATIVE_FILE'
,p_field_template=>wwv_flow_api.id(269497651921969761)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Name of the file to upload'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'REQUEST'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4393981343454521266)
,p_name=>'P61_SEPARATOR'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4393979741365521261)
,p_item_default=>'\t'
,p_prompt=>'Separator'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_field_template=>wwv_flow_api.id(269497651921969761)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Identify a column separator character. Use <code>\t</code> for tab separators.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4393981834899521266)
,p_name=>'P61_ENCLOSED_BY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4393979741365521261)
,p_item_default=>'"'
,p_prompt=>'Optionally Enclosed By'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(269498005044969761)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Enter a delimiter character. You can use this character to delineate the starting and ending boundary of a data value. If you specify a delimiter character, Data Workshop ignores whitespace occurring before the starting and ending boundary of a data '
||'value. You can also use this option to enclose a data value with the specified delimiter character.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4393982331501521267)
,p_name=>'P61_FIRST_ROW'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4393979741365521261)
,p_prompt=>'First Row has Column Names'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'FIRST_ROW_OPTION'
,p_lov=>'.'||wwv_flow_api.id(3410845632996786993)||'.'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(269498005044969761)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Select this box if your data contains column names in the first row.'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4393982953416521267)
,p_name=>'P61_COPY_PASTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4393979741365521261)
,p_prompt=>'Copy and Paste Delimited Data'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cHeight=>10
,p_field_template=>wwv_flow_api.id(269497651921969761)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4393983450194521269)
,p_name=>'P61_CURRENCY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4393983138262521267)
,p_item_default=>'$'
,p_prompt=>'Currency Symbol'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select value',
'  from nls_session_parameters',
' where parameter = ''NLS_CURRENCY'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_field_template=>wwv_flow_api.id(269498005044969761)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'If your data contains international currency symbol, enter it here. For example, if your data has "&euro;1,234.56" or "&yen;1,234.56", enter "&euro;" or "&yen;".  Otherwise the data will not load correctly.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4393983952658521269)
,p_name=>'P61_GROUP_SEPARATOR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4393983138262521267)
,p_prompt=>'Group Separator'
,p_source=>'apex_application.get_nls_group_separator'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_field_template=>wwv_flow_api.id(269498005044969761)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>A group separator is a character that separates integer groups, for example to show thousands and millions.</p>',
'<p>Any character can be the group separator. The character specified must be single-byte, and the group separator must be different from any other decimal character. The character can be a space, but cannot be a numeric character or any of the follow'
||'ing:</p>',
'<ul class="noIndent">',
'<li>plus (+)</li>',
'<li>hyphen (-)</li> ',
'<li>less than sign (<)</li>',
'<li>greater than sign (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4393984428841521269)
,p_name=>'P61_DECIMAL_CHARACTER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(4393983138262521267)
,p_prompt=>'Decimal Character'
,p_source=>'apex_application.get_nls_decimal_separator'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_field_template=>wwv_flow_api.id(269498005044969761)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The decimal character separates the integer and decimal parts of a number.</p>',
'<p> Any character can be the decimal character. The character specified must be single-byte, and the decimal character must be different from group separator. The character can be a space, but cannot be any numeric character or any of the following c'
||'haracters:</p>',
'<ul class="noIndent">',
'<li>plus (+)</li>',
'<li>hyphen (-)</li> ',
'<li>less than sign (<)</li>',
'<li>greater than sign (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4424237640391057687)
,p_name=>'P61_SAMPLE_DATA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4393979741365521261)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'"Bug number","Product id","Subject","Status ID","Urgency ID","Assigned To id","Severity ID","Found Version Id","Fix by version id","Fixed version id"',
'"1089","Example Product","Issue with date field in Reports","Closed Fixed","3. Medium","ANDRE","3. Medium","Alpha 1","","Alpha 1"',
'"1090","Example Product","Expected date error..","Closed Fixed","3. Medium","ANDRE","4. Low","Alpha 1","","Alpha 1"',
'"1093","Example Product","I/O Error when calling core.dll","Closed Fixed","3. Medium","ANDRE","3. Medium","Alpha 1","","Alpha 1"',
'"1110","Example Product","Javascript error in Home Page","Closed Fixed","3. Medium","BRYAN","2. High","Alpha 1","","Alpha 1"',
'"1111","Example Product","Search performance is poor","","3. Medium","MICHELLE","4. Low","Alpha 1","",""',
'"1112","Example Product","Issue with AJAX Call","Closed Fixed","3. Medium","SARAH","2. High","Alpha 1","","Alpha 1"'))
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4393981156828521265)
,p_validation_name=>'Filename is not null'
,p_validation_sequence=>10
,p_validation=>'P61_FILE_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'P61_IMPORT_FROM'
,p_validation_condition2=>'UPLOAD'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(4393980150328521262)
,p_associated_item=>wwv_flow_api.id(4393980532010521264)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4393984833512521269)
,p_name=>'Import From Copy and Paste'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P61_IMPORT_FROM'
,p_condition_element=>'P61_IMPORT_FROM'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'PASTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4393985130472521270)
,p_event_id=>wwv_flow_api.id(4393984833512521269)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P61_COPY_PASTE'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4393985354598521271)
,p_event_id=>wwv_flow_api.id(4393984833512521269)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P61_COPY_PASTE'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4393985437567521271)
,p_name=>'Import from File'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P61_IMPORT_FROM'
,p_condition_element=>'P61_IMPORT_FROM'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'UPLOAD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4393985747731521271)
,p_event_id=>wwv_flow_api.id(4393985437567521271)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P61_FILE_NAME'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4393985930499521271)
,p_event_id=>wwv_flow_api.id(4393985437567521271)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P61_FILE_NAME'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(332494821888100137)
,p_name=>'CNX'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4393980030145521262)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(332494904632100138)
,p_event_id=>wwv_flow_api.id(332494821888100137)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4393986155566521272)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PARSE_UPLOADED_DATA'
,p_process_name=>'Parse Uploaded Data'
,p_attribute_01=>wwv_flow_api.id(4393975136756521238)
,p_attribute_02=>'P61_IMPORT_FROM'
,p_attribute_03=>'P61_SEPARATOR'
,p_attribute_04=>'P61_ENCLOSED_BY'
,p_attribute_05=>'P61_FIRST_ROW'
,p_attribute_06=>'P61_CURRENCY'
,p_attribute_07=>'P61_GROUP_SEPARATOR'
,p_attribute_08=>'P61_DECIMAL_CHARACTER'
,p_attribute_09=>'P61_FILE_NAME'
,p_attribute_10=>'P61_COPY_PASTE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4393980150328521262)
);
end;
/
