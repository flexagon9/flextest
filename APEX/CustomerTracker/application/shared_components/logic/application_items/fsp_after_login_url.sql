--application/shared_components/logic/application_items/fsp_after_login_url
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 7523991594910128451 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'FSP_AFTER_LOGIN_URL'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
  );
 
end;
/

