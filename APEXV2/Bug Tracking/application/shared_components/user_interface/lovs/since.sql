prompt --application/shared_components/user_interface/lovs/since
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(3990156527528091805)
,p_lov_name=>'SINCE'
,p_lov_query=>'.'||wwv_flow_api.id(3990156527528091805)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990156730104091810)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'1 Day'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990156928711091815)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'2 Days'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990157149189091816)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'3 Days'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990157330573091816)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'4 Days'
,p_lov_return_value=>'4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990157548170091816)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'5 Days'
,p_lov_return_value=>'5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990157740978091816)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'6 Days'
,p_lov_return_value=>'6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990157941613091816)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'1 Week'
,p_lov_return_value=>'7'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990158138485091816)
,p_lov_disp_sequence=>80
,p_lov_disp_value=>'2 Weeks'
,p_lov_return_value=>'14'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990158354476091816)
,p_lov_disp_sequence=>90
,p_lov_disp_value=>'3 Weeks'
,p_lov_return_value=>'21'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990158542791091816)
,p_lov_disp_sequence=>100
,p_lov_disp_value=>'4 Weeks'
,p_lov_return_value=>'28'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990158757752091817)
,p_lov_disp_sequence=>110
,p_lov_disp_value=>'5 Weeks'
,p_lov_return_value=>'35'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990158929359091817)
,p_lov_disp_sequence=>120
,p_lov_disp_value=>'6 Weeks'
,p_lov_return_value=>'42'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1413908261856395752)
,p_lov_disp_sequence=>121
,p_lov_disp_value=>'7 weeks'
,p_lov_return_value=>'49'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1413908645603397404)
,p_lov_disp_sequence=>122
,p_lov_disp_value=>'8 Weeks'
,p_lov_return_value=>'56'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1413909093217400082)
,p_lov_disp_sequence=>123
,p_lov_disp_value=>'9 Weeks'
,p_lov_return_value=>'63'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1413909365578402429)
,p_lov_disp_sequence=>124
,p_lov_disp_value=>'10 Weeks'
,p_lov_return_value=>'70'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1413909641744404044)
,p_lov_disp_sequence=>125
,p_lov_disp_value=>'20 Weeks'
,p_lov_return_value=>'140'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1413910022092406278)
,p_lov_disp_sequence=>126
,p_lov_disp_value=>'30 Weeks'
,p_lov_return_value=>'210'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3990159156755091817)
,p_lov_disp_sequence=>130
,p_lov_disp_value=>'1 Year'
,p_lov_return_value=>'365'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1420702611694900474)
,p_lov_disp_sequence=>140
,p_lov_disp_value=>'2  Years'
,p_lov_return_value=>'730'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1420702908096901586)
,p_lov_disp_sequence=>150
,p_lov_disp_value=>'10 Years'
,p_lov_return_value=>'3650'
);
end;
/
