--application/shared_components/plugins/region_type/com_oracle_apex_css_bar_chart
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 9701595905796646783 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'COM.ORACLE.APEX.CSS_BAR_CHART'
 ,p_display_name => 'CSS Bar Chart'
 ,p_supported_ui_types => 'DESKTOP:JQM_SMARTPHONE'
 ,p_image_prefix => '#IMAGE_PREFIX#eba/css/'
 ,p_plsql_code => 
'procedure render_bar_chart ('||unistr('\000a')||
'    p_region in apex_plugin.t_region )'||unistr('\000a')||
'is'||unistr('\000a')||
'    -- constants for the columns of our region source query'||unistr('\000a')||
'    c_label_col constant pls_integer := 1;'||unistr('\000a')||
'    c_value_col constant pls_integer := 2;'||unistr('\000a')||
'    c_url_col   constant pls_integer := 3;'||unistr('\000a')||
'    c_color_col constant pls_integer := 4;'||unistr('\000a')||
''||unistr('\000a')||
'    -- attributes of the plug-in'||unistr('\000a')||
'    l_display_as           varchar2(20)    := nvl(p_region.attr'||
'ibute_01, ''VALUE_ABSOLUTE'');'||unistr('\000a')||
'    l_value_prefix         varchar2(40)    := p_region.attribute_02;'||unistr('\000a')||
'    l_value_postfix        varchar2(40)    := p_region.attribute_03;'||unistr('\000a')||
'    -- page items to submit = p_region.attribute_09'||unistr('\000a')||
'    l_max_rows             number          := to_number(p_region.attribute_10);'||unistr('\000a')||
'    l_region_source        varchar2(32767) := p_region.source;'||unistr('\000a')||
''||unistr('\000a')||
'    l_valid_data_type_list wwv_flow_g'||
'lobal.vc_arr2;'||unistr('\000a')||
'    l_column_value_list    apex_plugin_util.t_column_value_list2;'||unistr('\000a')||
'    l_max_value            number;'||unistr('\000a')||
'    l_total_value          number;'||unistr('\000a')||
'    l_label                varchar2(4000);'||unistr('\000a')||
'    l_value                number;'||unistr('\000a')||
'    l_url                  varchar2(4000);'||unistr('\000a')||
'    l_color                varchar2(4000);'||unistr('\000a')||
'    l_width                number;'||unistr('\000a')||
'    l_display_value        varchar2(4000);'||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
''||
'    -- if percentage is displayed then the value will always have % as postfix'||unistr('\000a')||
'    if l_display_as like ''PERCENTAGE%'' then'||unistr('\000a')||
'        l_value_postfix := '' %'';'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'    -- define the valid column data types for the region query'||unistr('\000a')||
'    l_valid_data_type_list(c_label_col) := apex_plugin_util.c_data_type_varchar2;'||unistr('\000a')||
'    l_valid_data_type_list(c_value_col) := apex_plugin_util.c_data_type_number;'||unistr('\000a')||
'    l_'||
'valid_data_type_list(c_url_col)   := apex_plugin_util.c_data_type_varchar2;'||unistr('\000a')||
'    l_valid_data_type_list(c_color_col) := apex_plugin_util.c_data_type_varchar2;'||unistr('\000a')||
''||unistr('\000a')||
'    -- get the data to be displayed'||unistr('\000a')||
'    l_column_value_list := apex_plugin_util.get_data2 ('||unistr('\000a')||
'                               p_sql_statement  => l_region_source,'||unistr('\000a')||
'                               p_min_columns    => 2,'||unistr('\000a')||
'                           '||
'    p_max_columns    => 4,'||unistr('\000a')||
'                               p_data_type_list => l_valid_data_type_list,'||unistr('\000a')||
'                               p_component_name => p_region.name,'||unistr('\000a')||
'                               p_max_rows       => l_max_rows );'||unistr('\000a')||
''||unistr('\000a')||
'    -- calculate the total or max value depending on "Display As"'||unistr('\000a')||
'    -- We could rewrite the region query with SUM(xxx) over ()'||unistr('\000a')||
'    -- but that would require that we'||
' know how the columns are named in the query.'||unistr('\000a')||
'    -- That''s why we just do a simple loop of the tiny array to get the'||unistr('\000a')||
'    -- total/max value which is probably faster anyway'||unistr('\000a')||
'    if l_display_as like ''%RELATIVE'' then'||unistr('\000a')||
'        l_total_value := 0;'||unistr('\000a')||
'        for i in 1 .. l_column_value_list(c_value_col).value_list.count loop'||unistr('\000a')||
'            -- $$$ what should we do if VALUE is NULL??? Set l_total_value to NU'||
'LL as well?'||unistr('\000a')||
'            l_total_value := l_total_value + l_column_value_list(c_value_col).value_list(i).number_value;'||unistr('\000a')||
'        end loop;'||unistr('\000a')||
'    else'||unistr('\000a')||
'        l_max_value := 0;'||unistr('\000a')||
'        for i in 1 .. l_column_value_list(c_value_col).value_list.count loop'||unistr('\000a')||
'            -- $$$ what should we do if VALUE is NULL??? Set l_max_value to NULL as well?'||unistr('\000a')||
'            if l_column_value_list(c_value_col).value_list(i).'||
'number_value > l_max_value then'||unistr('\000a')||
'                l_max_value := l_column_value_list(c_value_col).value_list(i).number_value;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'        end loop;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'    -- print our bar chart'||unistr('\000a')||
'    sys.htp.p(''<table class="cbc" border="0" cellspacing="0" cellpadding="0" summary="''||p_region.name||''">'');'||unistr('\000a')||
''||unistr('\000a')||
'    for i in 1 .. l_column_value_list(c_label_col).value_list.count loop'||unistr('\000a')||
'        l_lab'||
'el := apex_escape.html(l_column_value_list(c_label_col).value_list(i).varchar2_value);'||unistr('\000a')||
'        l_value := l_column_value_list(c_value_col).value_list(i).number_value;'||unistr('\000a')||
''||unistr('\000a')||
'        -- get the value of the URL and color only if the column exists in the SQL statement'||unistr('\000a')||
'        if l_column_value_list.exists(c_url_col) then'||unistr('\000a')||
'            l_url := wwv_flow_utilities.prepare_url ('||unistr('\000a')||
'                         apex_a'||
'pplication.do_substitutions ('||unistr('\000a')||
'                             l_column_value_list(c_url_col).value_list(i).varchar2_value ));'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        if l_column_value_list.exists(c_color_col) then'||unistr('\000a')||
'            l_color := lower(l_column_value_list(c_color_col).value_list(i).varchar2_value);'||unistr('\000a')||
'            -- map a few of the standard colors to better looking ones'||unistr('\000a')||
'            l_color := case l_color'||unistr('\000a')||
'     '||
'                    when ''red''     then ''#e10'''||unistr('\000a')||
'                         when ''yellow''  then ''#fd0'''||unistr('\000a')||
'                         when ''green''   then ''#0c0'''||unistr('\000a')||
'                         when ''black''   then ''#555'''||unistr('\000a')||
'                         when ''default'' then ''#ddd'''||unistr('\000a')||
'                         else l_color'||unistr('\000a')||
'                       end;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
''||unistr('\000a')||
'        -- calculate how long the chart bar should be'||unistr('\000a')||
'        '||
'if l_display_as like ''%RELATIVE'' then'||unistr('\000a')||
'            if l_total_value = 0 then'||unistr('\000a')||
'                l_width := 0;'||unistr('\000a')||
'            else'||unistr('\000a')||
'                l_width := round(l_value * 100 / l_total_value);'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'        else'||unistr('\000a')||
'            if l_max_value = 0 then'||unistr('\000a')||
'                l_width := 0;'||unistr('\000a')||
'            else'||unistr('\000a')||
'                l_width := round(l_value * 100 / l_max_value);'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'        end i'||
'f;'||unistr('\000a')||
''||unistr('\000a')||
'        if l_display_as like ''PERCENTAGE%'' then'||unistr('\000a')||
'            l_value := l_width;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
''||unistr('\000a')||
'        l_display_value := case when l_value_prefix is not null then l_value_prefix||'' '' end||'||unistr('\000a')||
'                           trim(to_char(l_value, ''999G999G999G990''))||'||unistr('\000a')||
'                           case when l_value_postfix is not null then '' ''||l_value_postfix end;'||unistr('\000a')||
''||unistr('\000a')||
'        sys.htp.p(''<tr>'');'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'       '||
' -- print label column and add link if an URL has been specified in the SQL statement'||unistr('\000a')||
'        -- otherwise just print the label'||unistr('\000a')||
'        sys.htp.p(''<th id="''||p_region.static_id||''_row_''||i||''"><span class="cbc_label">'');'||unistr('\000a')||
'        if l_url is not null then'||unistr('\000a')||
'            sys.htp.p(''<a href="''||l_url||''">''||l_label||''</a>'');'||unistr('\000a')||
'        else'||unistr('\000a')||
'            sys.htp.p(l_label);'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        sys.htp.p('||
'''</span></th>'');'||unistr('\000a')||
''||unistr('\000a')||
'        -- print chart bar'||unistr('\000a')||
'        sys.htp.p(''<td headers="''||p_region.static_id||''_row_''||i||''">'');'||unistr('\000a')||
'        sys.htp.p(''<span class="cbc_bar_background">'');'||unistr('\000a')||
''||unistr('\000a')||
'        -- add link if an URL has been specified in the SQL statement otherwise just print the value'||unistr('\000a')||
'        if l_url is not null then'||unistr('\000a')||
'            sys.htp.p(''<span class="cbc_value"><a href="''||l_url||''">''||l_display_value||'||
'''</a></span>'');'||unistr('\000a')||
'        else'||unistr('\000a')||
'            sys.htp.p(''<span class="cbc_value">''||l_display_value||''</span>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        '||unistr('\000a')||
'        sys.htp.p ('||unistr('\000a')||
'            ''<span class="cbc_bar" style="width:''||l_width||''%;''||'||unistr('\000a')||
'            case when l_color is not null then ''background-color:''||l_color end||'||unistr('\000a')||
'            ''"></span>'' );'||unistr('\000a')||
'        sys.htp.p(''</span>'');'||unistr('\000a')||
'        sys.htp.p(''</td>'');'||unistr('\000a')||
''||unistr('\000a')||
'        sys.'||
'htp.p(''</tr>'');'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
''||unistr('\000a')||
'    sys.htp.p(''</table>'');'||unistr('\000a')||
'end render_bar_chart;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'function render ('||unistr('\000a')||
'    p_region              in apex_plugin.t_region,'||unistr('\000a')||
'    p_plugin              in apex_plugin.t_plugin,'||unistr('\000a')||
'    p_is_printer_friendly in boolean )'||unistr('\000a')||
'    return apex_plugin.t_region_render_result'||unistr('\000a')||
'is'||unistr('\000a')||
'    l_page_items_to_submit varchar2(4000)  := p_region.attribute_09;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    apex_css.add_file ('||unistr('\000a')||
'        p_n'||
'ame      => ''css_bar_chart'','||unistr('\000a')||
'        p_directory => p_plugin.file_prefix,'||unistr('\000a')||
'        p_version   => null );'||unistr('\000a')||
''||unistr('\000a')||
'    sys.htp.p ('''||unistr('\000a')||
'<!--[if IE]> '||unistr('\000a')||
'<style type="text/css" media="screen">'||unistr('\000a')||
'.cbc .cbc_bar_background {'||unistr('\000a')||
'  background-color: #FFF;'||unistr('\000a')||
'  border: 1px solid #AAA;'||unistr('\000a')||
'}'||unistr('\000a')||
'.cbc .cbc_value {'||unistr('\000a')||
'  color: #000;'||unistr('\000a')||
'  border-right: 1px solid #AAA;'||unistr('\000a')||
'}'||unistr('\000a')||
'.cbc .cbc_value a {'||unistr('\000a')||
'  color: #000;'||unistr('\000a')||
'}'||unistr('\000a')||
'.cbc .cbc_value a:hover {'||unistr('\000a')||
'  text-decora'||
'tion: underline'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>'||unistr('\000a')||
'<![endif]-->'');'||unistr('\000a')||
''||unistr('\000a')||
'    -- print our region data'||unistr('\000a')||
'    sys.htp.p(''<div id="''||p_region.static_id||''_chart" class="cbc">'');'||unistr('\000a')||
''||unistr('\000a')||
'    render_bar_chart ('||unistr('\000a')||
'        p_region => p_region );'||unistr('\000a')||
''||unistr('\000a')||
'    sys.htp.p(''</div>'');'||unistr('\000a')||
''||unistr('\000a')||
'    apex_javascript.add_library ('||unistr('\000a')||
'        p_name      => ''com_oracle_apex_css_bar_chart'','||unistr('\000a')||
'        p_directory => p_plugin.file_prefix,'||unistr('\000a')||
'        p_version   => null );'||unistr('\000a')||
''||unistr('\000a')||
'    a'||
'pex_javascript.add_onload_code ('||unistr('\000a')||
'        p_code => ''com_oracle_apex_css_bar_chart(''||'||unistr('\000a')||
'                      apex_javascript.add_value(p_region.static_id)||'||unistr('\000a')||
'                      ''{''||'||unistr('\000a')||
'                      apex_javascript.add_attribute(''pageItemsToSubmit'', apex_plugin_util.page_item_names_to_jquery(l_page_items_to_submit))||'||unistr('\000a')||
'                      apex_javascript.add_attribute(''ajaxIdentifier'',    '||
'apex_plugin.get_ajax_identifier, false, false)||'||unistr('\000a')||
'                      ''});'' );'||unistr('\000a')||
''||unistr('\000a')||
'    return null;'||unistr('\000a')||
'end render;'||unistr('\000a')||
''||unistr('\000a')||
'function ajax ('||unistr('\000a')||
'    p_region              in apex_plugin.t_region,'||unistr('\000a')||
'    p_plugin              in apex_plugin.t_plugin )'||unistr('\000a')||
'    return apex_plugin.t_region_ajax_result'||unistr('\000a')||
'is'||unistr('\000a')||
'begin'||unistr('\000a')||
'    sys.owa_util.mime_header(''text/html'', false);'||unistr('\000a')||
'    sys.htp.p(''Cache-Control: no-cache'');'||unistr('\000a')||
'    sys.htp.p(''Pragma: no'||
'-cache'');'||unistr('\000a')||
'    sys.owa_util.http_header_close;'||unistr('\000a')||
''||unistr('\000a')||
'    render_bar_chart ('||unistr('\000a')||
'        p_region => p_region );'||unistr('\000a')||
''||unistr('\000a')||
'    return null;'||unistr('\000a')||
'exception when others then'||unistr('\000a')||
'    sys.htp.p(''Error: ''||sqlerrm);'||unistr('\000a')||
'end ajax;'
 ,p_render_function => 'render'
 ,p_ajax_function => 'ajax'
 ,p_standard_attributes => 'SOURCE_SQL'
 ,p_sql_min_column_count => 2
 ,p_sql_max_column_count => 4
 ,p_sql_examples => 'The region source has to be in the following format:'||unistr('\000a')||
'<pre>'||unistr('\000a')||
'select label,'||unistr('\000a')||
'       value,'||unistr('\000a')||
'       [link,]'||unistr('\000a')||
'       [color]'||unistr('\000a')||
'  from table'||unistr('\000a')||
' order by value'||unistr('\000a')||
'</pre>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li><strong>Label</strong> is the label ...</li>'||unistr('\000a')||
'<li><strong>Value</strong> is the value ... and has to be of type NUMBER</li>'||unistr('\000a')||
'<li><strong>Link</strong> is optional and can allow a user to navigate to another page within the application or a provided URL, and is activated by clicking on the chart bar of the record.</li>'||unistr('\000a')||
'<li><strong>Color</strong> is optional and is the background color of the chart bar for the record. The color is a hex value (for example #ff0000) or one of the standard web colors like red, green, ...</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
''
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.9'
 ,p_about_url => 'http://apex.oracle.com/plugins'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 635664146725837571 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9701595905796646783 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Display As'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'VALUE_ABSOLUTE'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 635664539537837571 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 635664146725837571 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 1
 ,p_display_value => 'Percentage with relative bar width'
 ,p_return_value => 'PERCENTAGE_RELATIVE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 635665023648837572 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 635664146725837571 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 1
 ,p_display_value => 'Value with relative bar width'
 ,p_return_value => 'VALUE_RELATIVE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 635665519894837572 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 635664146725837571 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 1
 ,p_display_value => 'Percentage with absolute bar width'
 ,p_return_value => 'PERCENTAGE_ABSOLUT'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 635666050356837573 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 635664146725837571 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 1
 ,p_display_value => 'Value with absolute bar width'
 ,p_return_value => 'VALUE_ABSOLUTE'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 635666550815837574 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9701595905796646783 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Prefix for Value'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 10
 ,p_max_length => 40
 ,p_is_translatable => true
 ,p_depending_on_attribute_id => 635664146725837571 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'IN_LIST'
 ,p_depending_on_expression => 'VALUE_ABSOLUTE,VALUE_RELATIVE'
 ,p_help_text => 'Specify the prefix which should be added to the displayed value.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 635666925915837574 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9701595905796646783 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Postfix for Value'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 10
 ,p_max_length => 40
 ,p_is_translatable => true
 ,p_depending_on_attribute_id => 635664146725837571 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'IN_LIST'
 ,p_depending_on_expression => 'VALUE_ABSOLUTE,VALUE_RELATIVE'
 ,p_help_text => 'Specify the postfix which should be added to the displayed value.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 635667326680837575 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9701595905796646783 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 90
 ,p_prompt => 'Page Items to Submit'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => 'Specify a comma separated list of page items that will be submitted to the server and thus, available for use from within your region source SQL statement.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 635667750013837575 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9701595905796646783 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 100
 ,p_prompt => 'Maximum Rows'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_default_value => '5'
 ,p_display_length => 3
 ,p_max_length => 3
 ,p_is_translatable => false
 ,p_help_text => 'Defines the maximum number of rows to query and to display.'
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E20636F6D5F6F7261636C655F617065785F6373735F6261725F63686172742870526567696F6E49642C20704F7074696F6E7329207B0A0A20202F2F2044656661756C74206F7572206F7074696F6E7320616E642073746F7265207468';
wwv_flow_api.g_varchar2_table(2) := '656D2077697468207468652022676C6F62616C22207072656669782C20626563617573652074686579206172650A20202F2F20757365642062792074686520646966666572656E742066756E6374696F6E7320617320636C6F737572650A202076617220';
wwv_flow_api.g_varchar2_table(3) := '674F7074696F6E73203D20617065782E6A51756572792E657874656E64287B0A20202020202020202020202020202020202020616A61784964656E7469666965723A6E756C6C2C0A20202020202020202020202020202020202020706167654974656D73';
wwv_flow_api.g_varchar2_table(4) := '546F5375626D69743A6E756C6C0A202020202020202020202020202020202020207D2C20704F7074696F6E73292C0A20202020202067526567696F6E20203D20617065782E6A5175657279282723272B70526567696F6E4964292C0A2020202020206743';
wwv_flow_api.g_varchar2_table(5) := '686172742020203D20617065782E6A5175657279282723272B70526567696F6E49642B275F636861727427293B0A0A20202F2F204578656375746564207768656E2074686520414A41582063616C6C2069732066696E69736865642E2070446174612077';
wwv_flow_api.g_varchar2_table(6) := '696C6C20636F6E7461696E7320746865206E65772048544D4C20636F646520666F72207468652063686172740A202066756E6374696F6E205F64726177526573756C7428704461746129207B0A202020206743686172740A2020202020202E72656D6F76';
wwv_flow_api.g_varchar2_table(7) := '65436C61737328276362635F6C6F6164696E6727290A2020202020202E68746D6C287044617461293B0A2020202067526567696F6E2E7472696767657228276170657861667465727265667265736827293B0A20207D3B202F2F205F6472617752657375';
wwv_flow_api.g_varchar2_table(8) := '6C740A0A20202F2F20457865637574657320616E20414A41582063616C6C20746F20676574206E65772076616C75657320666F722074686520435353206261722063686172740A202066756E6374696F6E20726566726573682829207B0A0A202020202F';
wwv_flow_api.g_varchar2_table(9) := '2F207472696767657220746865206265666F72652072656672657368206576656E740A2020202067526567696F6E2E747269676765722827617065786265666F72657265667265736827293B0A0A202020202F2F20696E697469616C697A652074686520';
wwv_flow_api.g_varchar2_table(10) := '414A41582063616C6C20706172616D65746572730A20202020766172206C44617461203D207B20705F726571756573743A20224E41544956453D222B674F7074696F6E732E616A61784964656E7469666965722C0A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(11) := '202020705F666C6F775F69643A202476282770466C6F77496427292C0A202020202020202020202020202020202020705F666C6F775F737465705F69643A202476282770466C6F7753746570496427292C0A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(12) := '705F696E7374616E63653A202476282770496E7374616E636527290A202020202020202020202020202020207D3B0A0A202020202F2F2061646420616C6C2070616765206974656D73207765206861766520746F207375626D697420746F207468652041';
wwv_flow_api.g_varchar2_table(13) := '4A41582063616C6C0A20202020617065782E6A517565727928674F7074696F6E732E706167654974656D73546F5375626D6974292E656163682866756E6374696F6E28297B0A202020202020766172206C4964783B0A202020202020696620286C446174';
wwv_flow_api.g_varchar2_table(14) := '612E705F6172675F6E616D65733D3D3D756E646566696E656429207B0A20202020202020206C446174612E705F6172675F6E616D657320203D205B5D3B0A20202020202020206C446174612E705F6172675F76616C756573203D205B5D3B0A2020202020';
wwv_flow_api.g_varchar2_table(15) := '2020206C496478203D20303B0A2020202020207D20656C7365207B0A20202020202020206C496478203D206C446174612E705F6172675F6E616D65732E6C656E6774683B0A2020202020207D0A2020202020206C446174612E705F6172675F6E616D6573';
wwv_flow_api.g_varchar2_table(16) := '205B6C4964785D203D20746869732E69643B0A2020202020206C446174612E705F6172675F76616C7565735B6C4964785D203D2024762874686973293B0A202020207D293B0A0A202020202F2F20616464206C6F64696E6720696E64696361746F720A20';
wwv_flow_api.g_varchar2_table(17) := '2020206743686172742E616464436C61737328276362635F6C6F6164696E6727293B0A0A202020202F2F20706572666F726D2074686520414A41582063616C6C0A20202020617065782E6A51756572792E616A6178287B0A2020202020202F2F20747279';
wwv_flow_api.g_varchar2_table(18) := '20746F206C6576657261676520616A6178517565756520706C7567696E20746F2061626F72742070726576696F75732072657175657374730A2020202020206D6F64653A202261626F7274222C0A2020202020202F2F206C696D69742061626F7274696F';
wwv_flow_api.g_varchar2_table(19) := '6E20746F207468697320696E7075740A202020202020706F72743A20226373735F6261725F63686172745F222B70526567696F6E49642C0A20202020202064617461547970653A202268746D6C222C0A202020202020747970653A2022706F7374222C0A';
wwv_flow_api.g_varchar2_table(20) := '20202020202075726C3A20227777765F666C6F772E73686F77222C0A202020202020747261646974696F6E616C3A20747275652C0A202020202020646174613A206C446174612C0A202020202020737563636573733A205F64726177526573756C740A20';
wwv_flow_api.g_varchar2_table(21) := '20202020207D293B0A20207D3B202F2F20726566726573680A0A20202F2F207265676973746572207468652072656672657368206576656E74207768696368206973207472696767657265642062792061206D616E75616C20726566726573680A202067';
wwv_flow_api.g_varchar2_table(22) := '526567696F6E2E62696E6428226170657872656672657368222C2072656672657368293B0A0A7D3B202F2F20636F6D5F6F7261636C655F617065785F6373735F6261725F63686172740A';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 635669240023837577 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9701595905796646783 + wwv_flow_api.g_id_offset
 ,p_file_name => 'com_oracle_apex_css_bar_chart.js'
 ,p_mime_type => 'text/javascript'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7461626C652E636263207B0D0A202077696474683A20313030253B0D0A7D0D0A7461626C652E636263207468207B0D0A2020746578742D616C69676E3A206C6566743B0D0A2020666F6E742D7765696768743A206E6F726D616C3B0D0A2020666F6E742D';
wwv_flow_api.g_varchar2_table(2) := '73697A653A20313270783B0D0A20206C696E652D6865696768743A20313870783B0D0A202070616464696E673A20337078203570782033707820303B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C696420234545453B0D0A20207768';
wwv_flow_api.g_varchar2_table(3) := '6974652D73706163653A206E6F777261703B0D0A2020746578742D6F766572666C6F773A20656C6C69707369733B0D0A20206F766572666C6F773A2068696464656E3B0D0A7D0D0A2E6362635F6C61726765207461626C65207468207B0D0A2020666F6E';
wwv_flow_api.g_varchar2_table(4) := '742D7765696768743A206E6F726D616C3B0D0A2020666F6E742D73697A653A20313370783B0D0A20206C696E652D6865696768743A20323470783B0D0A202070616464696E673A20357078203570782035707820303B0D0A7D0D0A2E636263202E636263';
wwv_flow_api.g_varchar2_table(5) := '5F6C6162656C2061207B0D0A2020636F6C6F723A20233030303B0D0A7D0D0A7461626C652E6362632074723A6C6173742D6368696C642074682C7461626C652E6362632074723A6C6173742D6368696C64207464207B0D0A2020626F726465722D626F74';
wwv_flow_api.g_varchar2_table(6) := '746F6D3A206E6F6E653B0D0A7D0D0A7461626C652E636263207464207B0D0A202070616464696E673A20337078203020337078203570783B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C696420234545453B0D0A202077696474683A';
wwv_flow_api.g_varchar2_table(7) := '203930253B0D0A7D0D0A2E6362635F6C61726765207461626C652E636263207464207B0D0A202070616464696E673A20357078203020357078203570783B0D0A7D0D0A2E636263202E6362635F6261725F6261636B67726F756E64207B0D0A2020646973';
wwv_flow_api.g_varchar2_table(8) := '706C61793A20626C6F636B3B0D0A202077696474683A20313030253B0D0A20202D7765626B69742D626F726465722D7261646975733A203670783B0D0A20202D6D6F7A2D626F726465722D7261646975733A203670783B0D0A2020626F726465722D7261';
wwv_flow_api.g_varchar2_table(9) := '646975733A203670783B0D0A20206261636B67726F756E643A202D7765626B69742D6772616469656E74286C696E6561722C30252030252C302520313030252C66726F6D287267626128302C302C302C2E3229292C746F287267626128302C302C302C2E';
wwv_flow_api.g_varchar2_table(10) := '312929293B0D0A20206261636B67726F756E643A202D6D6F7A2D6C696E6561722D6772616469656E7428746F702C207267626128302C302C302C302E32292C7267626128302C302C302C2E3129293B0D0A2020666F6E742D7765696768743A20626F6C64';
wwv_flow_api.g_varchar2_table(11) := '3B0D0A2020666F6E742D73697A653A20313270783B0D0A20206C696E652D6865696768743A20323070783B0D0A20202D7765626B69742D6261636B67726F756E642D636C69703A2070616464696E672D626F783B0D0A20202D6D6F7A2D6261636B67726F';
wwv_flow_api.g_varchar2_table(12) := '756E642D636C69703A2070616464696E672D626F783B0D0A20206261636B67726F756E642D636C69703A2070616464696E672D626F783B0D0A2020706F736974696F6E3A2072656C61746976653B0D0A20202D7765626B69742D626F782D736861646F77';
wwv_flow_api.g_varchar2_table(13) := '3A20696E736574203020302030707820317078207267626128302C302C302C2E3035293B0D0A20202D6D6F7A2D626F782D736861646F773A20696E736574203020302030707820317078207267626128302C302C302C2E3035293B0D0A2020626F782D73';
wwv_flow_api.g_varchar2_table(14) := '6861646F773A20696E736574203020302030707820317078207267626128302C302C302C2E3035293B0D0A7D0D0A2E6362635F6C61726765202E6362635F6261725F6261636B67726F756E64207B0D0A2020666F6E742D7765696768743A20626F6C643B';
wwv_flow_api.g_varchar2_table(15) := '0D0A2020666F6E742D73697A653A20313470783B0D0A20206C696E652D6865696768743A20323470783B0D0A2020706F736974696F6E3A2072656C61746976653B0D0A7D0D0A0D0A2E636263202E6362635F626172207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(16) := '643A202D7765626B69742D6772616469656E74286C696E6561722C30252030252C302520313030252C66726F6D2872676261283235352C3235352C3235352C2E313529292C746F287267626128302C302C302C2E32352929293B0D0A20206261636B6772';
wwv_flow_api.g_varchar2_table(17) := '6F756E643A202D6D6F7A2D6C696E6561722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E3135292C7267626128302C302C302C2E323529293B0D0A20206261636B67726F756E642D636F6C6F723A2023463246324632';
wwv_flow_api.g_varchar2_table(18) := '3B0D0A2020646973706C61793A20626C6F636B3B0D0A20206865696768743A20323070783B0D0A20202D7765626B69742D626F726465722D7261646975733A203570783B0D0A20202D6D6F7A2D626F726465722D7261646975733A203570783B0D0A2020';
wwv_flow_api.g_varchar2_table(19) := '626F726465722D7261646975733A203570783B0D0A20202D7765626B69742D626F782D736861646F773A20696E736574203020302030707820317078207267626128302C302C302C2E3235293B0D0A20202D6D6F7A2D626F782D736861646F773A20696E';
wwv_flow_api.g_varchar2_table(20) := '736574203020302030707820317078207267626128302C302C302C2E3235293B0D0A2020626F782D736861646F773A20696E736574203020302030707820317078207267626128302C302C302C2E3235293B0D0A7D0D0A0D0A2E6362635F6C6172676520';
wwv_flow_api.g_varchar2_table(21) := '2E6362635F626172207B0D0A20206865696768743A20323470783B0D0A7D0D0A0D0A2E636263202E6362635F76616C7565207B0D0A2020636F6C6F723A20233535353B0D0A2020636F6C6F723A207267626128302C302C302C2E3735293B0D0A20207769';
wwv_flow_api.g_varchar2_table(22) := '6474683A20313030253B0D0A2020646973706C61793A20626C6F636B3B0D0A2020746578742D616C69676E3A2063656E7465723B0D0A2020706F736974696F6E3A206162736F6C7574653B0D0A7D0D0A0D0A2E636263202E6362635F76616C7565206120';
wwv_flow_api.g_varchar2_table(23) := '7B0D0A2020636F6C6F723A20233535353B0D0A2020636F6C6F723A207267626128302C302C302C2E3735293B0D0A2020746578742D6465636F726174696F6E3A206E6F6E653B0D0A2020646973706C61793A20626C6F636B3B0D0A2020746578742D7368';
wwv_flow_api.g_varchar2_table(24) := '61646F773A20302031707820302072676261283235352C3235352C303235352C2E3235293B0D0A7D0D0A0D0A2E636263202E6362635F76616C756520613A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C302C';
wwv_flow_api.g_varchar2_table(25) := '302C2E3135293B0D0A20202D7765626B69742D626F726465722D7261646975733A203670783B0D0A20202D6D6F7A2D626F726465722D7261646975733A203670783B0D0A2020626F726465722D7261646975733A203670783B0D0A7D0D0A0D0A';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 635669642247837577 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9701595905796646783 + wwv_flow_api.g_id_offset
 ,p_file_name => 'css_bar_chart.css'
 ,p_mime_type => 'text/css'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

