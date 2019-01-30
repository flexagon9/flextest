--application/shared_components/user_interface/templates/region/div_region_with_id
prompt  ......region template 1020541067266437568
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1020541067266437568 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> '||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'DIV Region with ID'
 ,p_theme_id => 101
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

