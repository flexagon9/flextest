--application/shared_components/user_interface/templates/region/control_group
prompt  ......region template 1730229017538625822
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1730229017538625822 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div data-role="controlgroup" data-type="horizontal" style="margin: 0 auto;">#BODY#</div>'
 ,p_page_plug_template_name => 'Control Group'
 ,p_theme_id => 150
 ,p_theme_class_id => 17
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...List Templates
--
