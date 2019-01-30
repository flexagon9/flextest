--application/shared_components/user_interface/templates/list/list_view
prompt  ......list template 1024082451958455931
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t3:=t3||'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t5:=t5||'<li data-theme="b">'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t6:=t6||'<li>'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t7:=t7||'<li data-theme="b">'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t8:=t8||'<li>'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

wwv_flow_api.create_list_template (
  p_id=>1024082451958455931 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'List View',
  p_theme_id  => 50,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<ul data-role="listview">',
  p_list_template_after_rows=>'</ul>',
  p_before_sub_list=>'<ul>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

