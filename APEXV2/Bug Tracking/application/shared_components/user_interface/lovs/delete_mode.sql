prompt --application/shared_components/user_interface/lovs/delete_mode
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(16745177846378359)
,p_lov_name=>'DELETE MODE'
,p_lov_query=>'.'||wwv_flow_api.id(16745177846378359)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(16745766015378360)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Bugs'
,p_lov_return_value=>'BUGS'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(16745335370378360)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Product and Bugs'
,p_lov_return_value=>'PRODUCT'
);
end;
/
