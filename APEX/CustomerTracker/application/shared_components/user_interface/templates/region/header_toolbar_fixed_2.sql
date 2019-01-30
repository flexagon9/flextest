--application/shared_components/user_interface/templates/region/header_toolbar_fixed
prompt  ......region template 1725028214738723829
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1725028214738723829 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="header" data-theme="b" data-position="fixed" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  #PREVIOUS#'||unistr('\000a')||
'  <h1>#PAGE_TITLE#</h1>'||unistr('\000a')||
'  #NEXT#'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</div> <!-- /header -->'
 ,p_page_plug_template_name => 'Header Toolbar (Fixed)'
 ,p_theme_id => 150
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

