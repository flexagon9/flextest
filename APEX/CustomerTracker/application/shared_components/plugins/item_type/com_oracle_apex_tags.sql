--application/shared_components/plugins/item_type/com_oracle_apex_tags
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 17494514049056905145 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'COM.ORACLE.APEX.TAGS'
 ,p_display_name => 'Tags'
 ,p_supported_ui_types => 'DESKTOP:JQM_SMARTPHONE'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'function format_tags ('||unistr('\000a')||
'    p_format_type in varchar2,'||unistr('\000a')||
'    p_tags        in varchar2 )'||unistr('\000a')||
'    return varchar2'||unistr('\000a')||
'is'||unistr('\000a')||
'begin'||unistr('\000a')||
'    return case p_format_type'||unistr('\000a')||
'             when ''NONE''  then p_tags'||unistr('\000a')||
'             when ''LOWER'' then lower(p_tags)'||unistr('\000a')||
'             when ''UPPER'' then upper(p_tags)'||unistr('\000a')||
'           end;'||unistr('\000a')||
'end format_tags;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'--=============================================================================='||unistr('\000a')||
'-- Renders '||
'the autocomplete item type based on the defined attributes in'||unistr('\000a')||
'-- p_item.'||unistr('\000a')||
'--=============================================================================='||unistr('\000a')||
'function render ('||unistr('\000a')||
'    p_item                in apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin              in apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value               in varchar2,'||unistr('\000a')||
'    p_is_readonly         in boolean,'||unistr('\000a')||
'    p_is_printer_friendly in boolean )'||unistr('\000a')||
'    ret'||
'urn apex_plugin.t_page_item_render_result'||unistr('\000a')||
'is'||unistr('\000a')||
'    -- It''s very important to escape the value and only use that version for the HTML output!'||unistr('\000a')||
'    l_escaped_value varchar2(32767);'||unistr('\000a')||
'    l_name          varchar2(30);'||unistr('\000a')||
''||unistr('\000a')||
'    l_format_type   varchar2(10) := nvl(p_plugin.attribute_01, ''NONE'');'||unistr('\000a')||
'    '||unistr('\000a')||
'    l_result        apex_plugin.t_page_item_render_result;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    l_escaped_value := apex_escape.html ('||unistr('\000a')||
'     '||
'                      format_tags ('||unistr('\000a')||
'                               p_format_type => l_format_type,'||unistr('\000a')||
'                               p_tags        => p_value ));'||unistr('\000a')||
''||unistr('\000a')||
'    -- Based on the flags we normally generate different HTML code, but that'||unistr('\000a')||
'    -- depends on the plug-in.'||unistr('\000a')||
'    if p_is_readonly or p_is_printer_friendly then'||unistr('\000a')||
'        wwv_flow_plugin_util.print_hidden_if_readonly ('||unistr('\000a')||
'            p_item_name  '||
'         => p_item.name,'||unistr('\000a')||
'            p_value               => p_value,'||unistr('\000a')||
'            p_is_readonly         => p_is_readonly,'||unistr('\000a')||
'            p_is_printer_friendly => p_is_printer_friendly );'||unistr('\000a')||
'        --'||unistr('\000a')||
'        wwv_flow_plugin_util.print_display_only ('||unistr('\000a')||
'            p_item_name        => p_item.name,'||unistr('\000a')||
'            p_display_value    => l_escaped_value,'||unistr('\000a')||
'            p_show_line_breaks => false,'||unistr('\000a')||
'            p_e'||
'scape           => false,'||unistr('\000a')||
'            p_attributes       => p_item.element_attributes );'||unistr('\000a')||
'    else'||unistr('\000a')||
'        -- If a page item saves state, we have to call the get_input_name_for_page_item'||unistr('\000a')||
'        -- to render the internal hidden p_arg_names field. It will also return the'||unistr('\000a')||
'        -- HTML field name which we have to use when we render the HTML input field.'||unistr('\000a')||
'        l_name := apex_plugin.get_input_name_'||
'for_page_item(false);'||unistr('\000a')||
''||unistr('\000a')||
'        -- render the tags widget'||unistr('\000a')||
'        sys.htp.prn ('||unistr('\000a')||
'            ''<input type="text" name="''||l_name||''" id="''||p_item.name||''" ''||'||unistr('\000a')||
'            ''size="''||p_item.element_width||''" maxlength="''||p_item.element_max_length||''" ''||'||unistr('\000a')||
'            coalesce(p_item.element_attributes, ''class="tags" '')||'||unistr('\000a')||
'            ''value="''||l_escaped_value||''">'' );'||unistr('\000a')||
''||unistr('\000a')||
'        -- Register the javascr'||
'ipt library the plug-in uses.'||unistr('\000a')||
'        -- The add_library call will make sure that just one instance of the'||unistr('\000a')||
'        -- library is loaded when the plug-in is used multiple times on the page.'||unistr('\000a')||
'        apex_javascript.add_library ('||unistr('\000a')||
'            p_name      => ''apex.jquery.autocomplete.min'','||unistr('\000a')||
'            p_directory => wwv_flow.g_image_prefix||''libraries/jquery-autocomplete/1.1/'','||unistr('\000a')||
'            p_version   '||
'=> null );'||unistr('\000a')||
''||unistr('\000a')||
'        apex_javascript.add_library ('||unistr('\000a')||
'            p_name      => ''com_oracle_apex_tags'','||unistr('\000a')||
'            p_directory => p_plugin.file_prefix,'||unistr('\000a')||
'            p_version   => null );'||unistr('\000a')||
''||unistr('\000a')||
'        apex_javascript.add_onload_code ('||unistr('\000a')||
'            p_code => ''com_oracle_apex_tags(''||'||unistr('\000a')||
'                          ''"#''||p_item.name||''",''||'||unistr('\000a')||
'                          ''{''||'||unistr('\000a')||
'                          apex_javascrip'||
't.add_attribute(''dependingOn'',       apex_plugin_util.page_item_names_to_jquery(p_item.lov_cascade_parent_items))||'||unistr('\000a')||
'                          apex_javascript.add_attribute(''optimizeRefresh'',   p_item.ajax_optimize_refresh)||'||unistr('\000a')||
'                          apex_javascript.add_attribute(''pageItemsToSubmit'', apex_plugin_util.page_item_names_to_jquery(p_item.ajax_items_to_submit))||'||unistr('\000a')||
'                       '||
'   apex_javascript.add_attribute(''ajaxIdentifier'',    apex_plugin.get_ajax_identifier, false, false)||'||unistr('\000a')||
'                          ''});'' );'||unistr('\000a')||
''||unistr('\000a')||
'        l_result.is_navigable := true;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    return l_result;'||unistr('\000a')||
'    --'||unistr('\000a')||
'end render;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--=============================================================================='||unistr('\000a')||
'-- Returns the possible values restricted by the value specified in wwv_flow'||
'.g_x01.'||unistr('\000a')||
'--=============================================================================='||unistr('\000a')||
'function ajax ('||unistr('\000a')||
'    p_item   in apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin in apex_plugin.t_plugin )'||unistr('\000a')||
'    return apex_plugin.t_page_item_ajax_result'||unistr('\000a')||
'is'||unistr('\000a')||
'    -- Dynamic attribute mapping'||unistr('\000a')||
'    l_search_string     varchar2(32767) := apex_application.g_x01;'||unistr('\000a')||
''||unistr('\000a')||
'    l_column_value_list apex_plugin_util.t_column_value_list;'||unistr('\000a')||
'  '||
'  '||unistr('\000a')||
'    l_result            apex_plugin.t_page_item_ajax_result;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    -- Write header for the output.'||unistr('\000a')||
'    sys.owa_util.mime_header(''text/plain'', false);'||unistr('\000a')||
'    sys.htp.p(''Cache-Control: no-cache'');'||unistr('\000a')||
'    sys.htp.p(''Pragma: no-cache'');'||unistr('\000a')||
'    sys.owa_util.http_header_close;'||unistr('\000a')||
''||unistr('\000a')||
'    -- Get all data'||unistr('\000a')||
'    l_column_value_list := apex_plugin_util.get_data ('||unistr('\000a')||
'                               p_sql_statement  => p_i'||
'tem.lov_definition,'||unistr('\000a')||
'                               p_min_columns      => 1,'||unistr('\000a')||
'                               p_max_columns      => 1,'||unistr('\000a')||
'                               p_component_name   => p_item.name,'||unistr('\000a')||
'                               p_search_type      => apex_plugin_util.c_search_contains_ignore,'||unistr('\000a')||
'                               p_search_column_no => 1,'||unistr('\000a')||
'                               p_search_string    '||
'=> upper(l_search_string),'||unistr('\000a')||
'                               p_max_rows         => 10 );'||unistr('\000a')||
''||unistr('\000a')||
'    -- Just write each row into a new line. Escaping is done by com_oracle_apex_tags.js'||unistr('\000a')||
'    for i in 1 .. l_column_value_list(1).count'||unistr('\000a')||
'    loop'||unistr('\000a')||
'        sys.htp.p(l_column_value_list(1)(i));'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    return l_result;'||unistr('\000a')||
'    --'||unistr('\000a')||
'exception when others then'||unistr('\000a')||
'    sys.htp.p(wwv_flow_lang.system_message(''aja'||
'x_server_error'', apex_escape.html(sqlerrm), p_item.name));'||unistr('\000a')||
'end ajax;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--=============================================================================='||unistr('\000a')||
'-- Validates the submitted value if it is contained in the list of possible values.'||unistr('\000a')||
'--=============================================================================='||unistr('\000a')||
'function validate ('||unistr('\000a')||
'    p_item   in apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin in ap'||
'ex_plugin.t_plugin,'||unistr('\000a')||
'    p_value  in varchar2 )'||unistr('\000a')||
'    return apex_plugin.t_page_item_validation_result'||unistr('\000a')||
'is'||unistr('\000a')||
'    l_format_type       varchar2(10) := nvl(p_plugin.attribute_01, ''NONE'');'||unistr('\000a')||
''||unistr('\000a')||
'    l_sql_handler       wwv_flow_plugin_util.t_sql_handler;'||unistr('\000a')||
'    l_column_value_list apex_plugin_util.t_column_value_list;'||unistr('\000a')||
'    l_tag_list          wwv_flow_global.vc_arr2;'||unistr('\000a')||
'    l_tag               varchar2(32767);'||unistr('\000a')||
'    l_fi'||
'nal_tags        varchar2(32767);'||unistr('\000a')||
'begin'||unistr('\000a')||
'    -- get all tags from our page item value'||unistr('\000a')||
'    l_tag_list := wwv_flow_utilities.string_to_table ('||unistr('\000a')||
'                      format_tags ('||unistr('\000a')||
'                           p_format_type => l_format_type,'||unistr('\000a')||
'                           p_tags        => p_value ),'||unistr('\000a')||
'                      '','' );'||unistr('\000a')||
''||unistr('\000a')||
'    if l_tag_list.count > 0 then'||unistr('\000a')||
'        if l_format_type in (''LOWER'', ''UPPER'') t'||
'hen'||unistr('\000a')||
'            -- for lower and upper formatting we just clean up the tags from'||unistr('\000a')||
'            -- unnecessary spaces, ...'||unistr('\000a')||
'            for i in 1 .. l_tag_list.count'||unistr('\000a')||
'            loop'||unistr('\000a')||
'                l_tag := trim(l_tag_list(i));'||unistr('\000a')||
'                if l_tag is not null then'||unistr('\000a')||
'                    l_final_tags := l_final_tags ||'||unistr('\000a')||
'                                    case when l_final_tags is not null then '', '''||
' end||'||unistr('\000a')||
'                                    l_tag;'||unistr('\000a')||
'                end if;'||unistr('\000a')||
'            end loop;'||unistr('\000a')||
''||unistr('\000a')||
'        elsif l_format_type = ''NONE'' then'||unistr('\000a')||
'            -- Get the tags in the format as they have already been stored in the tag table'||unistr('\000a')||
''||unistr('\000a')||
'            -- We use the more complicated get_sql_handler and prepare_query so that'||unistr('\000a')||
'            -- the SQL statement is just parsed once when we search for the differe'||
'nt tags'||unistr('\000a')||
'            l_sql_handler := apex_plugin_util.get_sql_handler ('||unistr('\000a')||
'                                 p_sql_statement  => p_item.lov_definition,'||unistr('\000a')||
'                                 p_min_columns    => 1,'||unistr('\000a')||
'                                 p_max_columns    => 1,'||unistr('\000a')||
'                                 p_component_name => p_item.name );'||unistr('\000a')||
'    '||unistr('\000a')||
'            apex_plugin_util.prepare_query ('||unistr('\000a')||
'                p_sql_'||
'handler      => l_sql_handler,'||unistr('\000a')||
'                p_search_type      => apex_plugin_util.c_search_exact_ignore,'||unistr('\000a')||
'                p_search_column_no => 1,'||unistr('\000a')||
'                p_max_rows         => 1 /* we are just interested in the first hit */'||unistr('\000a')||
'                );'||unistr('\000a')||
'    '||unistr('\000a')||
'            -- Check each tag with a case insensitive search if it already exists.'||unistr('\000a')||
'            -- If we find it we use the existing writing '||
'of the tag (for example "ApEx"'||unistr('\000a')||
'            -- instead of the entered "apex") for our final tag list. None existing tags'||unistr('\000a')||
'            -- are added as they have been entered.'||unistr('\000a')||
'            for i in 1 .. l_tag_list.count'||unistr('\000a')||
'            loop'||unistr('\000a')||
'                l_tag := trim(l_tag_list(i));'||unistr('\000a')||
'                if l_tag is not null then'||unistr('\000a')||
'                    l_column_value_list := apex_plugin_util.get_data ('||unistr('\000a')||
'         '||
'                                      p_sql_handler      => l_sql_handler,'||unistr('\000a')||
'                                               p_search_column_no => 1,'||unistr('\000a')||
'                                               p_search_string    => upper(l_tag) );'||unistr('\000a')||
'    '||unistr('\000a')||
'                    -- we have found a tag, but make sure that it''s the same tag'||unistr('\000a')||
'                    -- because get_data uses a LIKE tag% search and if we enter'||unistr('\000a')||
'  '||
'                  -- "Oracle" we don''t want to replace it with "Oracle APEX".'||unistr('\000a')||
'                    if l_column_value_list(1).count = 1 and'||unistr('\000a')||
'                       upper(l_column_value_list(1)(1)) = upper(l_tag)'||unistr('\000a')||
'                    then'||unistr('\000a')||
'                        l_tag := l_column_value_list(1)(1);'||unistr('\000a')||
'                    end if;'||unistr('\000a')||
'        '||unistr('\000a')||
'                    l_final_tags := l_final_tags ||'||unistr('\000a')||
'                 '||
'                   case when l_final_tags is not null then '', '' end||'||unistr('\000a')||
'                                    l_tag;'||unistr('\000a')||
'                end if;'||unistr('\000a')||
'            end loop;'||unistr('\000a')||
'        '||unistr('\000a')||
'            apex_plugin_util.free_sql_handler(l_sql_handler);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'    htmldb_util.set_session_state(p_item.name, l_final_tags);'||unistr('\000a')||
''||unistr('\000a')||
'    return null;'||unistr('\000a')||
'exception when others then'||unistr('\000a')||
'    wwv_flow_plugin_util.free_sql_'||
'handler(l_sql_handler);'||unistr('\000a')||
'    raise;'||unistr('\000a')||
'end validate;'
 ,p_render_function => 'render'
 ,p_ajax_function => 'ajax'
 ,p_validation_function => 'validate'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:READONLY:SOURCE:ELEMENT:WIDTH:ENCRYPT:LOV:LOV_REQUIRED:CASCADING_LOV'
 ,p_sql_min_column_count => 1
 ,p_sql_max_column_count => 1
 ,p_sql_examples => '<p>'||unistr('\000a')||
'<strong>Example 1: Get available tags from tag table</strong>'||unistr('\000a')||
'<pre>'||unistr('\000a')||
'SELECT tag'||unistr('\000a')||
'  FROM your_tag_table'||unistr('\000a')||
' ORDER BY 1'||unistr('\000a')||
'</pre>'||unistr('\000a')||
'</p>'||unistr('\000a')||
''||unistr('\000a')||
'<p>'||unistr('\000a')||
'<b>Example 2: Use the DISTINCT command if your tag table doesn''t store unique tags.</b>'||unistr('\000a')||
'<pre>'||unistr('\000a')||
'SELECT DISTINCT tag'||unistr('\000a')||
'  from apa$dl_tags'||unistr('\000a')||
' ORDER BY 1'||unistr('\000a')||
'</pre>'||unistr('\000a')||
'</p>'||unistr('\000a')||
''
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 635681028303841932 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 17494514049056905145 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Formatting of Tags'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'NONE'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 635681420803841932 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 635681028303841932 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'None'
 ,p_return_value => 'NONE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 635681945489841932 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 635681028303841932 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Lowercase'
 ,p_return_value => 'LOWER'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 635682437691841933 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 635681028303841932 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Uppercase'
 ,p_return_value => 'UPPER'
  );
null;
 
end;
/

prompt  ...data loading
--
