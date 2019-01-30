--application/shared_components/logic/application_items/last_view
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 4168662937880864161 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'LAST_VIEW'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'N'
  );
 
end;
/

prompt  ...application level computations
--
 
begin
 
null;
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
