prompt --application/pages/page_00076
begin
wwv_flow_api.create_page(
 p_id=>76
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Time Zone Preference'
,p_step_title=>'Time Zone Preference'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141354470818444)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'  Select your preferred time zone and click the <strong>Apply Changes</strong> button to set your time zone. Click the <strong>Cancel</strong> button to leave this page.',
'</p>',
'<p>',
'Various other functions in this app record and report timestamps according to this setting.</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180111133935'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4396775449037574235)
,p_plug_name=>'Preference'
,p_region_template_options=>'t-Alert--defaultIcons:t-Alert--info:t-Alert--wizard'
,p_plug_template=>wwv_flow_api.id(1225681960450288316)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4396776341334590926)
,p_button_sequence=>10
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4396776551181590927)
,p_button_sequence=>20
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4396776034062588845)
,p_branch_action=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 02-MAR-2012 10:23 by MIKE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4396775757133586104)
,p_name=>'P76_TIMEZONE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4396775449037574235)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return apex_util.get_session_time_zone;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Time Zone'
,p_source=>'select timezone_preference from eba_bt_tz_pref where userid = :APP_USER'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct tzname d, tzname r',
'  from V$TIMEZONE_NAMES',
' order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704949468288344)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4396778242766619788)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set time zone'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   c integer := 0;',
'begin',
'   for c1 in (select id, timezone_preference ',
'              from eba_bt_tz_pref ',
'              where userid = :APP_USER) loop',
'      update eba_bt_tz_pref',
'      set timezone_preference = nvl(:P76_TIMEZONE,''UTC'')',
'      where id = c1.id;',
'      c := c + 1;',
'   end loop;',
'   if c = 0 then',
'      insert into eba_bt_tz_pref (userid, timezone_preference)',
'      values (:APP_USER,:P76_TIMEZONE);',
'   end if;',
'   APEX_UTIL.SET_SESSION_TIME_ZONE (  ',
'          P_TIME_ZONE => :P76_TIMEZONE); ',
'   commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Time Zone Set'
);
end;
/
