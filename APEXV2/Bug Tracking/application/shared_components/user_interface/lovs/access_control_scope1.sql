prompt --application/shared_components/user_interface/lovs/access_control_scope1
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(332512666464138055)
,p_lov_name=>'ACCESS CONTROL SCOPE1'
,p_lov_query=>'.'||wwv_flow_api.id(332512666464138055)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(332513116456138061)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Readers'
,p_lov_return_value=>'PUBLIC_READONLY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(332513520598138063)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Contributors'
,p_lov_return_value=>'PUBLIC_CONTRIBUTE'
);
end;
/
