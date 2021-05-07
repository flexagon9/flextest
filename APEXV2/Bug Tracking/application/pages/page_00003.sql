prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Activity Calendar'
,p_step_title=>'Activity Calendar'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2508162743716731820)
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(3797424040496072790)
,p_help_text=>'This is a monthly calendar of application activity, reporting distinct users and their total page views by day. Click the <strong><</strong> button to go to the previous month and the <strong>></strong> button to go forward a month. Switch between th'
||'e calendar view to the list view by clicking the <strong>list</strong> button.'
,p_last_upd_yyyymmddhh24miss=>'20170131074332'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2151220070351974037)
,p_plug_name=>'Activity Calendar'
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'lower(USERID) Userid,',
'lower(USERID) ||'' - ''|| trim(to_char(count(*),''999G999G999G990''))   Events,',
'trunc(time_stamp) the_day,',
'to_char(time_stamp,''YYYYMMDD'') yyyymmdd',
'from apex_activity_log l',
'where flow_id = :app_id and userid is not null and userid != ''nobody''',
'group by trunc(time_stamp), lower(USERID), to_char(time_stamp,''YYYYMMDD'')'))
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'THE_DAY'
,p_attribute_03=>'EVENTS'
,p_attribute_05=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:RP,70,RIR:IR_THE_USER,IR_YYYYMMDD,P70_TIMEFRAME:&USERID.,&YYYYMMDD.,14'
,p_attribute_07=>'N'
,p_attribute_09=>'list:navigation'
,p_attribute_13=>'N'
,p_attribute_17=>'Y'
,p_attribute_19=>'N'
,p_attribute_21=>'10'
,p_attribute_22=>'Y'
);
end;
/
