prompt --application/shared_components/navigation/lists/project_actions
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(27101803571363997787)
,p_name=>'Project Actions'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(27101803766550997788)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Add Milestone'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_PROJECT_ID:&P11_PROJECT_ID.:'
,p_list_item_icon=>'fa-flag'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(27101804163581997789)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Add Task'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_PROJECT_ID:&P11_PROJECT_ID.:'
,p_list_item_icon=>'fa-check-square-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1082964496039396836)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Add To Do'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:15:P15_PROJECT_ID:&P11_PROJECT_ID.:'
,p_list_item_icon=>'fa-list'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1082964835651398184)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Add Link'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_PROJECT_ID:&P11_PROJECT_ID.:'
,p_list_item_icon=>'fa-link'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(28397304947195478802)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Add Comment'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:13:P13_PROJECT_ID:&P11_PROJECT_ID.:'
,p_list_item_icon=>'fa-comment'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
