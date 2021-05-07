prompt --application/shared_components/navigation/lists/admin_reports
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(711747332915686717)
,p_name=>'Admin Reports'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(711747679072686718)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Activity Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:28:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'View page views by user in a monthly calendar'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(711748083061686718)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Page Views'
,p_list_item_link_target=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:29:::'
,p_list_item_icon=>'fa-eye'
,p_list_text_01=>'Report page view for this application'
,p_list_text_02=>'&P33_PAGE_VIEWS.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(711748459531686718)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Top Users'
,p_list_item_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:30:::'
,p_list_item_icon=>'fa-users'
,p_list_text_01=>'Report user activity for this application'
,p_list_text_02=>'&P33_USER_COUNT.'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
