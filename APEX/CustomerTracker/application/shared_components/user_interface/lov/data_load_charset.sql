--application/shared_components/user_interface/lov/data_load_charset
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1724989211833676616 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'DATA_LOAD_CHARSET',
  p_lov_query=> '.'||to_char(1724989211833676616 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724989500078676617 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Unicode UTF-16 Little Endian',
  p_lov_return_value=>'utf-16le',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724989807252676617 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Unicode UTF-16 Big Endian',
  p_lov_return_value=>'utf-16be',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724990094881676617 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'US-ASCII',
  p_lov_return_value=>'us-ascii',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724990420180676618 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Arabic ISO-8859-6',
  p_lov_return_value=>'iso-8859-6',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724990707942676618 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Arabic Windows 1256',
  p_lov_return_value=>'windows-1256',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724990989646676618 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Chinese Big5',
  p_lov_return_value=>'big5',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724991317853676618 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Chinese GBK',
  p_lov_return_value=>'gbk',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724991594560676618 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Cyrilic ISO-8859-5',
  p_lov_return_value=>'iso-8859-5',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724991891660676618 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Cyrilic KOI8-R',
  p_lov_return_value=>'koi8-r',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724992198836676618 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Cyrilic KOI8-U',
  p_lov_return_value=>'koi8-u',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724992515348676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Cyrilic Windows 1251',
  p_lov_return_value=>'windows-1251',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724992819972676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Eastern European ISO-8859-2',
  p_lov_return_value=>'iso-8859-2',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724993118156676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Eastern European Windows 1250',
  p_lov_return_value=>'windows-1250',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724993410243676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Greek ISO-8859-7',
  p_lov_return_value=>'iso-8859-7',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724993698656676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Greek Windows 1253',
  p_lov_return_value=>'windows-1253',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724993992874676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Hebrew ISO-8859-8-i',
  p_lov_return_value=>'iso-8859-8-i',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724994319656676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Hebrew Windows 1255',
  p_lov_return_value=>'windows-1255',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724994604597676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Japanese EUC',
  p_lov_return_value=>'euc-jp',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724994913165676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Japanese Shift JIS',
  p_lov_return_value=>'shift_jis',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724995215372676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Korean EUC',
  p_lov_return_value=>'euc-kr',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724995508668676619 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Northern European ISO-8859-4',
  p_lov_return_value=>'iso-8859-4',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724995817850676620 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Northern European Windows 1257',
  p_lov_return_value=>'windows-1257',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724996102265676620 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Southern European ISO-8859-3',
  p_lov_return_value=>'iso-8859-3',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724996389487676620 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Thai TIS-620',
  p_lov_return_value=>'tis-620',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724996710916676621 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Turkish ISO-8859-9',
  p_lov_return_value=>'iso-8859-9',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724996989677676621 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Turkish Windows 1254',
  p_lov_return_value=>'windows-1254',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724997293883676621 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Unicode UTF-8',
  p_lov_return_value=>'utf-8',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724997589455676621 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Vietnamese Windows 1258',
  p_lov_return_value=>'windows-1258',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724997912156676622 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Western European ISO-8859-1',
  p_lov_return_value=>'iso-8859-1',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1724998213700676622 + wwv_flow_api.g_id_offset,
  p_lov_id=>1724989211833676616 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Western European Windows 1252',
  p_lov_return_value=>'windows-1252',
  p_lov_data_comment=> '');
 
null;
 
end;
/

