--application/shared_components/user_interface/templates/region/region_with_title
prompt  ......region template 1024081552276455930
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1024081552276455930 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" data-theme="b" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<h3>#TITLE#</h3>'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'#SUB_REGIONS#'||unistr('\000a')||
'#EDIT#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Region (With Title)'
 ,p_theme_id => 50
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

