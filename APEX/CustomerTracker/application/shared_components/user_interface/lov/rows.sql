--application/shared_components/user_interface/lov/rows
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 4169749628008485941 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'ROWS',
  p_lov_query=> '.'||to_char(4169749628008485941 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>4169749928531485945 + wwv_flow_api.g_id_offset,
  p_lov_id=>4169749628008485941 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>10,
  p_lov_disp_value=>'5',
  p_lov_return_value=>'5',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>4169750138768485945 + wwv_flow_api.g_id_offset,
  p_lov_id=>4169749628008485941 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>20,
  p_lov_disp_value=>'10',
  p_lov_return_value=>'10',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>4169750329561485945 + wwv_flow_api.g_id_offset,
  p_lov_id=>4169749628008485941 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>30,
  p_lov_disp_value=>'15',
  p_lov_return_value=>'15',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>4169750530549485946 + wwv_flow_api.g_id_offset,
  p_lov_id=>4169749628008485941 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>40,
  p_lov_disp_value=>'20',
  p_lov_return_value=>'20',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>4169750726425485948 + wwv_flow_api.g_id_offset,
  p_lov_id=>4169749628008485941 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>50,
  p_lov_disp_value=>'50',
  p_lov_return_value=>'50',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>4169750935923485948 + wwv_flow_api.g_id_offset,
  p_lov_id=>4169749628008485941 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>60,
  p_lov_disp_value=>'100',
  p_lov_return_value=>'100',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>4169751141669485948 + wwv_flow_api.g_id_offset,
  p_lov_id=>4169749628008485941 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>70,
  p_lov_disp_value=>'500',
  p_lov_return_value=>'500',
  p_lov_data_comment=> '');
 
null;
 
end;
/

