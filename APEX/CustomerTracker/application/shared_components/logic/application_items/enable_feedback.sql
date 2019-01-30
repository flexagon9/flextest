--application/shared_components/logic/application_items/enable_feedback
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 4168844939890785522 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'ENABLE_FEEDBACK'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'N'
  );
 
end;
/

