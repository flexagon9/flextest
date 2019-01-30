--application/shared_components/user_interface/themes/blue_responsive
prompt  ......theme 1020555672752437580
begin
wwv_flow_api.create_theme (
  p_id =>1020555672752437580 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 25,
  p_theme_name=>'Blue Responsive',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>1020515051496437553 + wwv_flow_api.g_id_offset,
  p_error_template=>1020500749498437542 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>1020524673830437557 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>1020495151953437539 + wwv_flow_api.g_id_offset,
  p_default_button_template=>1020554059195437579 + wwv_flow_api.g_id_offset,
  p_default_region_template=>1020544272523437571 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>1020544272523437571 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>1020541354291437570 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>1020544272523437571 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>1020544272523437571 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>null + wwv_flow_api.g_id_offset,
  p_default_menur_template=>1020539846911437567 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>1020544272523437571 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>1020542669749437571 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>1020547771357437576 + wwv_flow_api.g_id_offset,
  p_default_label_template=>1020553575279437579 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>1020555244753437579 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>1020555361497437579 + wwv_flow_api.g_id_offset,
  p_default_list_template=>1020552455806437577 + wwv_flow_api.g_id_offset,
  p_default_option_label=>1020553575279437579 + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>1020553875169437579 + wwv_flow_api.g_id_offset);
end;
/
 
