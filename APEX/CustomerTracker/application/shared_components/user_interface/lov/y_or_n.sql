--application/shared_components/user_interface/lov/y_or_n
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 7524568917136715135 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'Y OR N',
  p_lov_query=> '.'||to_char(7524568917136715135 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>7524569208156715138 + wwv_flow_api.g_id_offset,
  p_lov_id=>7524568917136715135 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Yes',
  p_lov_return_value=>'Y',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>7524569417877715140 + wwv_flow_api.g_id_offset,
  p_lov_id=>7524568917136715135 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'No',
  p_lov_return_value=>'N',
  p_lov_data_comment=> '');
 
null;
 
end;
/

prompt  ...Application Trees
--
