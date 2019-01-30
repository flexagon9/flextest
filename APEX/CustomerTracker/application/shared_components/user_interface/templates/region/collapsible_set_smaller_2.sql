--application/shared_components/user_interface/templates/region/collapsible_set_smaller
prompt  ......region template 1725025810018723828
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1725025810018723828 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="collapsible-set" data-mini="true" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'#SUB_REGIONS#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Collapsible Set-Smaller'
 ,p_theme_id => 150
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

