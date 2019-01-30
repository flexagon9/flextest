--application/shared_components/user_interface/lov/categories
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 7524915799174488797 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'CATEGORIES',
  p_lov_query=> '.'||to_char(7524915799174488797 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>7524916116847488800 + wwv_flow_api.g_id_offset,
  p_lov_id=>7524915799174488797 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Mens',
  p_lov_return_value=>'Mens',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>7524916318322488802 + wwv_flow_api.g_id_offset,
  p_lov_id=>7524915799174488797 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Womens',
  p_lov_return_value=>'Womens',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>7524916493475488802 + wwv_flow_api.g_id_offset,
  p_lov_id=>7524915799174488797 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Accessories',
  p_lov_return_value=>'Accessories',
  p_lov_data_comment=> '');
 
null;
 
end;
/

