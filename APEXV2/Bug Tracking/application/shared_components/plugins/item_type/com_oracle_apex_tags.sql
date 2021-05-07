prompt --application/shared_components/plugins/item_type/com_oracle_apex_tags
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(15182924659673329049)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.TAGS'
,p_display_name=>'Tag Entry'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.TAGS'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function format_tags (',
'    p_format_type in varchar2,',
'    p_tags        in varchar2 )',
'    return varchar2',
'is',
'begin',
'    return case p_format_type',
'             when ''NONE''  then p_tags',
'             when ''LOWER'' then lower(p_tags)',
'             when ''UPPER'' then upper(p_tags)',
'           end;',
'end format_tags;',
'',
'',
'--==============================================================================',
'-- Renders the autocomplete item type based on the defined attributes in',
'-- p_item.',
'--==============================================================================',
'function render (',
'    p_item                in apex_plugin.t_page_item,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_value               in varchar2,',
'    p_is_readonly         in boolean,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_page_item_render_result',
'is',
'    -- It''s very important to escape the value and only use that version for the HTML output!',
'    l_escaped_value varchar2(32767);',
'    l_name          varchar2(30);',
'',
'    l_format_type   varchar2(10) := nvl(p_plugin.attribute_01, ''NONE'');',
'    ',
'    l_result        apex_plugin.t_page_item_render_result;',
'begin',
'    l_escaped_value := apex_escape.html (',
'                           format_tags (',
'                               p_format_type => l_format_type,',
'                               p_tags        => p_value ));',
'',
'    -- Based on the flags we normally generate different HTML code, but that',
'    -- depends on the plug-in.',
'    if p_is_readonly or p_is_printer_friendly then',
'        wwv_flow_plugin_util.print_hidden_if_readonly (',
'            p_item_name           => p_item.name,',
'            p_value               => p_value,',
'            p_is_readonly         => p_is_readonly,',
'            p_is_printer_friendly => p_is_printer_friendly );',
'        --',
'        wwv_flow_plugin_util.print_display_only (',
'            p_item_name        => p_item.name,',
'            p_display_value    => l_escaped_value,',
'            p_show_line_breaks => false,',
'            p_escape           => false,',
'            p_attributes       => p_item.element_attributes );',
'    else',
'        -- If a page item saves state, we have to call the get_input_name_for_page_item',
'        -- to render the internal hidden p_arg_names field. It will also return the',
'        -- HTML field name which we have to use when we render the HTML input field.',
'        l_name := apex_plugin.get_input_name_for_page_item(false);',
'',
'        -- render the tags widget',
'        sys.htp.prn (',
'            ''<input type="text" name="''||l_name||''" id="''||p_item.name||''" ''||',
'            ''size="''||p_item.element_width||''" maxlength="''||p_item.element_max_length||''" ''||',
'            coalesce(p_item.element_attributes, ''class="tags" '')||',
'            ''value="''||l_escaped_value||''">'' );',
'',
'        -- Register the javascript library the plug-in uses.',
'        -- The add_library call will make sure that just one instance of the',
'        -- library is loaded when the plug-in is used multiple times on the page.',
'        apex_javascript.add_library (',
'            p_name      => ''apex.jquery.autocomplete.min'',',
'            p_directory => wwv_flow.g_image_prefix||''libraries/jquery-autocomplete/1.1/'',',
'            p_version   => null );',
'',
'        apex_javascript.add_library (',
'            p_name      => ''com_oracle_apex_tags'',',
'            p_directory => p_plugin.file_prefix,',
'            p_version   => null );',
'',
'        apex_javascript.add_onload_code (',
'            p_code => ''com_oracle_apex_tags(''||',
'                          ''"#''||p_item.name||''",''||',
'                          ''{''||',
'                          apex_javascript.add_attribute(''dependingOn'',       apex_plugin_util.page_item_names_to_jquery(p_item.lov_cascade_parent_items))||',
'                          apex_javascript.add_attribute(''optimizeRefresh'',   p_item.ajax_optimize_refresh)||',
'                          apex_javascript.add_attribute(''pageItemsToSubmit'', apex_plugin_util.page_item_names_to_jquery(p_item.ajax_items_to_submit))||',
'                          apex_javascript.add_attribute(''ajaxIdentifier'',    apex_plugin.get_ajax_identifier, false, false)||',
'                          ''});'' );',
'',
'        l_result.is_navigable := true;',
'    end if;',
'    --',
'    return l_result;',
'    --',
'end render;',
'--',
'--',
'--==============================================================================',
'-- Returns the possible values restricted by the value specified in wwv_flow.g_x01.',
'--==============================================================================',
'function ajax (',
'    p_item   in apex_plugin.t_page_item,',
'    p_plugin in apex_plugin.t_plugin )',
'    return apex_plugin.t_page_item_ajax_result',
'is',
'    -- Dynamic attribute mapping',
'    l_search_string     varchar2(32767) := apex_application.g_x01;',
'',
'    l_column_value_list apex_plugin_util.t_column_value_list;',
'    ',
'    l_result            apex_plugin.t_page_item_ajax_result;',
'begin',
'    -- Write header for the output.',
'    sys.owa_util.mime_header(''text/plain'', false);',
'    sys.htp.p(''Cache-Control: no-cache'');',
'    sys.htp.p(''Pragma: no-cache'');',
'    sys.owa_util.http_header_close;',
'',
'    -- Get all data',
'    l_column_value_list := apex_plugin_util.get_data (',
'                               p_sql_statement  => p_item.lov_definition,',
'                               p_min_columns      => 1,',
'                               p_max_columns      => 1,',
'                               p_component_name   => p_item.name,',
'                               p_search_type      => apex_plugin_util.c_search_contains_ignore,',
'                               p_search_column_no => 1,',
'                               p_search_string    => upper(l_search_string),',
'                               p_max_rows         => 10 );',
'',
'    -- Just write each row into a new line. Escaping is done by com_oracle_apex_tags.js',
'    for i in 1 .. l_column_value_list(1).count',
'    loop',
'        sys.htp.p(l_column_value_list(1)(i));',
'    end loop;',
'    --',
'    return l_result;',
'    --',
'exception when others then',
'    sys.htp.p(wwv_flow_lang.system_message(''ajax_server_error'', apex_escape.html(sqlerrm), p_item.name));',
'end ajax;',
'--',
'--',
'--==============================================================================',
'-- Validates the submitted value if it is contained in the list of possible values.',
'--==============================================================================',
'function validate (',
'    p_item   in apex_plugin.t_page_item,',
'    p_plugin in apex_plugin.t_plugin,',
'    p_value  in varchar2 )',
'    return apex_plugin.t_page_item_validation_result',
'is',
'    l_format_type       varchar2(10)   := nvl(p_plugin.attribute_01, ''NONE'');',
'    l_invalid_chars_msg varchar2(4000) := nvl(p_plugin.attribute_02,',
'        ''Tags may not contain the following characters: : ; \ / ? &'');',
'',
'    l_sql_handler       wwv_flow_plugin_util.t_sql_handler;',
'    l_column_value_list apex_plugin_util.t_column_value_list;',
'    l_tag_list          wwv_flow_global.vc_arr2;',
'    l_tag               varchar2(32767);',
'    l_final_tags        varchar2(32767);',
'    l_result            apex_plugin.t_page_item_validation_result := null;',
'begin',
'    -- Check to see if the user has put in invalid characters.',
'    if regexp_like( p_value, ''[:;#\/\\\?\&]'' ) then',
'        l_result.message := apex_lang.lang( l_invalid_chars_msg );',
'        return l_result;',
'    end if;',
'    -- get all tags from our page item value',
'    l_tag_list := wwv_flow_utilities.string_to_table (',
'                      format_tags (',
'                           p_format_type => l_format_type,',
'                           p_tags        => p_value ),',
'                      '','' );',
'',
'    if l_tag_list.count > 0 then',
'        if l_format_type in (''LOWER'', ''UPPER'') then',
'            -- for lower and upper formatting we just clean up the tags from',
'            -- unnecessary spaces, ...',
'            for i in 1 .. l_tag_list.count',
'            loop',
'                l_tag := trim(l_tag_list(i));',
'                if l_tag is not null then',
'                    l_final_tags := l_final_tags ||',
'                                    case when l_final_tags is not null then '', '' end||',
'                                    l_tag;',
'                end if;',
'            end loop;',
'',
'        elsif l_format_type = ''NONE'' then',
'            -- Get the tags in the format as they have already been stored in the tag table',
'',
'            -- We use the more complicated get_sql_handler and prepare_query so that',
'            -- the SQL statement is just parsed once when we search for the different tags',
'            l_sql_handler := apex_plugin_util.get_sql_handler (',
'                                 p_sql_statement  => p_item.lov_definition,',
'                                 p_min_columns    => 1,',
'                                 p_max_columns    => 1,',
'                                 p_component_name => p_item.name );',
'    ',
'            apex_plugin_util.prepare_query (',
'                p_sql_handler      => l_sql_handler,',
'                p_search_type      => apex_plugin_util.c_search_exact_ignore,',
'                p_search_column_no => 1,',
'                p_max_rows         => 1 /* we are just interested in the first hit */',
'                );',
'    ',
'            -- Check each tag with a case insensitive search if it already exists.',
'            -- If we find it we use the existing writing of the tag (for example "ApEx"',
'            -- instead of the entered "apex") for our final tag list. None existing tags',
'            -- are added as they have been entered.',
'            for i in 1 .. l_tag_list.count',
'            loop',
'                l_tag := trim(l_tag_list(i));',
'                if l_tag is not null then',
'                    l_column_value_list := apex_plugin_util.get_data (',
'                                               p_sql_handler      => l_sql_handler,',
'                                               p_search_column_no => 1,',
'                                               p_search_string    => upper(l_tag) );',
'    ',
'                    -- we have found a tag, but make sure that it''s the same tag',
'                    -- because get_data uses a LIKE tag% search and if we enter',
'                    -- "Oracle" we don''t want to replace it with "Oracle APEX".',
'                    if l_column_value_list(1).count = 1 and',
'                       upper(l_column_value_list(1)(1)) = upper(l_tag)',
'                    then',
'                        l_tag := l_column_value_list(1)(1);',
'                    end if;',
'        ',
'                    l_final_tags := l_final_tags ||',
'                                    case when l_final_tags is not null then '', '' end||',
'                                    l_tag;',
'                end if;',
'            end loop;',
'        ',
'            apex_plugin_util.free_sql_handler(l_sql_handler);',
'        end if;',
'    end if;',
'',
'    htmldb_util.set_session_state(p_item.name, l_final_tags);',
'',
'    return null;',
'exception when others then',
'    wwv_flow_plugin_util.free_sql_handler(l_sql_handler);',
'    raise;',
'end validate;'))
,p_api_version=>1
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_validation_function=>'validate'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:READONLY:SOURCE:ELEMENT:WIDTH:ENCRYPT:LOV:CASCADING_LOV'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'Use this item type plug-in to provide auto-completion based on existing tags, and also format the tag entry and prevent invalid characters.'
,p_version_identifier=>'5.0.1'
,p_about_url=>'http://apex.oracle.com/plugins'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2281888947461681820)
,p_plugin_id=>wwv_flow_api.id(15182924659673329049)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Tag Formatting'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'NONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select how the case of the tags should be displayed, and saved.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2281889377137681821)
,p_plugin_attribute_id=>wwv_flow_api.id(2281888947461681820)
,p_display_sequence=>10
,p_display_value=>'None'
,p_return_value=>'NONE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2281889866939681821)
,p_plugin_attribute_id=>wwv_flow_api.id(2281888947461681820)
,p_display_sequence=>20
,p_display_value=>'Lowercase'
,p_return_value=>'LOWER'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2281890400106681821)
,p_plugin_attribute_id=>wwv_flow_api.id(2281888947461681820)
,p_display_sequence=>30
,p_display_value=>'Uppercase'
,p_return_value=>'UPPER'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2281890913197681821)
,p_plugin_id=>wwv_flow_api.id(15182924659673329049)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Validation Failure Message'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Tags may not contain the following characters: : ; \ / ? &'
,p_is_translatable=>true
,p_help_text=>'Enter the validation message displayed when invalid characters are entered.'
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(855234962988774528)
,p_plugin_id=>wwv_flow_api.id(15182924659673329049)
,p_name=>'LOV'
,p_sql_min_column_count=>1
,p_sql_max_column_count=>1
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'<strong>Example 1: Get available tags from tag table</strong>',
'<pre>',
'SELECT tag',
'  FROM your_tag_table',
' ORDER BY 1',
'</pre>',
'</p>',
'',
'<p>',
'<b>Example 2: Use the DISTINCT command if your tag table doesn''t store unique tags.</b>',
'<pre>',
'SELECT DISTINCT tag',
'  from apa$dl_tags',
' ORDER BY 1',
'</pre>',
'</p>',
''))
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E20636F6D5F6F7261636C655F617065785F74616773287053656C6563746F722C20704F7074696F6E7329207B0A0A202076617220674175746F436F6D706C6574653B0A0A20202F2F20436C6561727320746865206578697374696E67';
wwv_flow_api.g_varchar2_table(2) := '2076616C75650A202066756E6374696F6E20726566726573682829207B0A202020202F2F207472696767657220746865206265666F72652072656672657368206576656E740A20202020674175746F436F6D706C6574652E747269676765722827617065';
wwv_flow_api.g_varchar2_table(3) := '786265666F72657265667265736827293B0A0A202020202F2F20436C65617220746865206175746F636F6D706C657465206669656C640A20202020247328674175746F436F6D706C6574655B305D2C202222293B0A0A202020202F2F20636C6561722074';
wwv_flow_api.g_varchar2_table(4) := '6865206175746F20636F6D706C6574652073656C656374206C6973740A20202020674175746F436F6D706C6574652E666C757368436163686528293B0A0A202020202F2F2074726967676572207468652061667465722072656672657368206576656E74';
wwv_flow_api.g_varchar2_table(5) := '0A20202020674175746F436F6D706C6574652E7472696767657228276170657861667465727265667265736827293B0A20207D3B202F2F20726566726573680A0A20202F2F2052657475726E73207468652076616C75652077686963682073686F756C64';
wwv_flow_api.g_varchar2_table(6) := '20626520646973706C6179656420616E64206D616B657320737572650A20202F2F2074686174207370656369616C20636861726163746572732061726520657363617065640A202066756E6374696F6E20666F726D61744974656D28704974656D29207B';
wwv_flow_api.g_varchar2_table(7) := '0A2020202072657475726E20617065782E7574696C2E65736361706548544D4C28704974656D5B305D293B0A20207D3B0A0A20202F2F2052656164732074686520617661696C61626C652074616773206261736564206F6E207468652063757272656E74';
wwv_flow_api.g_varchar2_table(8) := '20656E7472790A202066756E6374696F6E207265747269657665446174612870506172616D657465722C20705375636365737329207B0A202020202F2F206D61702074686520706172616D6574657273206F6620746865206175746F636F6D706C657465';
wwv_flow_api.g_varchar2_table(9) := '20706C75672D696E20746F2074686520415045582073796E7461780A202020202F2F20746865206E61746976652063616C6C6261636B206F662074686520706C7567696E2063616E277420626520757365642C2062656361757365206974206164647320';
wwv_flow_api.g_varchar2_table(10) := '706172616D65746572730A202020202F2F20746F207468652055524C20776869636820415045582F6D6F645F706C73716C2069736E27742061626C6520746F2068616E646C652E0A20202020766172206C44617461203D207B207830313A207050617261';
wwv_flow_api.g_varchar2_table(11) := '6D657465722E712C0A2020202020202020202020202020202020207830323A2070506172616D657465722E74696D657374616D702C0A202020202020202020202020202020202020705F726571756573743A20224E41544956453D222B704F7074696F6E';
wwv_flow_api.g_varchar2_table(12) := '732E616A61784964656E7469666965722C0A202020202020202020202020202020202020705F666C6F775F69643A202476282770466C6F77496427292C0A202020202020202020202020202020202020705F666C6F775F737465705F69643A2024762827';
wwv_flow_api.g_varchar2_table(13) := '70466C6F7753746570496427292C0A202020202020202020202020202020202020705F696E7374616E63653A202476282770496E7374616E636527290A202020202020202020202020202020207D3B0A0A202020202F2F205765206F6E6C792068617665';
wwv_flow_api.g_varchar2_table(14) := '20746F207265616420646174612066726F6D207468652073657276657220696620616C6C206F757220646570656E64696E672076616C75657320617265206E6F74206E756C6C0A2020202069662028704F7074696F6E732E6F7074696D697A6552656672';
wwv_flow_api.g_varchar2_table(15) := '65736829207B0A202020202020766172206C4E756C6C466F756E64203D2066616C73653B0A202020202020617065782E6A517565727928704F7074696F6E732E646570656E64696E674F6E53656C6563746F722B272C272B704F7074696F6E732E706167';
wwv_flow_api.g_varchar2_table(16) := '654974656D73546F5375626D6974292E656163682866756E6374696F6E28297B0A2020202020202020202069662028617065782E6974656D2874686973292E6973456D707479282929207B0A2020202020202020202020206C4E756C6C466F756E64203D';
wwv_flow_api.g_varchar2_table(17) := '20747275653B0A20202020202020202020202072657475726E2066616C73653B202F2F2073746F7020657865637574696F6E206F6620746865206C6F6F700A202020202020202020207D0A20202020202020207D293B0A202020202020696620286C4E75';
wwv_flow_api.g_varchar2_table(18) := '6C6C466F756E6429207B0A202020202020202072657475726E3B202F2F2077652061726520646F6E650A2020202020207D0A202020207D0A0A202020202F2F2061646420616C6C2070616765206974656D732077652061726520646570656E64696E6720';
wwv_flow_api.g_varchar2_table(19) := '6F6E20616E6420746865206F6E6520776520616C77617973206861766520746F207375626D697420746F2074686520414A41582063616C6C0A20202020617065782E6A517565727928704F7074696F6E732E646570656E64696E674F6E53656C6563746F';
wwv_flow_api.g_varchar2_table(20) := '722B272C272B704F7074696F6E732E706167654974656D73546F5375626D6974292E656163682866756E6374696F6E28297B0A202020202020766172206C4964783B0A202020202020696620286C446174612E705F6172675F6E616D65733D3D3D756E64';
wwv_flow_api.g_varchar2_table(21) := '6566696E656429207B0A20202020202020206C446174612E705F6172675F6E616D657320203D205B5D3B0A20202020202020206C446174612E705F6172675F76616C756573203D205B5D3B0A20202020202020206C496478203D20303B0A202020202020';
wwv_flow_api.g_varchar2_table(22) := '7D20656C7365207B0A20202020202020206C496478203D206C446174612E705F6172675F6E616D65732E6C656E6774683B0A2020202020207D0A2020202020206C446174612E705F6172675F6E616D6573205B6C4964785D203D20746869732E69643B0A';
wwv_flow_api.g_varchar2_table(23) := '2020202020206C446174612E705F6172675F76616C7565735B6C4964785D203D2024762874686973293B0A202020207D293B0A0A20202020617065782E6A51756572792E616A6178287B0A2020202020202F2F2074727920746F206C6576657261676520';
wwv_flow_api.g_varchar2_table(24) := '616A6178517565756520706C7567696E20746F2061626F72742070726576696F75732072657175657374730A2020202020206D6F64653A202261626F7274222C0A2020202020202F2F206C696D69742061626F7274696F6E20746F207468697320696E70';
wwv_flow_api.g_varchar2_table(25) := '75740A202020202020706F72743A202274616773222B7053656C6563746F722C0A202020202020747970653A2022706F7374222C0A20202020202075726C3A20227777765F666C6F772E73686F77222C0A202020202020747261646974696F6E616C3A20';
wwv_flow_api.g_varchar2_table(26) := '747275652C0A202020202020646174613A206C446174612C0A202020202020737563636573733A207053756363657373207D293B0A20207D3B0A0A20202F2F20696E697469616C697A6520746865206175746F636F6D706C65746520706C75672D696E0A';
wwv_flow_api.g_varchar2_table(27) := '2020674175746F436F6D706C657465203D20617065782E6A5175657279287053656C6563746F72292E6175746F636F6D706C657465280A20202020202020202020202020202020202020207265747269657665446174612C0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(28) := '2020202020202020207B206175746F46696C6C3A20202020202066616C73652C0A2020202020202020202020202020202020202020202073656C65637446697273743A20202066616C73652C0A202020202020202020202020202020202020202020206D';
wwv_flow_api.g_varchar2_table(29) := '61746368436F6E7461696E733A20747275652C0A20202020202020202020202020202020202020202020666F726D61744974656D3A20202020666F726D61744974656D2C0A202020202020202020202020202020202020202020206D756C7469706C653A';
wwv_flow_api.g_varchar2_table(30) := '202020202020747275652C0A202020202020202020202020202020202020202020206D617463685375627365743A20202066616C73650A20202020202020202020202020202020202020207D293B0A0A20202F2F20696620697427732061206361736361';
wwv_flow_api.g_varchar2_table(31) := '64696E672073656C656374206C697374207765206861766520746F207265676973746572206368616E6765206576656E747320666F72206F7572206D6173746572730A202069662028704F7074696F6E732E646570656E64696E674F6E20213D3D20756E';
wwv_flow_api.g_varchar2_table(32) := '646566696E656429207B0A20202020617065782E6A517565727928704F7074696F6E732E646570656E64696E674F6E292E6368616E67652866756E6374696F6E28297B674175746F436F6D706C6574652E74726967676572282761706578726566726573';
wwv_flow_api.g_varchar2_table(33) := '6827293B7D293B0A20207D0A20202F2F207265676973746572207468652072656672657368206576656E7420776869636820697320747269676765726564206279207472696767657252656672657368206F722061206D616E75616C2072656672657368';
wwv_flow_api.g_varchar2_table(34) := '0A2020674175746F436F6D706C6574652E62696E6428226170657872656672657368222C2072656672657368293B0A0A7D3B202F2F20746167730A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(2281892124637681822)
,p_plugin_id=>wwv_flow_api.id(15182924659673329049)
,p_file_name=>'com_oracle_apex_tags.js'
,p_mime_type=>'application/x-javascript'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
