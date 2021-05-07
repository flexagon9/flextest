prompt --application/shared_components/user_interface/lovs/pill_display_as
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1489586479860043362)
,p_lov_name=>'PILL_DISPLAY_AS'
,p_lov_query=>'.'||wwv_flow_api.id(1489586479860043362)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1489586730463043381)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Cards View'
,p_lov_return_value=>'CARDS'
,p_lov_template=>'<span class="t-Icon fa fa-cards" title="#DISPLAY_VALUE#"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span>'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1489587179755043383)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Report View'
,p_lov_return_value=>'REPORT'
,p_lov_template=>'<span class="t-Icon fa fa-table" title="#DISPLAY_VALUE#"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span>'
);
end;
/
