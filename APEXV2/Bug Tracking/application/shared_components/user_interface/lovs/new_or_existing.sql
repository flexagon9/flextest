prompt --application/shared_components/user_interface/lovs/new_or_existing
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(16739400131217273)
,p_lov_name=>'NEW OR EXISTING'
,p_lov_query=>'.'||wwv_flow_api.id(16739400131217273)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(16739606891217275)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'New Product'
,p_lov_return_value=>'NEW'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(16739947212217277)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Existing Product'
,p_lov_return_value=>'EXISTING'
);
end;
/
