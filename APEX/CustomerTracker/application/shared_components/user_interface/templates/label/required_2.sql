--application/shared_components/user_interface/templates/label/required
prompt  ......label template 1725031094224723832
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1725031094224723832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="#IMAGE_PREFIX#themes/theme_21/images/required.png" alt="#VALUE_REQUIRED#">',
  p_template_body2=>'</label>',
  p_before_item=>'<div data-role="fieldcontain">',
  p_after_item=>'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 150,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
