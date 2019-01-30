--application/pages/page_00030
prompt  ...PAGE 30: Search Results
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 30
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Search Results'
 ,p_step_title => 'Sample Database Application - Search Results'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Search Results'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188011359373082 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<style>'||unistr('\000a')||
'ul.sSearchResultsReport span.title span.highlight {'||unistr('\000a')||
'  background-color: #FFEA87;'||unistr('\000a')||
'  text-decoration: underline'||unistr('\000a')||
'  }'||unistr('\000a')||
'ul.sSearchResultsReport span.highlight {'||unistr('\000a')||
'  background-color: #FFEA87;'||unistr('\000a')||
'  }'||unistr('\000a')||
'</style>'
 ,p_step_template => 1020508468417437549 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20130213084239'
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
  p_id=> 4169747432065485927 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 30,
  p_plug_name=> 'Search Filters',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1020543945460437571+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
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
s:=s||'declare'||unistr('\000a')||
'   c pls_integer := 0;'||unistr('\000a')||
'   l_detail varchar2(4000);'||unistr('\000a')||
'   i pls_integer;'||unistr('\000a')||
'   l pls_integer;'||unistr('\000a')||
'   l_max_rows    integer;'||unistr('\000a')||
'begin'||unistr('\000a')||
'l_max_rows := nvl(:P30_ROWS,10);'||unistr('\000a')||
'if :P30_SEARCH is null'||unistr('\000a')||
'and :P30_OPTIONS is null then'||unistr('\000a')||
'   sys.htp.p(''<p>''||'||unistr('\000a')||
'       apex_escape.html(''Please enter at least one search condition.'')||'||unistr('\000a')||
'       ''</p>'');'||unistr('\000a')||
'else'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- PUT YOUR QUERY HERE'||unistr('\000a')||
'  --'||unistr('\000a')||
'  for c1 in (select  1 dispay_seq'||unistr('\000a')||
'   ';

s:=s||'          , customer_id id'||unistr('\000a')||
'             , ''Customer'' type'||unistr('\000a')||
'             , cust_last_name||'', ''||cust_first_name title'||unistr('\000a')||
'             , cust_street_address1||'' ''||cust_street_address2||'', ''||cust_city||'' ''||cust_state||'' ''||cust_postal_code detail'||unistr('\000a')||
'             from DEMO_CUSTOMERS'||unistr('\000a')||
'             where (   instr(upper(cust_first_name),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(cust_last_n';

s:=s||'ame),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(cust_email),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(cust_street_address1),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(cust_street_address2),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(cust_city),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(cust_state),upper(:P30_SEARC';

s:=s||'H)) > 0 '||unistr('\000a')||
'                    or instr(upper(cust_postal_code),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(phone_number1),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(phone_number2),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or :P30_SEARCH is null'||unistr('\000a')||
'                   )'||unistr('\000a')||
'             and instr(:P30_OPTIONS,''C'') > 0'||unistr('\000a')||
'             UNION'||unistr('\000a')||
'             select 2 display_seq'||unistr('\000a')||
' ';

s:=s||'            , product_id id'||unistr('\000a')||
'             , ''Product'' type'||unistr('\000a')||
'             , product_name title'||unistr('\000a')||
'             , category||'' $''||list_price||'' ''||'||unistr('\000a')||
'               (case when length(product_description) > 50 then'||unistr('\000a')||
'                  substr(product_description,1,50)||''...'''||unistr('\000a')||
'                else'||unistr('\000a')||
'                  product_description'||unistr('\000a')||
'                end) detail'||unistr('\000a')||
'             from DEMO_PRODUCT_INFO'||unistr('\000a')||
'             w';

s:=s||'here (   instr(upper(product_name),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(product_description),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(category),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(list_price),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or :P30_SEARCH is null'||unistr('\000a')||
'                   )'||unistr('\000a')||
'             and instr(:P30_OPTIONS,''P'') > 0'||unistr('\000a')||
'        ';

s:=s||'     UNION'||unistr('\000a')||
'             select distinct 3 display_seq'||unistr('\000a')||
'             , o.order_id id'||unistr('\000a')||
'             , ''Order'' type'||unistr('\000a')||
'             , o.order_timestamp||'' $''||o.order_total title'||unistr('\000a')||
'             , c.cust_last_name||'', ''||c.cust_first_name detail'||unistr('\000a')||
'             from DEMO_ORDERS o'||unistr('\000a')||
'             ,    DEMO_CUSTOMERS c'||unistr('\000a')||
'             ,    DEMO_ORDER_ITEMS oi'||unistr('\000a')||
'             ,    DEMO_PRODUCT_INFO p'||unistr('\000a')||
'             where o.c';

s:=s||'ustomer_id = c.customer_id'||unistr('\000a')||
'             and   o.order_id = oi.order_id'||unistr('\000a')||
'             and   oi.product_id = p.product_id'||unistr('\000a')||
'             and   (   instr(upper(o.order_total),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(o.order_timestamp),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(o.order_total),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(c.cust_first_name';

s:=s||'),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(c.cust_last_name),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(p.product_name),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(p.product_description),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or instr(upper(p.category),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'                    or :P30_SEARCH is null'||unistr('\000a')||
'                   )'||unistr('\000a')||
'';

s:=s||'             and instr(:P30_OPTIONS,''O'') > 0'||unistr('\000a')||
'             UNION'||unistr('\000a')||
'             select  4 dispay_seq'||unistr('\000a')||
'             , customer_id id'||unistr('\000a')||
'             , ''Customer'' type'||unistr('\000a')||
'             , cust_last_name||'', ''||cust_first_name title'||unistr('\000a')||
'             , cust_street_address1||'' ''||cust_street_address2||'', ''||cust_city||'' ''||cust_state||'' ''||cust_postal_code detail'||unistr('\000a')||
'             from DEMO_CUSTOMERS'||unistr('\000a')||
'             where ins';

s:=s||'tr(upper(tags),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'             and instr(:P30_OPTIONS,''T'') > 0'||unistr('\000a')||
'             UNION'||unistr('\000a')||
'             select 4 display_seq'||unistr('\000a')||
'             , product_id id'||unistr('\000a')||
'             , ''Product'' type'||unistr('\000a')||
'             , product_name title'||unistr('\000a')||
'             , category||'' $''||list_price||'' ''||'||unistr('\000a')||
'               (case when length(product_description) > 50 then'||unistr('\000a')||
'                  substr(product_description,1,50)||''...';

s:=s||''''||unistr('\000a')||
'                else'||unistr('\000a')||
'                  product_description'||unistr('\000a')||
'                end) detail'||unistr('\000a')||
'             from DEMO_PRODUCT_INFO'||unistr('\000a')||
'             where instr(upper(tags),upper(:P30_SEARCH)) > 0 '||unistr('\000a')||
'             and instr(:P30_OPTIONS,''T'') > 0'||unistr('\000a')||
'             UNION'||unistr('\000a')||
'             select distinct 4 display_seq'||unistr('\000a')||
'             , o.order_id id'||unistr('\000a')||
'             , ''Order'' type'||unistr('\000a')||
'             , o.order_timestamp||'' $''||o.order_t';

s:=s||'otal title'||unistr('\000a')||
'             , c.cust_last_name||'', ''||c.cust_first_name detail'||unistr('\000a')||
'             from DEMO_ORDERS o'||unistr('\000a')||
'             ,    DEMO_CUSTOMERS c'||unistr('\000a')||
'             ,    DEMO_ORDER_ITEMS oi'||unistr('\000a')||
'             ,    DEMO_PRODUCT_INFO p'||unistr('\000a')||
'             where o.customer_id = c.customer_id'||unistr('\000a')||
'             and   o.order_id = oi.order_id'||unistr('\000a')||
'             and   oi.product_id = p.product_id'||unistr('\000a')||
'             and   instr(upper(o.tags),up';

s:=s||'per(:P30_SEARCH)) > 0 '||unistr('\000a')||
'             and instr(:P30_OPTIONS,''T'') > 0'||unistr('\000a')||
'             order by 1'||unistr('\000a')||
'             ) loop'||unistr('\000a')||
'    c := c + 1;'||unistr('\000a')||
'    if c = 1 then'||unistr('\000a')||
'       sys.htp.p(''<ul class="sSearchResultsReport">'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    sys.htp.p(''<li>'');'||unistr('\000a')||
'    sys.htp.prn(''<span class="title">'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- DEFINE DRILL DOWN LINK HERE'||unistr('\000a')||
'    --'||unistr('\000a')||
'    if c1.type = ''Customer'' then'||unistr('\000a')||
'      sys.htp.prn(''<a href="''||apex_util.';

s:=s||'prepare_url(''f?p=''||:APP_ID||'':7:''||:APP_SESSION||'':::7:P7_CUSTOMER_ID,P7_BRANCH:''||apex_escape.html(c1.id)||'',30'')||''">'');'||unistr('\000a')||
'    elsif c1.type = ''Product'' then'||unistr('\000a')||
'      sys.htp.prn(''<a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':6:''||:APP_SESSION||'':::6:P6_PRODUCT_ID,P6_BRANCH:''||apex_escape.html(c1.id)||'',30'')||''">'');'||unistr('\000a')||
'    elsif c1.type = ''Order'' then'||unistr('\000a')||
'      sys.htp.prn(''<a href="''||apex_util.pre';

s:=s||'pare_url(''f?p=''||:APP_ID||'':29:''||:APP_SESSION||'':SEARCH::29:P29_ORDER_ID:''||apex_escape.html(c1.id))||''">'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- ASSIGN PRIMAY ATTRIBUTE HERE, REFERENCE QUERY COLUMN'||unistr('\000a')||
'    --'||unistr('\000a')||
'    l_detail := c1.title;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    i := instr(upper(l_detail),upper(:P30_SEARCH));'||unistr('\000a')||
'    if  i > 0 then'||unistr('\000a')||
'       l := length(:P30_SEARCH);'||unistr('\000a')||
'       l_detail := apex_escape.html(substr(l_detail,1,i-1))||'||unistr('\000a')||
'    ';

s:=s||'      ''<span class="highlight">''||'||unistr('\000a')||
'          apex_escape.html(substr(l_detail,i,l))||''</span>''||'||unistr('\000a')||
'          apex_escape.html(substr(l_detail,i+l));'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    sys.htp.prn(l_detail);                '||unistr('\000a')||
'    sys.htp.prn(''</a></span>'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'    --'||unistr('\000a')||
'    sys.htp.prn(''<span class="description">'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- ASSIGN SECONDARY ATTRIBUTE HERE, REFERENCE QUERY COLUMN'||unistr('\000a')||
'    -- '||unistr('\000a')||
'    l_detail := c1.detail;'||unistr('\000a')||
'';

s:=s||'    --'||unistr('\000a')||
'    i := instr(upper(l_detail),upper(:P30_SEARCH));'||unistr('\000a')||
'    if  i > 0 then'||unistr('\000a')||
'       l := length(:P30_SEARCH);'||unistr('\000a')||
'       l_detail := apex_escape.html(substr(l_detail,1,i-1))||'||unistr('\000a')||
'          ''<span class="highlight">''||'||unistr('\000a')||
'          apex_escape.html(substr(l_detail,i,l))||''</span>''||'||unistr('\000a')||
'          apex_escape.html(substr(l_detail,i+l));'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    sys.htp.prn(l_detail);'||unistr('\000a')||
'    sys.htp.prn(''</span>'');'||unistr('\000a')||
'    sys.h';

s:=s||'tp.prn(''</li>'');'||unistr('\000a')||
'    if c = l_max_rows then'||unistr('\000a')||
'       exit;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  if c > 0 then '||unistr('\000a')||
'    sys.htp.p(''</ul>'');'||unistr('\000a')||
'    sys.htp.p(''<p>''||c||'' results found.</p>'');'||unistr('\000a')||
'  else '||unistr('\000a')||
'    sys.htp.p(''<p>No data found matching your search criteria.</p>'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'end;'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 4169748842346485929 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 30,
  p_plug_name=> 'Search Results',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1020544272523437571+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
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
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 4169747828155485927 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 30,
  p_button_sequence=> 10,
  p_button_plug_id => 4169747432065485927+wwv_flow_api.g_id_offset,
  p_button_name    => 'RESET_REPORT',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Reset',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:1,30::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4169747643131485927 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 30,
  p_button_sequence=> 20,
  p_button_plug_id => 4169747432065485927+wwv_flow_api.g_id_offset,
  p_button_name    => 'SEARCH',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Search',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>4169749517234485939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 30,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 14-DEC-2011 09:16 by SHAKEEB');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4169748033962485927 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 30,
  p_name=>'P30_ROWS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 4169747432065485927+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '10',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Rows',
  p_source=>'10',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'ROWS',
  p_lov=> '.'||to_char(4169749628008485941 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1020553657260437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'WEB_SAFE',
  p_attribute_01 => 'REDIRECT_SET_VALUE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4169748227422485928 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 30,
  p_name=>'P30_OPTIONS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 4169747432065485927+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'C:P:O:T',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Options',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_CHECKBOX',
  p_lov=> 'STATIC2:Customers;C,Products;P,Orders;O,Tags;T',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1020553657260437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'WEB_SAFE',
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
  p_id=>4169748440273485928 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 30,
  p_name=>'P30_SEARCH',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4169747432065485927+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Search',
  p_source=>'&P1_SEARCH.',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_css_classes=> 'fullWidth',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1020553657260437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'WEB_SAFE',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 30
--
 
begin
 
null;
end;
null;
 
end;
/

 
