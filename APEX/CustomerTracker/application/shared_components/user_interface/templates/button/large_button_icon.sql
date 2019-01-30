--application/shared_components/user_interface/templates/button/large_button_icon
prompt  ......Button Template 1020554846275437579
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 1020554846275437579 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Large Button - Icon'
 ,p_template => 
'<button class="uButtonLarge iconButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span><i class="iL"></i>#LABEL#<i class="iR"></i></span></button> '
 ,p_hot_template => 
'<button class="uButtonLarge uHotButton iconButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span><i class="iL"></i>#LABEL#<i class="iR"></i></span></button> '
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_theme_id => 25
  );
null;
 
end;
/

