--application/shared_components/logic/application_items/g_page_info
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 7554217609844730919 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_PAGE_INFO'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
  );
 
end;
/

