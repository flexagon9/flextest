--application/shared_components/user_interface/templates/label/hidden_label_read_by_screen_readers
prompt  ......label template 1020553371836437579
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1020553371836437579 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Hidden Label (Read by Screen Readers)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="visuallyhidden">',
  p_template_body2=>'</label>',
  p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 25,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

