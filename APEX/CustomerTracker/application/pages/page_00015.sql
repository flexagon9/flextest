--application/pages/page_00015
prompt  ...PAGE 15: Help
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 15
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Help'
 ,p_alias => 'HELP'
 ,p_step_title => 'Sample Database Application - Help'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Help'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188011359373082 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<style>'||unistr('\000a')||
'div.helpContainer{width:960px;margin:16px auto;zoom:1}'||unistr('\000a')||
'div.helpContainer:before,div.helpContainer:after{content:"\0020";display:block;height:0;overflow:hidden}'||unistr('\000a')||
'div.helpContainer:after{clear:both}'||unistr('\000a')||
'div.helpContainer div.helpSide{float:left;width:300px}'||unistr('\000a')||
'div.helpContainer div.helpSide h1.appNameHeader{position:relative;font:bold 22px/36px Arial,sans-serif;color:#404040;padding:0;margin:0}'||unistr('\000a')||
'div.'||
'helpContainer div.helpSide h1.appNameHeader img{display:block;position:absolute;left:0;top:0}'||unistr('\000a')||
'div.helpContainer div.helpMain{float:right;border-left:1px solid #EEE;width:632px;padding-left:16px}'||unistr('\000a')||
'div.helpContainer div.helpMain h2{font:bold 20px/32px Arial,sans-serif;color:#404040;margin:0 0 8px 0}'||unistr('\000a')||
'div.helpContainer div.helpMain h3{font:bold 16px/24px Arial,sans-serif;color:#404040;margin:0 0 8px 0}'||
''||unistr('\000a')||
'div.helpContainer div.helpMain h4{font:bold 12px/16px Arial,sans-serif;color:#404040;margin:0 0 8px 0}'||unistr('\000a')||
'div.helpContainer div.helpMain p{font:normal 12px/16px Arial,sans-serif;color:#404040;margin:0 0 8px 0}'||unistr('\000a')||
'div.helpContainer div.helpMain ul{list-style:outside disc;margin:0 0 0 24px}'||unistr('\000a')||
'div.helpContainer div.helpMain ul li{font:normal 12px/20px Arial,sans-serif;color:#404040}'||unistr('\000a')||
'div.helpContainer div.he'||
'lpMain .aboutApp,div.helpContainer div.helpMain .textRegion{border-bottom:1px solid #EEE;padding-bottom:16px;margin-bottom:16px}'||unistr('\000a')||
'</style>'
 ,p_step_template => 1020515051496437553 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20130213084339'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4168834145114614925 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 15,
  p_plug_name=> 'Help Container',
  p_region_name=>'',
  p_region_css_classes=>'helpContainer',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1020541067266437568+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_num_rows => 15,
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
s:=s||'sys.htp.p(''<h1 class="appNameHeader">'');'||unistr('\000a')||
'  for c2 in (select LOGO, application_name from apex_applications where application_id = :APP_ID) loop'||unistr('\000a')||
'    if (instr(upper(c2.logo),''<'') = 0 and c2.logo is not null) then '||unistr('\000a')||
'      sys.htp.p(replace(apex_escape.html(c2.LOGO),''TEXT:'',''''));'||unistr('\000a')||
'    else'||unistr('\000a')||
'      sys.htp.p(apex_escape.html(c2.application_name));'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'sys.htp.p(''</h1>'');'||unistr('\000a')||
'sys.htp.p(''<ul';

s:=s||' class="vapList">'');'||unistr('\000a')||
''||unistr('\000a')||
'  for c2 in (select version from apex_applications where application_id = :APP_ID) loop'||unistr('\000a')||
'    sys.htp.p('' <li>'');'||unistr('\000a')||
'    sys.htp.p(''   <span class="vLabel">App Version</span>'');'||unistr('\000a')||
'    sys.htp.p(''   <span class="vValue">''||apex_escape.html(c2.version)||''</span>'');'||unistr('\000a')||
'    sys.htp.p('' </li>'');'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
''||unistr('\000a')||
'sys.htp.p('' <li>'');'||unistr('\000a')||
'sys.htp.p(''   <span class="vLabel">Pages</span>'');'||unistr('\000a')||
'sys.htp.p('' ';

s:=s||'  <span class="vValue">'');'||unistr('\000a')||
'  for c2 in (select to_char(PAGES,''999G999G990'') pages from apex_applications where application_id = :APP_ID) loop'||unistr('\000a')||
'    sys.htp.p(c2.pages);'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'sys.htp.p(''</span>'');'||unistr('\000a')||
'sys.htp.p('' </li>'');'||unistr('\000a')||
''||unistr('\000a')||
'sys.htp.p('' <li>'');'||unistr('\000a')||
'sys.htp.p(''   <span class="vLabel">Vendor</span>'');'||unistr('\000a')||
'sys.htp.p(''   <span class="vValue">Oracle'');'||unistr('\000a')||
'sys.htp.p(''</span>'');'||unistr('\000a')||
'sys.htp.p('' </li>'');'||unistr('\000a')||
'sys.htp.p(''</ul>''';

s:=s||');';

wwv_flow_api.create_page_plug (
  p_id=> 4168834315673614925 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 15,
  p_plug_name=> 'Help Side',
  p_region_name=>'',
  p_parent_plug_id=>4168834145114614925 + wwv_flow_api.g_id_offset,
  p_region_css_classes=>'helpSide',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1020541067266437568+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
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
  p_id=> 4168834542442614931 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 15,
  p_plug_name=> 'Help Content',
  p_region_name=>'',
  p_parent_plug_id=>4168834145114614925 + wwv_flow_api.g_id_offset,
  p_region_css_classes=>'helpMain',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1020541067266437568+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
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
s:=s||'<h2>Features</h2>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li>Interactive Reports and Standard "Classic" Reports</li>'||unistr('\000a')||
'<li>Data Display and Data Entry</li>'||unistr('\000a')||
'<li>Charts, Flash Charting and CSS Charting</li>'||unistr('\000a')||
'<li>Validations</li>'||unistr('\000a')||
'<li>Dynamic Actions (First page of Create Order Wizard)</li>'||unistr('\000a')||
'<li>Simple Search</li>'||unistr('\000a')||
'<li>Page Branching and Linking</li>'||unistr('\000a')||
'<li>Tagging</li>'||unistr('\000a')||
'<li>Wizards (see Enter New Order)</li>'||unistr('\000a')||
'<li>Tabs with Conditional Disp';

s:=s||'lay of Administration Tab</li>'||unistr('\000a')||
'<li>File Upload and Download</li>'||unistr('\000a')||
'<li>List Controls (reference Reports tab)</li>'||unistr('\000a')||
'<li>Tree Control (reference Reports tab then Product Order Tree)</li>'||unistr('\000a')||
'<li>Map display (reference Reports tab)</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'</p>';

wwv_flow_api.create_page_plug (
  p_id=> 4168834736001614932 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 15,
  p_plug_name=> 'Features',
  p_region_name=>'',
  p_parent_plug_id=>4168834542442614931 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 80,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
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
s:=s||'<h2>About This Application</h2>'||unistr('\000a')||
'<p>This application highlights many Oracle Application Express features and functions.  The application is a simplified sales tracking applications featuring customers, products and sales sample data.  Use this application to familiarize yourself with basic Oracle Application Express functionality.</p>';

wwv_flow_api.create_page_plug (
  p_id=> 4168834917684614932 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 15,
  p_plug_name=> 'About this Application',
  p_region_name=>'',
  p_parent_plug_id=>4168834542442614931 + wwv_flow_api.g_id_offset,
  p_region_css_classes=>'aboutApp',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
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
s:=s||'<H2>Getting Started</h2>'||unistr('\000a')||
'<p>Run the application as a developer; at the bottom of the page will be buttons for viewing the page in the Application Express Application Builder. Click on the "Edit Page X" button to see how the pages are defined.</p>'||unistr('\000a')||
'<p>If you have questions, ask them on the <a href="https://forums.oracle.com/forums/forum.jspa?forumID=137">OTN Forum</a>.</p>';

wwv_flow_api.create_page_plug (
  p_id=> 4168835116508614933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 15,
  p_plug_name=> 'Quick Start',
  p_region_name=>'',
  p_parent_plug_id=>4168834542442614931 + wwv_flow_api.g_id_offset,
  p_region_css_classes=>'textRegion',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
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
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 4168836028260614936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_computation_sequence => 10,
  p_computation_item=> 'LAST_VIEW',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '31',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 15
--
 
begin
 
null;
end;
null;
 
end;
/

 
