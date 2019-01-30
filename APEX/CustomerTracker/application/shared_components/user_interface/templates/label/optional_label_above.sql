--application/shared_components/user_interface/templates/label/optional_label_above
prompt  ......label template 1020553657260437579
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1020553657260437579 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional (Label Above)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uOptional">',
  p_template_body2=>'</label>'||unistr('\000a')||
'<button class="uButton iconButton iconOnly altButton help itemHelpButton" onclick="uShowItemHelp(''#CURRENT_ITEM_NAME#'');return false;" id="hb_#CURRENT_ITEM_NAME#" type="button" title="#CURRENT_ITEM_HELP_LABEL#"><span><i></i></span></button>'||unistr('\000a')||
'<span class="uItemHelp" data-item-id="#CURRENT_ITEM_NAME#">#CURRENT_ITEM_HELP_TEXT#</span>'||unistr('\000a')||
'<div class="fieldControls">',
  p_before_item=>'<div class="fieldContainer vertical" id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'</div>'||unistr('\000a')||
'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 25,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

