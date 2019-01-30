--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,107),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,107),
  p_owner => nvl(wwv_flow_application_install.get_schema,'FLD'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Sample Database Application'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'F107'),
  p_application_group=>2225829805429239,
  p_application_group_name=>'Sample Applications',
  p_application_group_comment=>'',
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt_last_reset => '20181111095420',
  p_max_session_length_sec=> 28800,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'en',
  p_flow_language_derived_from=> 'SESSION',
  p_allow_feedback_yn=> 'Y',
  p_date_format=> 'DS',
  p_date_time_format=> 'DD-MON-YYYY HH:MIPM',
  p_timestamp_format=> 'DS',
  p_timestamp_tz_format=> 'DS',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '4.2.1 -> 4.2.2: Replaced mixed case column aliases in select statement for "Top Users" Interactive report',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 7826071874460217147 + wwv_flow_api.g_id_offset,
  p_logout_url=> 'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&amp;p_next_flow_page_sess=&APP_ID.:1',
  p_application_tab_set=> 0,
  p_logo_image => 'TEXT:Sample Database Application',
  p_public_url_prefix => '',
  p_public_user=> 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_flow_version=> '4.2.5',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'Y',
  p_browser_frame=>'A',
  p_deep_linking=>'Y',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_authorize_public_pages_yn=>'Y',
  p_csv_encoding=> 'N',
  p_auto_time_zone=> 'N',
  p_include_legacy_javascript=> 'Y',
  p_error_handling_function=> 'sample_pkg.demo_error_handling',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_last_updated_by => 'SYSTEM',
  p_last_upd_yyyymmddhh24miss=> '20181111095420',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

----------------
--package app map
--
begin
  wwv_flow_api.create_pkg_app_map (
    p_id => 57722083452255349 + wwv_flow_api.g_id_offset,
    p_app_id => 8950,
    p_installed_app_id => nvl(wwv_flow_application_install.get_application_id,107),
    p_installed_build_version => 7,
    p_app_locked => 'N',
    p_created => to_date('20181111095410','YYYYMMDDHH24MISS'),
    p_created_by => 'system',
    p_updated => to_date('20181111095410','YYYYMMDDHH24MISS'),
    p_updated_by => 'system');
end;
/
prompt  ...user interfaces
--
 
begin
 
