prompt --application/shared_components/user_interface/shortcuts/timezone
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(4400432532548006709)
,p_shortcut_name=>'TIMEZONE'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return ''<p style="margin-top:10px;clear:both;">''||''Dates and Times are displayed in the ''||',
'''<a href="f?p=''||:APP_ID||'':76:''||:APP_SESSION||''">''||',
'nvl(apex_escape.html(apex_util.get_session_time_zone),''unknown'')||''</a> timezone.</p>'';'))
);
end;
/
