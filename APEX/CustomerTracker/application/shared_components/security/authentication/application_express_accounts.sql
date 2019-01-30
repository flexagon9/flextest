--application/shared_components/security/authentication/application_express_accounts
prompt  ......authentication 7826071874460217147
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 7826071874460217147 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Application Express Accounts'
 ,p_scheme_type => 'NATIVE_APEX_ACCOUNTS'
 ,p_invalid_session_type => 'LOGIN'
 ,p_use_secure_cookie_yn => 'N'
  );
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

prompt  ...plugins
--
