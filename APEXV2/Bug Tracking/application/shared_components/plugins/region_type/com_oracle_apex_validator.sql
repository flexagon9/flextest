prompt --application/shared_components/plugins/region_type/com_oracle_apex_validator
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2723088941079474053)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.VALIDATOR'
,p_display_name=>'Content Validator'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.VALIDATOR'),'')
,p_javascript_file_urls=>'#PLUGIN_FILES#content_validator.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validator_render (',
'  p_region              in apex_plugin.t_region,',
'  p_plugin              in apex_plugin.t_plugin,',
'  p_is_printer_friendly in boolean',
') ',
'',
'  return apex_plugin.t_region_render_result',
'',
'is',
'',
'  c_validated_by_col      constant pls_integer := 1;',
'  c_created_col           constant pls_integer := 2;',
'  c_success               constant varchar2(30) := ''success'';',
'  c_warning               constant varchar2(30) := ''warning'';',
'  c_expired               constant varchar2(30) := ''danger'';',
'  l_region_link           varchar2(4000);',
'  l_prev_validations_link varchar2(4000);',
'  l_valid_data_type_list  wwv_flow_global.vc_arr2;',
'  l_column_value_list     apex_plugin_util.t_column_value_list2;',
'  l_status                varchar2(30);',
'  l_validated_by          varchar2(300);',
'  l_created               timestamp with local time zone;',
'  l_message               varchar2(4000);',
'  l_onload_code           varchar2(4000);',
'  l_lf                    varchar2(1) := chr(10);',
'',
'begin',
'',
'  -- Define the valid column data types for the region query',
'  l_valid_data_type_list(c_validated_by_col) := apex_plugin_util.c_data_type_varchar2;',
'  l_valid_data_type_list(c_created_col) := apex_plugin_util.c_data_type_timestamp_ltz;',
'',
'  l_region_link := apex_util.prepare_url(p_region.attribute_01);',
'',
'  -- Prepare URL would have converted the URL to a JS function call if the target',
'  -- page is a dialog. If not, we''ll do that manually.',
'  if instr(l_region_link, ''javascript:'') = 0',
'  then',
'    l_region_link := ''apex.navigation.redirect('''''' || l_region_link || '''''');'';',
'  end if;',
'',
'  if p_region.attribute_02 is not null',
'  then',
'    l_prev_validations_link := apex_util.prepare_url(p_region.attribute_02);',
'  end if;',
'',
'  -- Prepare URL would have converted the URL to a JS function call if the target',
'  -- page is a dialog. If not, we''ll do that manually.',
'  if l_prev_validations_link is not null',
'    and instr(l_prev_validations_link, ''javascript:'') = 0',
'  then',
'    l_prev_validations_link := ''apex.navigation.redirect('''''' || l_prev_validations_link || '''''');'';',
'  end if;',
'',
'  -- get the data to be displayed',
'  l_column_value_list := apex_plugin_util.get_data2(',
'    p_sql_statement  => p_region.source,',
'    p_min_columns    => 2,',
'    p_max_columns    => 2,',
'    p_data_type_list => l_valid_data_type_list,',
'    p_component_name => p_region.name',
'  );',
'',
'  if l_column_value_list(c_created_col).value_list.count = 0',
'  then',
'    l_status := c_expired;',
'    l_validated_by := ''Unvalidated'';',
'  else',
'    -- Get the most recent verification data for display',
'    l_validated_by := apex_escape.html(lower(l_column_value_list(c_validated_by_col).value_list(1).varchar2_value));',
'    l_created := l_column_value_list(c_created_col).value_list(1).timestamp_ltz_value;',
'',
'    if l_created > localtimestamp - interval ''7'' day',
'    then',
'      l_status := c_success;',
'    else',
'      l_status := c_warning;',
'    end if;',
'  end if;',
'',
'  sys.htp.p(''<div class="t-Validation">'');',
'',
'  sys.htp.p(''<div class="t-Validation-icon">'');',
'    sys.htp.p(''<span class="a-Icon icon-'' || ',
'      case l_status ',
'        when c_success then ''check''',
'        when c_warning then ''warning''',
'        else ''remove''',
'      end || '' u-'' || l_status || ''"></span>''',
'    );',
'  sys.htp.p(''</div>'');',
'  sys.htp.p(''<div class="t-Validation-body">'');',
'    sys.htp.p(''<span class="t-Validation-date">'' || apex_util.get_since_tswltz(l_created) || ''</span>'');',
'    sys.htp.p(''<span class="t-Validation-user">'' || l_validated_by || ''</span>'');',
'    sys.htp.p(''<span class="t-Validation-actions">'');',
'    sys.htp.prn(''<button class="t-Button t-Button--pill t-Button--pillStart" '' || ',
'      ''onclick="'' || l_region_link || ''" type="button">Validate</button>''',
'    );',
'',
'    if l_prev_validations_link is not null',
'    then',
'      sys.htp.p(''<button class="t-Button t-Button--pill t-Button--pillEnd t-Button--icon t-Button--slim" '' || ',
'        ''title="View Previous Validations" '' ||',
'        ''onclick="'' || l_prev_validations_link || ''" type="button">'' || ',
'        ''<span class="a-Icon icon-open-in-dialog"></span></button>''',
'      );',
'    end if;',
'',
'    sys.htp.p(''</span>''); -- actions',
'  sys.htp.p(''</div>''); -- body',
'  sys.htp.p(''</div>''); -- validation',
'  ',
'  l_onload_code := ''apex.jQuery("#'' || p_region.static_id || ''").content_validator({ '' || l_lf ||',
'      ''   '' || apex_javascript.add_attribute(''ajaxIdentifier'', apex_plugin.get_ajax_identifier(), false, true) || l_lf ||',
'      ''});'';',
'  ',
'  apex_javascript.add_onload_code (',
'    p_code => l_onload_code',
'  );',
'',
'  return null;',
'',
'end validator_render;',
'',
'function validator_ajax (',
'  p_region in apex_plugin.t_region,',
'  p_plugin in apex_plugin.t_plugin',
')',
'',
'  return apex_plugin.t_region_ajax_result',
'',
'is',
'',
'  c_validated_by_col     constant pls_integer := 1;',
'  c_created_col          constant pls_integer := 2;',
'  l_ajax_result          apex_plugin.t_region_ajax_result;',
'  l_valid_data_type_list wwv_flow_global.vc_arr2;',
'  l_column_value_list    apex_plugin_util.t_column_value_list2;',
'',
'begin',
'',
'  l_valid_data_type_list(c_validated_by_col) := apex_plugin_util.c_data_type_varchar2;',
'  l_valid_data_type_list(c_created_col) := apex_plugin_util.c_data_type_timestamp_ltz;',
'',
'  l_column_value_list := apex_plugin_util.get_data2(',
'    p_sql_statement  => p_region.source,',
'    p_min_columns    => 2,',
'    p_max_columns    => 2,',
'    p_data_type_list => l_valid_data_type_list,',
'    p_component_name => p_region.name',
'  );',
'',
'  apex_json.open_object;',
'',
'  if l_column_value_list(c_created_col).value_list.count = 0 ',
'  then',
'    apex_json.write(''validated'', false);',
'    apex_json.write(''validatedBy'', ''Unvalidated'');',
'  else',
'    apex_json.write(''validated'', apex_util.get_since_tswltz(l_column_value_list(c_created_col).value_list(1).timestamp_ltz_value));',
'    apex_json.write(''validatedBy'', apex_escape.html(l_column_value_list(c_validated_by_col).value_list(1).varchar2_value));',
'    apex_json.write(''expired'', l_column_value_list(c_created_col).value_list(1).timestamp_ltz_value < localtimestamp - interval ''7'' day);',
'  end if;',
'',
'  apex_json.close_object;',
'',
'  return l_ajax_result;',
'',
'end validator_ajax;'))
,p_api_version=>1
,p_render_function=>'validator_render'
,p_ajax_function=>'validator_ajax'
,p_standard_attributes=>'SOURCE_SQL'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'	This plugin displays when the page content was last validated and who validated the content. To implement this plugin correctly you will need to also do the following 3 things:</p>',
'<ol>',
'  <li>Create a modal region on the page that has this plugin that does a report of past validations.</li>',
'  <li>Create a validation page. This is a form that captures validation text entered by the end-user who is validating the content.</li>',
'  <li>Create a button in the region that takes the user to the validation page (described above).</li>',
'</ol>'))
,p_version_identifier=>'5.0.1'
,p_files_version=>13
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(597420941623781739)
,p_plugin_id=>wwv_flow_api.id(2723088941079474053)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Validation Link'
,p_attribute_type=>'LINK'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Enter a target page to be called when the user clicks the <strong>Validate</strong> button.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(597421428710781740)
,p_plugin_id=>wwv_flow_api.id(2723088941079474053)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Previous Validations Link'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(855234394805774517)
,p_plugin_id=>wwv_flow_api.id(2723088941079474053)
,p_name=>'SOURCE_SQL'
,p_is_required=>false
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    verified_by,',
'    to_char(created,''DD-MON-YYYY HH.MI.SS.FF PM'') as created',
'from',
'    your_content_validation_table ',
'where',
'    primary_key_column = :P###_ID',
'order by',
'    created desc',
''))
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2866756E6374696F6E2824297B0A2020242E7769646765742822617065782E636F6E74656E745F76616C696461746F72222C207B0A202020206F7074696F6E733A207B0A2020202020202020616A61784964656E7469666965723A206E756C6C2C0A2020';
wwv_flow_api.g_varchar2_table(2) := '202020202020657870697279446179733A206E756C6C0A202020207D2C0A202020205F6372656174653A2066756E6374696F6E2829207B0A20202020202020207661722073656C66203D20746869733B0A0A202020202020202073656C662E5F6A714D61';
wwv_flow_api.g_varchar2_table(3) := '70203D207B7D3B0A202020202020202073656C662E5F6A714D61702E77726170706572203D2073656C662E656C656D656E742E66696E6428272E742D56616C69646174696F6E27293B0A202020202020202073656C662E5F6A714D61702E75736572203D';
wwv_flow_api.g_varchar2_table(4) := '2073656C662E656C656D656E742E66696E6428272E742D56616C69646174696F6E2D7573657227293B0A202020202020202073656C662E5F6A714D61702E64617465203D2073656C662E656C656D656E742E66696E6428272E742D56616C69646174696F';
wwv_flow_api.g_varchar2_table(5) := '6E2D6461746527293B0A202020202020202073656C662E5F6A714D61702E69636F6E203D2073656C662E656C656D656E742E66696E6428272E742D56616C69646174696F6E2D69636F6E27292E66696E6428272E612D49636F6E27293B0A0A2020202020';
wwv_flow_api.g_varchar2_table(6) := '20202073656C662E656C656D656E742E6F6E28276170657872656672657368272C2066756E6374696F6E2829207B0A2020202020202020202073656C662E5F726566726573682E63616C6C2873656C662C2074686973293B0A20202020202020207D293B';
wwv_flow_api.g_varchar2_table(7) := '0A202020207D2C0A202020205F726566726573683A2066756E6374696F6E286576656E7429207B0A2020202020207661722073656C66203D20746869733B0A0A20202020202073656C662E656C656D656E742E747269676765722827617065786265666F';
wwv_flow_api.g_varchar2_table(8) := '72657265667265736827293B0A0A202020202020617065782E7365727665722E706C7567696E280A202020202020202073656C662E6F7074696F6E732E616A61784964656E7469666965722C0A20202020202020207B7D2C0A20202020202020207B0A20';
wwv_flow_api.g_varchar2_table(9) := '202020202020202020737563636573733A2066756E6374696F6E286461746129207B0A20202020202020202020202073656C662E5F6A714D61702E757365722E7465787428646174612E76616C6964617465644279293B0A0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(10) := '2069662028646174612E76616C69646174656429207B0A202020202020202020202020202073656C662E5F6A714D61702E646174652E7465787428646174612E76616C696461746564293B0A0A202020202020202020202020202069662028646174612E';
wwv_flow_api.g_varchar2_table(11) := '6578706972656429207B0A2020202020202020202020202020202073656C662E5F6A714D61702E69636F6E0A2020202020202020202020202020202020202E72656D6F7665436C6173732827752D7375636365737320752D64616E67657227290A202020';
wwv_flow_api.g_varchar2_table(12) := '2020202020202020202020202020202E616464436C6173732827752D7761726E696E6727293B0A2020202020202020202020202020202073656C662E5F6A714D61702E69636F6E0A2020202020202020202020202020202020202E72656D6F7665436C61';
wwv_flow_api.g_varchar2_table(13) := '7373282769636F6E2D636865636B2069636F6E2D72656D6F766527290A2020202020202020202020202020202020202E616464436C617373282769636F6E2D7761726E696E6727293B0A20202020202020202020202020207D20656C7365207B0A202020';
wwv_flow_api.g_varchar2_table(14) := '2020202020202020202020202073656C662E5F6A714D61702E69636F6E0A2020202020202020202020202020202020202E72656D6F7665436C6173732827752D7761726E696E6720752D64616E67657227290A2020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(15) := '202E616464436C6173732827752D7375636365737327293B0A0A2020202020202020202020202020202073656C662E5F6A714D61702E69636F6E0A2020202020202020202020202020202020202E72656D6F7665436C617373282769636F6E2D7761726E';
wwv_flow_api.g_varchar2_table(16) := '696E672069636F6E2D72656D6F766527290A2020202020202020202020202020202020202E616464436C617373282769636F6E2D636865636B27293B0A20202020202020202020202020207D0A2020202020202020202020207D20656C7365207B0A2020';
wwv_flow_api.g_varchar2_table(17) := '20202020202020202020202073656C662E5F6A714D61702E646174652E74657874282727293B0A0A202020202020202020202020202073656C662E5F6A714D61702E69636F6E0A202020202020202020202020202020202E72656D6F7665436C61737328';
wwv_flow_api.g_varchar2_table(18) := '27752D7375636365737320752D7761726E696E6727290A202020202020202020202020202020202E616464436C6173732827752D64616E67657227293B0A0A202020202020202020202020202073656C662E5F6A714D61702E69636F6E0A202020202020';
wwv_flow_api.g_varchar2_table(19) := '202020202020202020202E72656D6F7665436C617373282769636F6E2D636865636B2069636F6E2D7761726E696E6727290A202020202020202020202020202020202E616464436C617373282769636F6E2D72656D6F766527293B0A2020202020202020';
wwv_flow_api.g_varchar2_table(20) := '202020207D0A0A20202020202020202020202073656C662E656C656D656E742E7472696767657228276170657861667465727265667265736827293B0A202020202020202020207D0A20202020202020207D0A202020202020293B0A202020207D0A2020';
wwv_flow_api.g_varchar2_table(21) := '7D293B0A7D2928617065782E6A5175657279293B0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(597422369343781742)
,p_plugin_id=>wwv_flow_api.id(2723088941079474053)
,p_file_name=>'content_validator.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
