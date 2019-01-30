--application/shared_components/user_interface/templates/region/footer_toolbar_displays_at_bottom_of_page
prompt  ......region template 1725027293218723829
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1725027293218723829 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="footer" data-theme="b" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  #CHANGE#'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</div> <!-- /footer -->'
 ,p_page_plug_template_name => 'Footer Toolbar (Displays at Bottom of Page)'
 ,p_theme_id => 150
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

