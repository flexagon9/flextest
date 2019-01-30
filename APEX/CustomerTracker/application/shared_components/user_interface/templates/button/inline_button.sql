--application/shared_components/user_interface/templates/button/inline_button
prompt  ......Button Template 1024084059975455931
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 1024084059975455931 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Inline Button'
 ,p_template => 
'<button id="#BUTTON_ID#" type="button" data-inline="true" onclick="#JAVASCRIPT#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
 ,p_hot_template => 
'<button id="#BUTTON_ID#" type="button" data-inline="true" data-theme="b" onclick="#JAVASCRIPT#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 50
  );
null;
 
end;
/

