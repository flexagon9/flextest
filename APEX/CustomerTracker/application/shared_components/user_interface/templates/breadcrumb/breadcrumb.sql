--application/shared_components/user_interface/templates/breadcrumb/breadcrumb
prompt  ......template 1024084255978455932
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 1024084255978455932 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb',
  p_before_first=>'',
  p_current_page_option=>'#NAME#',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;&gt;&nbsp;',
  p_after_last=>'',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 50,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

