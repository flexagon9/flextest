prompt --application/shared_components/user_interface/lovs/numbers_1_to_9
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4523116135506722602)
,p_lov_name=>'NUMBERS 1 TO 9'
,p_lov_query=>'.'||wwv_flow_api.id(4523116135506722602)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4523116343375722610)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'1'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4523116553340722615)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'2'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4523116738920722615)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'3'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4523116943506722615)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'4'
,p_lov_return_value=>'4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4523117134613722615)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'5'
,p_lov_return_value=>'5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4523117327400722615)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'6'
,p_lov_return_value=>'6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4523117554203722615)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'7'
,p_lov_return_value=>'7'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4523117734363722615)
,p_lov_disp_sequence=>80
,p_lov_disp_value=>'8'
,p_lov_return_value=>'8'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4523117934986722615)
,p_lov_disp_sequence=>90
,p_lov_disp_value=>'9'
,p_lov_return_value=>'9'
);
end;
/
