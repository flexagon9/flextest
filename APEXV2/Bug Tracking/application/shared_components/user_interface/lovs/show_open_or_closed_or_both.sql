prompt --application/shared_components/user_interface/lovs/show_open_or_closed_or_both
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1342752977689698528)
,p_lov_name=>'SHOW OPEN OR CLOSED OR BOTH'
,p_lov_query=>'.'||wwv_flow_api.id(1342752977689698528)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1342753133058698536)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'- All -'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1342753454598698540)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Open'
,p_lov_return_value=>'OPEN'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1342753810356698540)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Closed'
,p_lov_return_value=>'CLOSED'
);
end;
/
