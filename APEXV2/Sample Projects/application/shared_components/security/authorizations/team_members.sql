prompt --application/shared_components/security/authorizations/team_members
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(23566832629885713622)
,p_name=>'Team Members'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from eba_demo_proj_team_members',
'where upper(username) = upper(:APP_USER)'))
,p_error_message=>'You must be a team member to use this application.'
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
