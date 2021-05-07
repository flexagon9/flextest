prompt --application/shared_components/user_interface/lovs/notification_type
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4101619754166275156)
,p_lov_name=>'NOTIFICATION TYPE'
,p_lov_query=>'.'||wwv_flow_api.id(4101619754166275156)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4101620050448275160)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Warning'
,p_lov_return_value=>'YELLOW'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4101620253560275162)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Critical'
,p_lov_return_value=>'RED'
);
end;
/
