prompt --application/shared_components/navigation/lists/navigation_tabs
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(455034182148612163)
,p_name=>'Navigation Tabs'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(455382585425656490)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home u-color-15'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(455034295602612164)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Team Members'
,p_list_item_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-users u-color-4'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(455034728704612165)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Projects'
,p_list_item_link_target=>'f?p=&APP_ID.:220:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-folder-o u-color-1'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(455035157939612165)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Milestones'
,p_list_item_link_target=>'f?p=&APP_ID.:230:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-flag-o u-color-8'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(455035496050612165)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Tasks'
,p_list_item_link_target=>'f?p=&APP_ID.:240:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-check-square-o u-color-10'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
