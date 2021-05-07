prompt --application/shared_components/user_interface/lovs/filter_report_type
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1341998686573791771)
,p_lov_name=>'FILTER REPORT TYPE'
,p_lov_query=>'.'||wwv_flow_api.id(1341998686573791771)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1341999522877791785)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'By Bug'
,p_lov_return_value=>'BUG'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1351232168773761624)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'By Date Filed'
,p_lov_return_value=>'DATE'
);
end;
/
