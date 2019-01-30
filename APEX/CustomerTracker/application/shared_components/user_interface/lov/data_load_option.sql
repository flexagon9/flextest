--application/shared_components/user_interface/lov/data_load_option
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 7708989683543876420 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'DATA_LOAD_OPTION',
  p_lov_query=> '.'||to_char(7708989683543876420 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>7708989979715876423 + wwv_flow_api.g_id_offset,
  p_lov_id=>7708989683543876420 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>10,
  p_lov_disp_value=>'Upload file, comma separated (*.csv) or tab delimited',
  p_lov_return_value=>'UPLOAD',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>7708990188186876427 + wwv_flow_api.g_id_offset,
  p_lov_id=>7708989683543876420 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>20,
  p_lov_disp_value=>'Copy and Paste',
  p_lov_return_value=>'PASTE',
  p_lov_data_comment=> '');
 
null;
 
end;
/

