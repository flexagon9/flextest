--application/shared_components/user_interface/templates/region/button_group_vertical
prompt  ......region template 1725025205424723828
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1725025205424723828 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="controlgroup" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'#CLOSE#'||unistr('\000a')||
'#DELETE#'||unistr('\000a')||
'#CREATE#'||unistr('\000a')||
'#EDIT#'||unistr('\000a')||
'#CHANGE#'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Button Group (Vertical)'
 ,p_theme_id => 150
 ,p_theme_class_id => 17
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

