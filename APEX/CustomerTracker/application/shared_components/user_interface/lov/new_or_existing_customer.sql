--application/shared_components/user_interface/lov/new_or_existing_customer
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 4168858213028938611 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'NEW OR EXISTING CUSTOMER',
  p_lov_query=> '.'||to_char(4168858213028938611 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>4168858430265938614 + wwv_flow_api.g_id_offset,
  p_lov_id=>4168858213028938611 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>10,
  p_lov_disp_value=>'Existing customer',
  p_lov_return_value=>'EXISTING',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>4168858644356938619 + wwv_flow_api.g_id_offset,
  p_lov_id=>4168858213028938611 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>20,
  p_lov_disp_value=>'New customer',
  p_lov_return_value=>'NEW',
  p_lov_data_comment=> '');
 
null;
 
end;
/

