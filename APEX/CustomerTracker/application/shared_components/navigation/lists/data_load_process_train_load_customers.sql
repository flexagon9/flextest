--application/shared_components/navigation/lists/data_load_process_train_load_customers
 
begin
 
wwv_flow_api.create_list (
  p_id=> 987544972465695246 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Data Load Process Train - Load Customers',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

