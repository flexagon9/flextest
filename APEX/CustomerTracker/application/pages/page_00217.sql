--application/pages/page_00217
prompt  ...PAGE 217: Select Items
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 217
 ,p_user_interface_id => 1725024220874723827 + wwv_flow_api.g_id_offset
 ,p_name => 'Select Items'
 ,p_step_title => 'Create Order'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Enter New Order'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188011359373082 + wwv_flow_api.g_id_offset
 ,p_step_template => 1024076559711455926 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20130213084256'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'declare'||unistr('\000a')||
'  l_customer_id varchar2(30) := :P216_CUSTOMER_ID;'||unistr('\000a')||
'begin'||unistr('\000a')||
'--'||unistr('\000a')||
'-- display customer information'||unistr('\000a')||
'--'||unistr('\000a')||
'sys.htp.p(''<div class="demoCustomerInfo">'');'||unistr('\000a')||
'if :P216_CUSTOMER_OPTIONS = ''EXISTING'' then'||unistr('\000a')||
'  for x in (select * from demo_customers where customer_id = l_customer_id) loop'||unistr('\000a')||
'    sys.htp.p(''<div class="demoCustomerInfo">'');'||unistr('\000a')||
'    sys.htp.p(''<strong>Customer:</strong>'');'||unistr('\000a')||
'    sys.htp.p(''<p>'');'||unistr('\000a')||
'    sys.htp';

s:=s||'.p(apex_escape.html(x.cust_first_name) || '' '' ||'||unistr('\000a')||
'    apex_escape.html(x.cust_last_name) || ''<br />'');'||unistr('\000a')||
'    sys.htp.p(apex_escape.html(x.cust_street_address1) || ''<br />'');'||unistr('\000a')||
'    if x.cust_street_address2 is not null then'||unistr('\000a')||
'      sys.htp.p(apex_escape.html(x.cust_street_address2) || ''<br />'');'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    sys.htp.p(apex_escape.html(x.cust_city) || '', '' ||'||unistr('\000a')||
'    apex_escape.html(x.cust_state) || ''  '' |';

s:=s||'|'||unistr('\000a')||
'    apex_escape.html(x.cust_postal_code));'||unistr('\000a')||
'    sys.htp.p(''</p>'');'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'else'||unistr('\000a')||
'  sys.htp.p(''<strong>Customer:</strong>'');'||unistr('\000a')||
'  sys.htp.p(''<p>'');'||unistr('\000a')||
'  sys.htp.p(apex_escape.html(:P216_CUST_FIRST_NAME) || '' '' || apex_escape.html(:P216_CUST_LAST_NAME) || ''<br />'');'||unistr('\000a')||
'  sys.htp.p(apex_escape.html(:P216_CUST_STREET_ADDRESS1) || ''<br />'');'||unistr('\000a')||
'  if :P216_CUST_STREET_ADDRESS2 is not null then'||unistr('\000a')||
'    sys.htp.p(ape';

s:=s||'x_escape.html(:P216_CUST_STREET_ADDRESS2) || ''<br />'');'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  sys.htp.p(apex_escape.html(:P216_CUST_CITY) || '', '' ||'||unistr('\000a')||
'  apex_escape.html(:P216_CUST_STATE) || ''  '' ||'||unistr('\000a')||
'  apex_escape.html(:P216_CUST_POSTAL_CODE));'||unistr('\000a')||
'  sys.htp.p(''</p>'');'||unistr('\000a')||
'end if;'||unistr('\000a')||
'sys.htp.p(''</div>'');'||unistr('\000a')||
'--'||unistr('\000a')||
'-- display products'||unistr('\000a')||
'--'||unistr('\000a')||
'sys.htp.p(''<div class="demoProducts" >'');'||unistr('\000a')||
'sys.htp.p(''<table width="100%" cellspacing="0" cellpadding="0" bor';

s:=s||'der="0">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr><th class="left">Product</th><th>Price</th><th></th></tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody>'');'||unistr('\000a')||
'for c1 in (select product_id, product_name,  list_price, ''Add to Cart'' add_to_order'||unistr('\000a')||
'from demo_product_info'||unistr('\000a')||
'where product_avail = ''Y'''||unistr('\000a')||
'order by product_name) loop'||unistr('\000a')||
'   sys.htp.p(''<tr><td class="left">'' || apex_escape.html(c1.product_name)||''</td><td>''||trim(to_char(c1.list_price,''999G999G990D00''))||'||unistr('\000a')||
'    ';

s:=s||'    ''</td><td><a href="''||apex_util.prepare_url(''f?p=&APP_ID.:217:''||:app_session||'':ADD:::P217_PRODUCT_ID:''||'||unistr('\000a')||
'        c1.product_id)||''" class="uButton"><span>Add</span></a></td></tr>'');'||unistr('\000a')||
'end loop;'||unistr('\000a')||
'sys.htp.p(''</tbody></table>'');'||unistr('\000a')||
'sys.htp.p(''</div>'');'||unistr('\000a')||
'--'||unistr('\000a')||
'-- display current order'||unistr('\000a')||
'--'||unistr('\000a')||
'sys.htp.p(''<div class="demoProducts" >'');'||unistr('\000a')||
'sys.htp.p(''<table width="100%" cellspacing="0" cellpadding="0" border="0">'||unistr('\000a')||
'<t';

s:=s||'head>'||unistr('\000a')||
'<tr><th class="left">Current Order</th></tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table width="100%" cellspacing="0" cellpadding="0" border="0">'||unistr('\000a')||
'<tbody>'');'||unistr('\000a')||
''||unistr('\000a')||
'declare'||unistr('\000a')||
'    c number := 0; t number := 0;'||unistr('\000a')||
'begin'||unistr('\000a')||
'-- loop over cart values'||unistr('\000a')||
'for c1 in (select c001 pid, c002 i, to_number(c003) p, count(c002) q, sum(c003) ep,  ''Remove'' remove'||unistr('\000a')||
'from apex_collections'||unistr('\000a')||
'where collection_name = ''ORDER'''||unistr('\000a')||
'group by c001, c002, c003'||unistr('\000a')||
'o';

s:=s||'rder by c002)'||unistr('\000a')||
'loop'||unistr('\000a')||
'sys.htp.p(''<div class="sideCartItem"><a href="''||'||unistr('\000a')||
'    apex_util.prepare_url(''f?p=&APP_ID.:217:&SESSION.:REMOVE:::P217_PRODUCT_ID:''||apex_escape.html(c1.pid))||'||unistr('\000a')||
'    ''"><img src="#IMAGE_PREFIX#delete.gif" alt="Remove from cart" title="Remove from cart" /></a>&nbsp;&nbsp;'||unistr('\000a')||
'    ''||apex_escape.html(c1.i)||'''||unistr('\000a')||
'    <span>''||trim(to_char(c1.p,''$999G999G999D00''))||''</span>'||unistr('\000a')||
'    <span>Quantit';

s:=s||'y: ''||c1.q||''</span>'||unistr('\000a')||
'    <span class="subtotal">Subtotal: ''||trim(to_char(c1.ep,''$999G999G999D00''))||''</span>'||unistr('\000a')||
'</div>'');'||unistr('\000a')||
'   c := c + 1;'||unistr('\000a')||
'   t := t + c1.ep;'||unistr('\000a')||
''||unistr('\000a')||
'end loop;'||unistr('\000a')||
'sys.htp.p(''</tbody></table>'');'||unistr('\000a')||
''||unistr('\000a')||
'if c > 0 then'||unistr('\000a')||
'    sys.htp.p(''<div class="sideCartTotal">'||unistr('\000a')||
'    <p>Items: <span>''||c||''</span></p>'||unistr('\000a')||
'    <p class="sideCartTotal">Total: <span>''||trim(to_char(t,''$999G999G999D00''))||''</span></p>'||unistr('\000a')||
'</div>'');'||unistr('\000a')||
'els';

s:=s||'e'||unistr('\000a')||
'    sys.htp.p(''<p class="sideCartTotal">You have no items in your current order.</p>'');'||unistr('\000a')||
'end if;'||unistr('\000a')||
'end;'||unistr('\000a')||
'sys.htp.p(''</div>'');'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_plug (
  p_id=> 1371888784251977853 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 217,
  p_plug_name=> 'Select Items',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1024081552276455930+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_list_template_id=> 1024082775010455931+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 1725024315711723827+ wwv_flow_api.g_id_offset,
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
  p_id=> 1371926596144015017 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 217,
  p_plug_name=> 'Butons',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => true,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
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
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1372137197705153888 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 217,
  p_plug_name=> 'Max Quantity',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => true,
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
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'begin'||unistr('\000a')||
'  for c1 in (select c001 pid, sum(c004) prod_count'||unistr('\000a')||
'             from wwv_flow_collections'||unistr('\000a')||
'             where collection_name = ''ORDER'''||unistr('\000a')||
'             group by c001'||unistr('\000a')||
'            ) loop'||unistr('\000a')||
'    if c1.prod_count >= 10 then'||unistr('\000a')||
'      return true;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  return false;'||unistr('\000a')||
'end;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 1371927500970022017 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 217,
  p_button_sequence=> 10,
  p_button_plug_id => 1371926596144015017+wwv_flow_api.g_id_offset,
  p_button_name    => 'Previous',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> '&lt Previous',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:216:&SESSION.::&DEBUG.:217::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1371926805853015018 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 217,
  p_button_sequence=> 20,
  p_button_plug_id => 1371926596144015017+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:205:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 1371926981949015018 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 217,
  p_button_sequence=> 30,
  p_button_plug_id => 1371926596144015017+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(1024084059975455931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Place Order',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_cattributes=>'label="NEXT"',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>1372058103437494643 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 217,
  p_branch_name=> 'Next',
  p_branch_action=> 'f?p=&APP_ID.:218:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1371888597548977853 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 217,
  p_name=>'P217_CUSTOMER_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1371888784251977853+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1371889007671977854 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 217,
  p_name=>'P217_PRODUCT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1371888784251977853+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1372137576583175696 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 217,
  p_name=>'P217_MAX_VALUE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 1372137197705153888+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_post_element_text=>'Quantity for each Product must be between 1 and 10',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
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
  p_field_template=> 1024083468939455931+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 1371889490735977855 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 217,
  p_computation_sequence => 10,
  p_computation_item=> 'P217_CUSTOMER_NAME',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'select cust_first_name || '' '' || cust_last_name from demo_customers where customer_id = :P216_CUSTOMER_ID',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 1372131798142907325 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 217,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Product must be selected',
  p_validation_sequence=> 10,
  p_validation => 'apex_collection.collection_member_count(''ORDER'') >= 1',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'At least one product must be added.',
  p_always_execute=>'N',
  p_when_button_pressed=> 1371926981949015018 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'    l_order_id    number;'||unistr('\000a')||
'    l_customer_id varchar2(30) := :P216_CUSTOMER_ID;'||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'    -- Create New Customer'||unistr('\000a')||
'    if :P216_CUSTOMER_OPTIONS = ''NEW'' then'||unistr('\000a')||
'        insert into DEMO_CUSTOMERS ('||unistr('\000a')||
'            CUST_FIRST_NAME,'||unistr('\000a')||
'            CUST_LAST_NAME,'||unistr('\000a')||
'            CUST_STREET_ADDRESS1,'||unistr('\000a')||
'            CUST_STREET_ADDRESS2,'||unistr('\000a')||
'            CUST_CITY,'||unistr('\000a')||
'            CUST_STATE,'||unistr('\000a')||
'            CUST_POSTAL_COD';

p:=p||'E,'||unistr('\000a')||
'            CUST_EMAIL,'||unistr('\000a')||
'            PHONE_NUMBER1,'||unistr('\000a')||
'            PHONE_NUMBER2,'||unistr('\000a')||
'            URL,'||unistr('\000a')||
'            CREDIT_LIMIT,'||unistr('\000a')||
'            TAGS)'||unistr('\000a')||
'          values ('||unistr('\000a')||
'            :P216_CUST_FIRST_NAME,'||unistr('\000a')||
'            :P216_CUST_LAST_NAME,'||unistr('\000a')||
'            :P216_CUST_STREET_ADDRESS1,'||unistr('\000a')||
'            :P216_CUST_STREET_ADDRESS2,'||unistr('\000a')||
'            :P216_CUST_CITY,'||unistr('\000a')||
'            :P216_CUST_STATE,'||unistr('\000a')||
'            :P216_CUST_POSTAL_C';

p:=p||'ODE,'||unistr('\000a')||
'            :P216_CUST_EMAIL,'||unistr('\000a')||
'            :P216_PHONE_NUMBER1,'||unistr('\000a')||
'            :P216_PHONE_NUMBER2,'||unistr('\000a')||
'            :P216_URL,'||unistr('\000a')||
'            :P216_CREDIT_LIMIT,'||unistr('\000a')||
'            :P216_TAGS)'||unistr('\000a')||
'          returning customer_id into l_customer_id;'||unistr('\000a')||
''||unistr('\000a')||
'          :P216_CUSTOMER_ID := l_customer_id;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'    -- Insert a row into the Order Header table'||unistr('\000a')||
'    insert into demo_orders(customer_id, order_total, order_';

p:=p||'timestamp, user_name)'||unistr('\000a')||
'       values(l_customer_id, null, systimestamp, upper(:APP_USER)) returning order_id into l_order_id;'||unistr('\000a')||
'    commit;'||unistr('\000a')||
''||unistr('\000a')||
'    -- Loop through the ORDER collection and insert rows into the Order Line Item table'||unistr('\000a')||
'    for x in (select c001, c003, sum(c004) c004 from apex_collections '||unistr('\000a')||
'               where collection_name = ''ORDER'' group by c001, c003)'||unistr('\000a')||
'    loop'||unistr('\000a')||
'        insert into demo_o';

p:=p||'rder_items(order_item_id, order_id, product_id, unit_price, quantity) '||unistr('\000a')||
'             values (null, l_order_id, to_number(x.c001), to_number(x.c003),to_number(x.c004));'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    commit;'||unistr('\000a')||
''||unistr('\000a')||
'    -- Set the item P218_ORDER_ID to the order which was just placed'||unistr('\000a')||
'    :P218_ORDER_ID := l_order_id;'||unistr('\000a')||
''||unistr('\000a')||
'    -- Truncate the collection after the order has been placed'||unistr('\000a')||
'    apex_collection.truncate_collection';

p:=p||'(p_collection_name => ''ORDER'');'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 1371889598846977855 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 217,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Place Order',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>1371926981949015018 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  l_count number := 0;'||unistr('\000a')||
'begin'||unistr('\000a')||
'for x in (select p.rowid, p.* from demo_product_info p where product_id = :P217_PRODUCT_ID)'||unistr('\000a')||
'loop'||unistr('\000a')||
'  select count(*) '||unistr('\000a')||
'  into l_count'||unistr('\000a')||
'  from wwv_flow_collections'||unistr('\000a')||
'  where collection_name = ''ORDER'''||unistr('\000a')||
'  and c001 =  x.product_id;'||unistr('\000a')||
'  if l_count >= 10 then'||unistr('\000a')||
'    exit;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  apex_collection.add_member(p_collection_name => ''ORDER'', '||unistr('\000a')||
'    p_c001 => x.product_id, '||unistr('\000a')||
'    p_c00';

p:=p||'2 => x.product_name,'||unistr('\000a')||
'    p_c003 => x.list_price,'||unistr('\000a')||
'    p_c004 => 1,'||unistr('\000a')||
'    p_c010 => x.rowid);'||unistr('\000a')||
'end loop;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 1371889802647977857 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 217,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Add Product to the ORDER Collection',
  p_process_sql_clob => p,
  p_process_error_message=> 'Quantity must be between 1 and 10',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'ADD',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'for x in '||unistr('\000a')||
'  (select seq_id, c001 from apex_collections '||unistr('\000a')||
'    where collection_name = ''ORDER'' and c001 = :P217_PRODUCT_ID)'||unistr('\000a')||
'loop'||unistr('\000a')||
'apex_collection.delete_member(p_collection_name => ''ORDER'', p_seq => x.seq_id);'||unistr('\000a')||
'end loop;';

wwv_flow_api.create_page_process(
  p_id     => 1371889978627977857 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 217,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Remove Product from the ORDER Collection',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'REMOVE',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 217
--
 
begin
 
null;
end;
null;
 
end;
/

 
