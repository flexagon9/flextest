--application/shared_components/user_interface/lov/first_row_option
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 7708992189488876435 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'FIRST_ROW_OPTION',
  p_lov_query=> '.'||to_char(7708992189488876435 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>7708992472935876435 + wwv_flow_api.g_id_offset,
  p_lov_id=>7708992189488876435 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>10,
  p_lov_disp_value=>'Yes',
  p_lov_return_value=>'Y',
  p_lov_data_comment=> '');
 
null;
 
end;
/

