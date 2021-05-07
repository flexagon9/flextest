prompt --application/shared_components/user_interface/lovs/yes_y_no_n
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5596221487882515727)
,p_lov_name=>'YES Y NO N'
,p_lov_query=>'.'||wwv_flow_api.id(5596221487882515727)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5596221687105515730)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5596221874267515730)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'No'
,p_lov_return_value=>'N'
);
end;
/
