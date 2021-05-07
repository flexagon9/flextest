prompt --application/shared_components/user_interface/lovs/created_or_closed_or_both
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1408561700918814759)
,p_lov_name=>'CREATED OR CLOSED OR BOTH'
,p_lov_query=>'.'||wwv_flow_api.id(1408561700918814759)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1408561855782814763)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Show Created'
,p_lov_return_value=>'CREATED'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1408562226114814763)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Show Closed'
,p_lov_return_value=>'CLOSED'
);
end;
/
