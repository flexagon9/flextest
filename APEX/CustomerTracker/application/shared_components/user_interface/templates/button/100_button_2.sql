--application/shared_components/user_interface/templates/button/100_button
prompt  ......Button Template 1725031207102723832
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 1725031207102723832 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => '100% Button'
 ,p_template => 
'<button id="#BUTTON_ID#" type="button" onclick="#JAVASCRIPT#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
 ,p_hot_template => 
'<button id="#BUTTON_ID#" type="button" data-theme="b" onclick="#JAVASCRIPT#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 150
  );
null;
 
end;
/

