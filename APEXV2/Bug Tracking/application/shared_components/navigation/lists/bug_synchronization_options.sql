prompt --application/shared_components/navigation/lists/bug_synchronization_options
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(33553281271525098)
,p_name=>'Bug Synchronization Options'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33553485566525098)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Add New Product'
,p_list_item_link_target=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP,63:::'
,p_list_item_icon=>'fa-plus'
,p_list_text_01=>'Add a new product to be tracked'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33553926351525099)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Refresh Existing Product(s)'
,p_list_item_link_target=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.:RP,81:::'
,p_list_item_icon=>'fa-refresh'
,p_list_text_01=>'Incremental update of an existing product'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33554274442525099)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'View Sync Logs'
,p_list_item_link_target=>'f?p=&APP_ID.:82:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-eye'
,p_list_text_01=>'View previous refresh timings, errors, and counts.'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
