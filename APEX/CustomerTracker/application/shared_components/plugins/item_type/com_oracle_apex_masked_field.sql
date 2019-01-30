--application/shared_components/plugins/item_type/com_oracle_apex_masked_field
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 10268897391003185930 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'COM.ORACLE.APEX.MASKED_FIELD'
 ,p_display_name => 'Masked Field v 1.0'
 ,p_supported_ui_types => 'DESKTOP:JQM_SMARTPHONE'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'function render_masked_field ('||unistr('\000a')||
'    p_item                in apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin              in apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value               in varchar2,'||unistr('\000a')||
'    p_is_readonly         in boolean,'||unistr('\000a')||
'    p_is_printer_friendly in boolean )'||unistr('\000a')||
'    return apex_plugin.t_page_item_render_result'||unistr('\000a')||
'is'||unistr('\000a')||
'    -- It''s better to have named variables instead of using the generic ones,'||unistr('\000a')||
'    -- makes the c'||
'ode more readable'||unistr('\000a')||
'    l_input_mask  apex_application_page_items.attribute_01%type := p_item.attribute_01;'||unistr('\000a')||
'    l_placeholder apex_application_page_items.attribute_01%type := nvl(p_item.attribute_02, ''_'');'||unistr('\000a')||
''||unistr('\000a')||
'    l_name        varchar2(30);'||unistr('\000a')||
'    l_result      apex_plugin.t_page_item_render_result;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    if p_is_readonly or p_is_printer_friendly then'||unistr('\000a')||
'        -- emit hidden field if necessary'||unistr('\000a')||
'       '||
' apex_plugin_util.print_hidden_if_readonly ('||unistr('\000a')||
'            p_item_name           => p_item.name,'||unistr('\000a')||
'            p_value               => p_value,'||unistr('\000a')||
'            p_is_readonly         => p_is_readonly,'||unistr('\000a')||
'            p_is_printer_friendly => p_is_printer_friendly );'||unistr('\000a')||
'        -- emit display span with the value'||unistr('\000a')||
'        apex_plugin_util.print_display_only ('||unistr('\000a')||
'            p_item_name        => p_item.name,'||unistr('\000a')||
'        '||
'    p_display_value    => p_value,'||unistr('\000a')||
'            p_show_line_breaks => false,'||unistr('\000a')||
'            p_escape           => true,'||unistr('\000a')||
'            p_attributes       => p_item.element_attributes );'||unistr('\000a')||
'    else'||unistr('\000a')||
'        -- Because the page item saves state, we have to call get_input_name_for_page_item'||unistr('\000a')||
'        -- which generates the internal hidden p_arg_names field. It will also return the'||unistr('\000a')||
'        -- HTML field name whic'||
'h we have to use when we render the HTML input field.'||unistr('\000a')||
'        l_name := apex_plugin.get_input_name_for_page_item(false);'||unistr('\000a')||
'        sys.htp.p(''<input type="text" name="''||l_name||''" id="''||p_item.name||''" ''||'||unistr('\000a')||
'                  ''value="''||apex_escape.html(p_value)||''" size="''||p_item.element_width||''" ''||'||unistr('\000a')||
'                  ''maxlength="''||p_item.element_max_length||''" ''||'||unistr('\000a')||
'                  coalesce(p_i'||
'tem.element_attributes, ''class="masked_text_field"'')||'' />'');'||unistr('\000a')||
''||unistr('\000a')||
'        -- Register the javascript library the plug-in uses.'||unistr('\000a')||
'        apex_javascript.add_library ('||unistr('\000a')||
'            p_name      => ''apex.jquery.maskedinput-1.2.2.min'','||unistr('\000a')||
'            p_directory => p_plugin.file_prefix,'||unistr('\000a')||
'            p_version   => null );'||unistr('\000a')||
''||unistr('\000a')||
'        -- Initialize the mask for the page item when the page has been rendered.'||unistr('\000a')||
'       '||
' -- apex_javascript.add_value and add_attribute are used to make sure that'||unistr('\000a')||
'        -- the values are properly escaped.   '||unistr('\000a')||
'        apex_javascript.add_onload_code ('||unistr('\000a')||
'            p_code => ''apex.jQuery("#''||p_item.name||''").mask(''||'||unistr('\000a')||
'                      apex_javascript.add_value(l_input_mask)||'||unistr('\000a')||
'                      ''{''||apex_javascript.add_attribute(''placeholder'', l_placeholder, true, false)||''});'''||
' );'||unistr('\000a')||
''||unistr('\000a')||
'        -- Tell APEX that this field is navigable'||unistr('\000a')||
'        l_result.is_navigable := true;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    return l_result;'||unistr('\000a')||
'end render_masked_field;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'function validate_masked_field ('||unistr('\000a')||
'    p_item   in     apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin in     apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value  in     varchar2 )'||unistr('\000a')||
'    return apex_plugin.t_page_item_validation_result'||unistr('\000a')||
'is'||unistr('\000a')||
'    -- It''s better to have a named vari'||
'able instead of using the generic ones,'||unistr('\000a')||
'    -- makes the code more readable'||unistr('\000a')||
'    l_input_mask       apex_application_page_items.attribute_01%type := p_item.attribute_01;'||unistr('\000a')||
'    '||unistr('\000a')||
'    l_allowed_char_pos pls_integer;'||unistr('\000a')||
'    l_allowed_char     varchar2(1);'||unistr('\000a')||
'    l_current_char     varchar2(1);'||unistr('\000a')||
'    l_is_valid         boolean;'||unistr('\000a')||
'    l_result           apex_plugin.t_page_item_validation_result;    '||unistr('\000a')||
'begin'||unistr('\000a')||
'    if p_v'||
'alue is null then return null; end if;'||unistr('\000a')||
'    '||unistr('\000a')||
'    -- The first check is to make sure that the entered value is really as long'||unistr('\000a')||
'    -- as the input mask. If the input mask contains the ? for optional input,'||unistr('\000a')||
'    -- we just use the values before that, otherwise the entered value has to'||unistr('\000a')||
'    -- match the length of the input mask.'||unistr('\000a')||
'    if l_input_mask like ''%?%'' then'||unistr('\000a')||
'        l_is_valid := (length(p_value) >'||
'= instr(l_input_mask, ''?'')-1 and length(p_value) < length(l_input_mask));'||unistr('\000a')||
'    else'||unistr('\000a')||
'        l_is_valid := (length(p_value) = length(l_input_mask));'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'    if l_is_valid then'||unistr('\000a')||
'        -- Check for each char in the entered value that it complies with the'||unistr('\000a')||
'        -- corresponding mask definition in the input mask'||unistr('\000a')||
'        l_allowed_char_pos := 0;'||unistr('\000a')||
'        for i in 1 .. length(p_value)'||unistr('\000a')||
'        l'||
'oop'||unistr('\000a')||
'            l_allowed_char_pos := l_allowed_char_pos+1;'||unistr('\000a')||
'            -- skip the "?" mask definition'||unistr('\000a')||
'            if substr(l_input_mask, l_allowed_char_pos, 1) = ''?'' then'||unistr('\000a')||
'                l_allowed_char_pos := l_allowed_char_pos+1;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            l_allowed_char := substr(l_input_mask, l_allowed_char_pos, 1);'||unistr('\000a')||
'            l_current_char := substr(p_value, i, 1);'||unistr('\000a')||
'            l_is_v'||
'alid     :='||unistr('\000a')||
'                case l_allowed_char'||unistr('\000a')||
'                  when ''a'' /* A-Z,a-z */     then (l_current_char between ''A'' and ''Z'' or l_current_char between ''a'' and ''z'')'||unistr('\000a')||
'                  when ''9'' /* 0-9 */         then (l_current_char between ''0'' and ''9'')'||unistr('\000a')||
'                  when ''*'' /* A-Z,a-z,0-9 */ then (l_current_char between ''A'' and ''Z'' or l_current_char between ''a'' and ''z'' or l_current_cha'||
'r between ''0'' and ''9'')'||unistr('\000a')||
'                  else     /* filler */           (l_current_char = l_allowed_char)'||unistr('\000a')||
'                end;'||unistr('\000a')||
'            -- if there is an error we can terminate the loop immediately '||unistr('\000a')||
'            if not l_is_valid then exit; end if;'||unistr('\000a')||
'        end loop;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    -- Do we have to return an error message?'||unistr('\000a')||
'    if not l_is_valid then'||unistr('\000a')||
'        l_result.message := ''Value doesn''''t c'||
'omply with the input mask!'';'||unistr('\000a')||
'        -- We can leave l_result.display_location blank, in that case the default'||unistr('\000a')||
'        -- setting of the plug-in will be used -> that should be the default case'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    return l_result;'||unistr('\000a')||
'end validate_masked_field;'
 ,p_render_function => 'render_masked_field'
 ,p_validation_function => 'validate_masked_field'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:READONLY:SOURCE:ELEMENT:WIDTH:ENCRYPT'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<p>'||unistr('\000a')||
'	This plug-in allows a user to easily enter fixed width, formatted data (e.g. dates, phone numbers, SSN).</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	A mask is defined as a format made up of literals and mask definitions. Any character not in the definitions list below is considered a mask literal and can&rsquo;t be modified by the user.<br />'||unistr('\000a')||
'	<br />'||unistr('\000a')||
'	For example a mask of &quot;(999) 999-9999&quot; with a placeholder of &quot;#&quot; will be displayed to the user as &quot;(###) ###-####&quot;. As the user types in the value, the hashes will be replaced by the numbers entered and the parenthesis, space, and dash will remain untouched. See help text of<br />'||unistr('\000a')||
'	attribute &quot;Input Mask&quot; for valid mask definitions.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	The plug-in is based on the jQuery Masked Input Field v1.2.2 plug-in (<a href="http://digitalbush.com/projects/masked-input-plugin/">http://digitalbush.com/projects/masked-input-plugin/</a>)</p>'||unistr('\000a')||
''
 ,p_version_identifier => '1.0'
 ,p_about_url => 'http://apex.oracle.com/plugins/'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 10268898996244215856 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10268897391003185930 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Input Mask'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => '(999) 999-9999'
 ,p_display_length => 40
 ,p_max_length => 40
 ,p_is_translatable => false
 ,p_help_text => 'An input mask is defined by a format made up of mask literals and mask definitions. Any character not in the definitions list'||unistr('\000a')||
'below is considered a mask literal and cannot be modified by the user. For example a mask of "(999) 999-9999" with a placeholder of "#" will be displayed to the user as "(###) ###-####". As the user types in the value, the hashes will be replaced by the numbers entered and the parenthesis, space, and dash will remain untouched.'||unistr('\000a')||
' '||unistr('\000a')||
'The following mask definitions are predefined:'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li>a - Represents an alpha character (A-Z,a-z)</li>'||unistr('\000a')||
'<li>9 - Represents a numeric character (0-9)</li>'||unistr('\000a')||
'<li>* - Represents an alphanumeric character (A-Z,a-z,0-9)</li>'||unistr('\000a')||
'<li>? - Anything listed after "?" within the mask is considered optional user input. A common example for this is phone number + optional extension. The mask for that would be "(999) 999-9999? x999999"</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
''
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 10268899691873223997 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10268897391003185930 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Placeholder'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => '_'
 ,p_display_length => 1
 ,p_max_length => 1
 ,p_is_translatable => false
 ,p_help_text => 'The placeholder is displayed for all enterable characters (mask definitions) in the input field.'
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0D0A094D61736B656420496E70757420706C7567696E20666F72206A51756572790D0A09436F707972696768742028632920323030372D32303039204A6F7368204275736820286469676974616C627573682E636F6D290D0A094C6963656E736564';
wwv_flow_api.g_varchar2_table(2) := '20756E64657220746865204D4954206C6963656E73652028687474703A2F2F6469676974616C627573682E636F6D2F70726F6A656374732F6D61736B65642D696E7075742D706C7567696E2F236C6963656E736529200D0A0956657273696F6E3A20312E';
wwv_flow_api.g_varchar2_table(3) := '322E32202830332F30392F323030392032323A33393A3036290D0A2A2F0D0A2866756E6374696F6E2861297B76617220633D28612E62726F777365722E6D7369653F227061737465223A22696E70757422292B222E6D61736B223B76617220623D287769';
wwv_flow_api.g_varchar2_table(4) := '6E646F772E6F7269656E746174696F6E213D756E646566696E6564293B612E6D61736B3D7B646566696E6974696F6E733A7B2239223A225B302D395D222C613A225B412D5A612D7A5D222C222A223A225B412D5A612D7A302D395D227D7D3B612E666E2E';
wwv_flow_api.g_varchar2_table(5) := '657874656E64287B63617265743A66756E6374696F6E28652C66297B696628746869732E6C656E6774683D3D30297B72657475726E7D696628747970656F6620653D3D226E756D62657222297B663D28747970656F6620663D3D226E756D62657222293F';
wwv_flow_api.g_varchar2_table(6) := '663A653B72657475726E20746869732E656163682866756E6374696F6E28297B696628746869732E73657453656C656374696F6E52616E6765297B746869732E666F63757328293B746869732E73657453656C656374696F6E52616E676528652C66297D';
wwv_flow_api.g_varchar2_table(7) := '656C73657B696628746869732E6372656174655465787452616E6765297B76617220673D746869732E6372656174655465787452616E676528293B672E636F6C6C617073652874727565293B672E6D6F7665456E642822636861726163746572222C6629';
wwv_flow_api.g_varchar2_table(8) := '3B672E6D6F766553746172742822636861726163746572222C65293B672E73656C65637428297D7D7D297D656C73657B696628746869735B305D2E73657453656C656374696F6E52616E6765297B653D746869735B305D2E73656C656374696F6E537461';
wwv_flow_api.g_varchar2_table(9) := '72743B663D746869735B305D2E73656C656374696F6E456E647D656C73657B696628646F63756D656E742E73656C656374696F6E2626646F63756D656E742E73656C656374696F6E2E63726561746552616E6765297B76617220643D646F63756D656E74';
wwv_flow_api.g_varchar2_table(10) := '2E73656C656374696F6E2E63726561746552616E676528293B653D302D642E6475706C696361746528292E6D6F766553746172742822636861726163746572222C2D313030303030293B663D652B642E746578742E6C656E6774687D7D72657475726E7B';
wwv_flow_api.g_varchar2_table(11) := '626567696E3A652C656E643A667D7D7D2C756E6D61736B3A66756E6374696F6E28297B72657475726E20746869732E747269676765722822756E6D61736B22297D2C6D61736B3A66756E6374696F6E286A2C64297B696628216A2626746869732E6C656E';
wwv_flow_api.g_varchar2_table(12) := '6774683E30297B76617220663D6128746869735B305D293B76617220673D662E646174612822746573747322293B72657475726E20612E6D617028662E64617461282262756666657222292C66756E6374696F6E286C2C6D297B72657475726E20675B6D';
wwv_flow_api.g_varchar2_table(13) := '5D3F6C3A6E756C6C7D292E6A6F696E282222297D643D612E657874656E64287B706C616365686F6C6465723A225F222C636F6D706C657465643A6E756C6C7D2C64293B766172206B3D612E6D61736B2E646566696E6974696F6E733B76617220673D5B5D';
wwv_flow_api.g_varchar2_table(14) := '3B76617220653D6A2E6C656E6774683B76617220693D6E756C6C3B76617220683D6A2E6C656E6774683B612E65616368286A2E73706C6974282222292C66756E6374696F6E286D2C6C297B6966286C3D3D223F22297B682D2D3B653D6D7D656C73657B69';
wwv_flow_api.g_varchar2_table(15) := '66286B5B6C5D297B672E70757368286E657720526567457870286B5B6C5D29293B696628693D3D6E756C6C297B693D672E6C656E6774682D317D7D656C73657B672E70757368286E756C6C297D7D7D293B72657475726E20746869732E65616368286675';
wwv_flow_api.g_varchar2_table(16) := '6E6374696F6E28297B76617220723D612874686973293B766172206D3D612E6D6170286A2E73706C6974282222292C66756E6374696F6E28782C79297B69662878213D223F22297B72657475726E206B5B785D3F642E706C616365686F6C6465723A787D';
wwv_flow_api.g_varchar2_table(17) := '7D293B766172206E3D66616C73653B76617220713D722E76616C28293B722E646174612822627566666572222C6D292E6461746128227465737473222C67293B66756E6374696F6E20762878297B7768696C65282B2B783C3D68262621675B785D297B7D';
wwv_flow_api.g_varchar2_table(18) := '72657475726E20787D66756E6374696F6E20742878297B7768696C652821675B785D26262D2D783E3D30297B7D666F722876617220793D783B793C683B792B2B297B696628675B795D297B6D5B795D3D642E706C616365686F6C6465723B766172207A3D';
wwv_flow_api.g_varchar2_table(19) := '762879293B6966287A3C682626675B795D2E74657374286D5B7A5D29297B6D5B795D3D6D5B7A5D7D656C73657B627265616B7D7D7D7328293B722E6361726574284D6174682E6D617828692C7829297D66756E6374696F6E20752879297B666F72287661';
wwv_flow_api.g_varchar2_table(20) := '7220413D792C7A3D642E706C616365686F6C6465723B413C683B412B2B297B696628675B415D297B76617220423D762841293B76617220783D6D5B415D3B6D5B415D3D7A3B696628423C682626675B425D2E74657374287829297B7A3D787D656C73657B';
wwv_flow_api.g_varchar2_table(21) := '627265616B7D7D7D7D66756E6374696F6E206C2879297B76617220783D612874686973292E636172657428293B766172207A3D792E6B6579436F64653B6E3D287A3C31367C7C287A3E313626267A3C3332297C7C287A3E333226267A3C343129293B6966';
wwv_flow_api.g_varchar2_table(22) := '2828782E626567696E2D782E656E6429213D30262628216E7C7C7A3D3D387C7C7A3D3D343629297B7728782E626567696E2C782E656E64297D6966287A3D3D387C7C7A3D3D34367C7C286226267A3D3D31323729297B7428782E626567696E2B287A3D3D';
wwv_flow_api.g_varchar2_table(23) := '34363F303A2D3129293B72657475726E2066616C73657D656C73657B6966287A3D3D3237297B722E76616C2871293B722E636172657428302C702829293B72657475726E2066616C73657D7D7D66756E6374696F6E206F2842297B6966286E297B6E3D66';
wwv_flow_api.g_varchar2_table(24) := '616C73653B72657475726E28422E6B6579436F64653D3D38293F66616C73653A6E756C6C7D423D427C7C77696E646F772E6576656E743B76617220433D422E63686172436F64657C7C422E6B6579436F64657C7C422E77686963683B766172207A3D6128';
wwv_flow_api.g_varchar2_table(25) := '74686973292E636172657428293B696628422E6374726C4B65797C7C422E616C744B65797C7C422E6D6574614B6579297B72657475726E20747275657D656C73657B69662828433E3D33322626433C3D313235297C7C433E313836297B76617220783D76';
wwv_flow_api.g_varchar2_table(26) := '287A2E626567696E2D31293B696628783C68297B76617220413D537472696E672E66726F6D43686172436F64652843293B696628675B785D2E74657374284129297B752878293B6D5B785D3D413B7328293B76617220793D762878293B61287468697329';
wwv_flow_api.g_varchar2_table(27) := '2E63617265742879293B696628642E636F6D706C657465642626793D3D68297B642E636F6D706C657465642E63616C6C2872297D7D7D7D7D72657475726E2066616C73657D66756E6374696F6E207728782C79297B666F7228766172207A3D783B7A3C79';
wwv_flow_api.g_varchar2_table(28) := '26267A3C683B7A2B2B297B696628675B7A5D297B6D5B7A5D3D642E706C616365686F6C6465727D7D7D66756E6374696F6E207328297B72657475726E20722E76616C286D2E6A6F696E28222229292E76616C28297D66756E6374696F6E20702879297B76';
wwv_flow_api.g_varchar2_table(29) := '6172207A3D722E76616C28293B76617220433D2D313B666F722876617220423D302C783D303B423C683B422B2B297B696628675B425D297B6D5B425D3D642E706C616365686F6C6465723B7768696C6528782B2B3C7A2E6C656E677468297B7661722041';
wwv_flow_api.g_varchar2_table(30) := '3D7A2E63686172417428782D31293B696628675B425D2E74657374284129297B6D5B425D3D413B433D423B627265616B7D7D696628783E7A2E6C656E677468297B627265616B7D7D656C73657B6966286D5B425D3D3D7A5B785D262642213D65297B782B';
wwv_flow_api.g_varchar2_table(31) := '2B3B433D427D7D7D69662821792626432B313C65297B722E76616C282222293B7728302C68297D656C73657B696628797C7C432B313E3D65297B7328293B6966282179297B722E76616C28722E76616C28292E737562737472696E6728302C432B312929';
wwv_flow_api.g_varchar2_table(32) := '7D7D7D72657475726E28653F423A69297D69662821722E617474722822726561646F6E6C792229297B722E6F6E652822756E6D61736B222C66756E6374696F6E28297B722E756E62696E6428222E6D61736B22292E72656D6F7665446174612822627566';
wwv_flow_api.g_varchar2_table(33) := '66657222292E72656D6F7665446174612822746573747322297D292E62696E642822666F6375732E6D61736B222C66756E6374696F6E28297B713D722E76616C28293B76617220783D7028293B7328293B73657454696D656F75742866756E6374696F6E';
wwv_flow_api.g_varchar2_table(34) := '28297B696628783D3D6A2E6C656E677468297B722E636172657428302C78297D656C73657B722E63617265742878297D7D2C30297D292E62696E642822626C75722E6D61736B222C66756E6374696F6E28297B7028293B696628722E76616C2829213D71';
wwv_flow_api.g_varchar2_table(35) := '297B722E6368616E676528297D7D292E62696E6428226B6579646F776E2E6D61736B222C6C292E62696E6428226B657970726573732E6D61736B222C6F292E62696E6428632C66756E6374696F6E28297B73657454696D656F75742866756E6374696F6E';
wwv_flow_api.g_varchar2_table(36) := '28297B722E63617265742870287472756529297D2C30297D297D7028297D297D7D297D2928617065782E6A5175657279293B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 8589339278263290897 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10268897391003185930 + wwv_flow_api.g_id_offset
 ,p_file_name => 'apex.jquery.maskedinput-1.2.2.min.js'
 ,p_mime_type => 'text/javascript'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

