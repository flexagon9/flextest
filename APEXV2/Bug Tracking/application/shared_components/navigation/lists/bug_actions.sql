prompt --application/shared_components/navigation/lists/bug_actions
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1233762771935660927)
,p_name=>'Bug Actions'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1233762945303660928)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Add Update'
,p_list_item_link_target=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:64:P64_BUG_ID:&P31_ID.:'
,p_list_item_icon=>'fa-comment'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1233763258163660930)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Add Link'
,p_list_item_link_target=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:73:P73_BUG_ID:&P31_ID.:'
,p_list_item_icon=>'fa-external-link-square'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1233763531239660930)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Add Attachment'
,p_list_item_link_target=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:73:P69_BUG_ID:&P31_ID.:'
,p_list_item_icon=>'fa-paperclip'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1350186860883078177)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Permalink'
,p_list_item_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::P31_ID:&P31_ID.:'
,p_list_item_icon=>'fa-link'
,p_list_item_current_type=>'NEVER'
);
end;
/
