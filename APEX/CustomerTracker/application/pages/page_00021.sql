--application/pages/page_00021
prompt  ...PAGE 21: Data Load Source
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 21
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Data Load Source'
 ,p_step_title => 'Data Load Source'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_code => 
'function set_item()'||unistr('\000a')||
'{'||unistr('\000a')||
'$s(''P21_IMPORT_FROM'', ''PASTE'');'||unistr('\000a')||
'$s(''P21_SEPARATOR'','','');'||unistr('\000a')||
'$s(''P21_FIRST_ROW'', ''Y'');'||unistr('\000a')||
'$(''#P21_COPY_PASTE'').val($(''#P21_SAMPLE_DATA'').val());'||unistr('\000a')||
'}'
 ,p_step_template => 1020520844391437556 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20130410111823'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<p>Choose the <strong>Import From</strong> of "Copy and Paste", input <strong>Separator</strong> as "," and ensure the <strong>First Row has Column Names</strong> is checked.</p>'||unistr('\000a')||
'<p>Click the <strong>Insert Sample Data</strong> button to automatically load the sample data or select the text below and paste it into the <strong>Copy and Paste Delimited Data</strong> section. </p>'||unistr('\000a')||
'<pre id="sampledata';

s:=s||'">'||unistr('\000a')||
'First Name,Last Name,Street Address,City,State,Postal Code,Email,Phone Number,Alternate Number,Credit Limit,Tags'||unistr('\000a')||
'John,Dulles,5987 Whitehart Lane,Chicago,Illinois,60606,john.dulles@mailman.com,312-666-5987,720-666-1234,4000,New Address'||unistr('\000a')||
'Peter,Williams,1212 Technology Way,Denver,Colorado,80227,,303-555-6688,,1500,'||unistr('\000a')||
'Susan,Peters,9000 Reston Parkway,Reston,Virginia,20191,susan.peters@email.com,703-99';

s:=s||'9-5467,703-123-9876,2500,'||unistr('\000a')||
'Albert,Lambert,2468 Longmire Place,St. Louis,Missouri,63149,,314-000-1000,,3300,New Address'||unistr('\000a')||
'Bob,Uncle,888 Mason St,San Francisco,California,94110,bob.uncle@mail.com,,,2200'||unistr('\000a')||
'</pre>';

wwv_flow_api.create_page_plug (
  p_id=> 987612367786803729 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_plug_name=> 'Sample Data',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1020542370695437571+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" class="uCloseMessage"><span class="visuallyhidden">Close Notification</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="">'||unistr('\000a')||
'     ';

s:=s||'   <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">Error Message</h2>'||unistr('\000a')||
'          1 error has occurred<ul class="htmldbUlErr"><li>Copy and Paste Delimited Data must have some value. (<a href="javascript:apex.item(''P21_COPY_PASTE'').setFocus();void(0);">Go to error</a>)</li></ul>'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>';

wwv_flow_api.create_page_plug (
  p_id=> 993451249429667075 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_plug_name=> 'No Data',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'AFTER_HEADER',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'REQUEST_EQUALS_CONDITION',
  p_plug_display_when_condition => 'BACK',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1739041406741354929 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_plug_name=> 'Data Load Process Train',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> '',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 1739039391950354925 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 1020550451715437576+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1739041507399354933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_plug_name=> 'Data Load Source',
  p_region_name=>'',
  p_region_attributes=> 'style="width:100%;max-width:none;"',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1020541067266437568+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1739045414926354942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_plug_name=> 'Globalization',
  p_region_name=>'',
  p_region_attributes=> 'style="width:100%;max-width:none;"',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1020538949418437567+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1739069592081364372 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_plug_name=> 'Data Loading Train',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 1739039391950354925 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 1020550451715437576+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1739071793860393296 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_plug_name=> 'Buttons',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1020545675039437574+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 1020550451715437576+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 1739041801168354935 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 21,
  p_button_sequence=> 10,
  p_button_plug_id => 1739071793860393296+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1739041899842354935 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 21,
  p_button_sequence=> 20,
  p_button_plug_id => 1739071793860393296+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(1020554846275437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Next',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.textareaClob.upload(''P21_COPY_PASTE'', ''NEXT'');',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'rightarrow',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 987693452624054880 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 21,
  p_button_sequence=> 30,
  p_button_plug_id => 987612367786803729+wwv_flow_api.g_id_offset,
  p_button_name    => 'PASTE_SAMPLE_DATA',
  p_button_action  => 'DEFINED_BY_DA',
  p_button_image   => 'template:'||to_char(1020554264348437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Insert Sample Data',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'gear uAltButton iconLeft',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>1739048620265354947 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:22:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>1739041899842354935+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>987656368211847770 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_SAMPLE_DATA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 987612367786803729+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'First Name,Last Name,Street Address,City,State,Postal Code,Email,Phone Number,Alternate Number,Credit Limit,Tags'||unistr('\000a')||
'John,Dulles,5987 Whitehart Lane,Chicago,Illinois,60606,john.dulles@mailman.com,312-666-5987,720-666-1234,4000,New Address'||unistr('\000a')||
'Peter,Williams,1212 Technology Way,Denver,Colorado,80227,,303-555-6688,,1500,'||unistr('\000a')||
'Susan,Peters,9000 Reston Parkway,Reston,Virginia,20191,susan.peters@email.com,703-999-5467,703-123-9876,2500,'||unistr('\000a')||
'Albert,Lambert,2468 Longmire Place,St. Louis,Missouri,63149,,314-000-1000,,3300,New Address'||unistr('\000a')||
'Bob,Uncle,888 Mason St,San Francisco,California,94110,bob.uncle@mail.com,,,2200',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1739042211864354937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_IMPORT_FROM',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1739041507399354933+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'PASTE',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Import From',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'DATA_LOAD_OPTION',
  p_lov=> '.'||to_char(7708989683543876420 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT-TOP',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553748037437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_input => 'Y',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '1',
  p_attribute_02 => 'NONE',
  p_attribute_04 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Name of the file to upload';

wwv_flow_api.create_page_item(
  p_id=>1739042312423354938 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_FILE_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 65,
  p_item_plug_id => 1739041507399354933+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'File Name',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_FILE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553748037437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_input => 'Y',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'WWV_FLOW_FILES',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Identify a column separator character. Use <code>\t</code> for tab separators.';

wwv_flow_api.create_page_item(
  p_id=>1739043098927354939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_SEPARATOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1739041507399354933+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '\t',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Separator',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 2,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_input => 'Y',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Enter a delimiter character. You can use this character to delineate the starting and ending boundary of a data value. If you specify a delimiter character, Data Workshop ignores whitespace occurring before the starting and ending boundary of a data value. You can also use this option to enclose a data value with the specified delimiter character.';

wwv_flow_api.create_page_item(
  p_id=>1739043590198354941 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_ENCLOSED_BY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 1739041507399354933+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '"',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Optionally Enclosed By',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 2,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_input => 'Y',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1739044109607354941 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_FIRST_ROW',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 1739041507399354933+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'Y',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'First Row has Column Names',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_CHECKBOX',
  p_named_lov=> 'FIRST_ROW_OPTION',
  p_lov=> '.'||to_char(7708992189488876435 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_input => 'Y',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '1',
  p_attribute_02 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1739044604304354942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_CHAR_SET',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 55,
  p_item_plug_id => 1739041507399354933+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'UTF-8',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'File Character Set',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'DATA_LOAD_CHARSET',
  p_lov=> '.'||to_char(1724989211833676616 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_input => 'Y',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1739045205940354942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_COPY_PASTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 1739041507399354933+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Copy and Paste Delimited Data',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> null,
  p_cHeight=> 10,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553960506437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_input => 'Y',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'If your data contains international currency symbol, enter it here. For example, if your data has "&euro;1,234.56" or "&yen;1,234.56", enter "&euro;" or "&yen;".  Otherwise the data will not load correctly.';

wwv_flow_api.create_page_item(
  p_id=>1739045716716354943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_CURRENCY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1739045414926354942+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '$',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Currency Symbol',
  p_source=>'select value'||unistr('\000a')||
'  from nls_session_parameters'||unistr('\000a')||
' where parameter = ''NLS_CURRENCY''',
  p_source_type=> 'QUERY',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 2,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_protection_level => 'N',
  p_escape_on_http_input => 'Y',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'<p>A group separator is a character that separates integer groups, for example to show thousands and millions.</p>'||unistr('\000a')||
'<p>Any character can be the group separator. The character specified must be single-byte, and the group separator must be different from any other decimal character. The character can be a space, but cannot be a numeric character or any of the following:</p>'||unistr('\000a')||
'<ul class="noIndent">'||unistr('\000a')||
'<li>';

h:=h||'plus (+)</li>'||unistr('\000a')||
'<li>hyphen (-)</li> '||unistr('\000a')||
'<li>less than sign (<)</li>'||unistr('\000a')||
'<li>greater than sign (>)</li> '||unistr('\000a')||
'</ul>';

wwv_flow_api.create_page_item(
  p_id=>1739046210497354943 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_GROUP_SEPARATOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1739045414926354942+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Group Separator',
  p_source=>'apex_application.get_nls_group_separator',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 2,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_protection_level => 'N',
  p_escape_on_http_input => 'Y',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'<p>The decimal character separates the integer and decimal parts of a number.</p>'||unistr('\000a')||
'<p> Any character can be the decimal character. The character specified must be single-byte, and the decimal character must be different from group separator. The character can be a space, but cannot be any numeric character or any of the following characters:</p>'||unistr('\000a')||
'<ul class="noIndent">'||unistr('\000a')||
'<li>plus (+)</li>'||unistr('\000a')||
'<li>hyphen (-';

h:=h||')</li> '||unistr('\000a')||
'<li>less than sign (<)</li>'||unistr('\000a')||
'<li>greater than sign (>)</li> '||unistr('\000a')||
'</ul>';

wwv_flow_api.create_page_item(
  p_id=>1739046691922354944 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_DECIMAL_CHARACTER',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1739045414926354942+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Decimal Character',
  p_source=>'apex_application.get_nls_decimal_separator',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 2,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1020553463326437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_protection_level => 'N',
  p_escape_on_http_input => 'Y',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 1739042892135354939 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Filename is not null',
  p_validation_sequence=> 10,
  p_validation => 'P21_FILE_NAME',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# must have some value.',
  p_always_execute=>'N',
  p_validation_condition=> 'P21_IMPORT_FROM',
  p_validation_condition2=> 'UPLOAD',
  p_validation_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_when_button_pressed=> 1739041899842354935 + wwv_flow_api.g_id_offset,
  p_associated_item=> 1739042312423354938 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 1739047119582354944 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 21
 ,p_name => 'Hide / Show Copy and Paste or Filename'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P21_IMPORT_FROM'
 ,p_triggering_condition_type => 'EQUALS'
 ,p_triggering_expression => 'PASTE'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 1739047392117354945 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 21
 ,p_event_id => 1739047119582354944 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_SHOW'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P21_COPY_PASTE'
 ,p_attribute_01 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1361067176673940607 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 21
 ,p_event_id => 1739047119582354944 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_HIDE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P21_FILE_NAME'
 ,p_attribute_01 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1739047605998354945 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 21
 ,p_event_id => 1739047119582354944 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_HIDE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P21_COPY_PASTE'
 ,p_attribute_01 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1361067505344942567 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 21
 ,p_event_id => 1739047119582354944 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_SHOW'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P21_FILE_NAME'
 ,p_attribute_01 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 987693873056060766 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 21
 ,p_name => 'Paste Sample Data'
 ,p_event_sequence => 20
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 987693452624054880 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 987694174518060768 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 21
 ,p_event_id => 987693873056060766 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'set_item();'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p := null;
wwv_flow_api.create_page_process(
  p_id     => 1739048408283354947 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'NATIVE_PARSE_UPLOADED_DATA',
  p_process_name=> 'Parse Uploaded Data',
  p_process_sql_clob => p,
  p_attribute_01=> 987544352493695241 + wwv_flow_api.g_id_offset,
  p_attribute_02=> 'P21_IMPORT_FROM',
  p_attribute_03=> 'P21_SEPARATOR',
  p_attribute_04=> 'P21_ENCLOSED_BY',
  p_attribute_05=> 'P21_FIRST_ROW',
  p_attribute_06=> 'P21_CURRENCY',
  p_attribute_07=> 'P21_GROUP_SEPARATOR',
  p_attribute_08=> 'P21_DECIMAL_CHARACTER',
  p_attribute_09=> 'P21_FILE_NAME',
  p_attribute_10=> 'P21_COPY_PASTE',
  p_attribute_11=> 'P21_CHAR_SET',
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>1739041899842354935 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 21
--
 
begin
 
null;
end;
null;
 
end;
/

 
