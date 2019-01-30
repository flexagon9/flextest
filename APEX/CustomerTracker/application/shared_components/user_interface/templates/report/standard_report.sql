--application/shared_components/user_interface/templates/report/standard_report
prompt  ......report template 1024081863162455931
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div class="list-view-cell" style="width:#COLUMN_WIDTH_VAL#%">#COLUMN_VALUE#</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1024081863162455931 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard Report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||unistr('\000a')||
'<ul data-role="listview">',
  p_row_template_after_rows =>'</ul>'||unistr('\000a')||
'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<li data-role="list-divider">',
  p_column_heading_template=>'<div class="list-view-cell" id="#COLUMN_HEADER_NAME#" style="width:#COLUMN_WIDTH_VAL#%">#COLUMN_HEADER#</div>',
  p_after_column_heading=>'</li>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-r" data-iconpos="right" data-transition="slide">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-l" data-iconpos="left" data-transition="slide" data-direction="reverse">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-r" data-iconpos="right" data-transition="slide">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-l" data-iconpos="left" data-transition="slide" data-direction="reverse">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 50,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1024081863162455931 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<li>',
  p_row_template_after_last =>'</li>');
exception when others then null;
end;
null;
 
end;
/

