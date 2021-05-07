prompt --application/shared_components/user_interface/lovs/link_types
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1082954616262371152)
,p_lov_name=>'LINK TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(1082954616262371152)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1082954906847371157)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'URL'
,p_lov_return_value=>'URL'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1082955348365371163)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Application'
,p_lov_return_value=>'Application'
);
end;
/
