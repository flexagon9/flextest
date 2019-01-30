--application/shared_components/user_interface/templates/label/no_label_for_screenreaders
prompt  ......label template 1725030908523723831
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1725030908523723831 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label (For Screenreaders)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#">',
  p_template_body2=>'</label>',
  p_before_item=>'<div data-role="fieldcontain" class="ui-hide-label">',
  p_after_item=>'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 150,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

