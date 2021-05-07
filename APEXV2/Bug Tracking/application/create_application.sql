prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'NICE')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Bug Tracking')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'100')
,p_application_group=>240683658310899915
,p_application_group_name=>'19.1 Productivity Apps'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'E244366F9A9BB2265A5A6D92F59A87A3EF36ACED48ACE57AAE8B778D5F6E7C1D'
,p_checksum_salt_last_reset=>'20150512093404'
,p_bookmark_checksum_function=>'SH512'
,p_max_session_length_sec=>28800
,p_compatibility_mode=>'5.1'
,p_flow_language=>'en-us'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>wwv_flow_string.join(wwv_flow_t_varchar2(
'1.0.31 -> 1.0.32: Changed Notifications region(s) from plsql to report.',
'    Changed navigation bar to native APEX list.',
'1.0.32 -> 1.0.33: Changed Authentication scheme to use new "APEX_PACKAGED_APPLICATIONS" cookie',
'1.0.33 -> 1.0.34: Added confirm modal when enabling ACL',
'1.0.34 -> 1.0.35: Fixed translation issue on "Timeframe (1 Year)" LOV',
'1.0.35 -> 1.0.36: Replaced mixed case column aliases in select statement for "Top Users" Interactive report',
'1.0.39 -> 1.0.40: Added "Rename Application" page and supporting application items, computations, substitution strings, item and region  changes on login pages, and UI Logo text replacement.',
'1.0.42 -> 1.0.43: Add Notifications to Mobile home page.',
'1.0.43 -> 1.0.44: Added "Bulk Add Users" feature',
'1.0.46 -> 1.0.47: Error handling procedure updated to account for bug 17516350',
'1.0.47 -> 1.0.48: Implemented redesigned administrative ACL controls',
'1.0.48 -> 1.0.49: Added Usage Metrics region plugin to page 31 (Bug details)'))
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(9940655991746052768)
,p_application_tab_set=>1
,p_logo_image=>'TEXT:&APPLICATION_TITLE.'
,p_favicons=>'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-bug-tracking.ico"><link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-bug-tracking-16x16.png"><link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/im'
||'g/favicons/app-bug-tracking-32x32.png"><link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-bug-tracking.png">'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'3.1.5'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_runtime_api_usage=>'T'
,p_security_scheme=>wwv_flow_api.id(3797482839588081973)
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'N'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'eba_bt_fw.apex_error_handling'
,p_substitution_string_01=>'ADMIN_EMAIL'
,p_substitution_value_01=>'admin@example.com'
,p_substitution_string_02=>'APP_DATE_FORMAT'
,p_substitution_value_02=>'DD-MON-YYYY'
,p_substitution_string_03=>'GETTING_STARTED_URL'
,p_substitution_value_03=>'#'
,p_substitution_string_04=>'APP_NAME'
,p_substitution_value_04=>'Bug Tracker'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20210414104040'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
