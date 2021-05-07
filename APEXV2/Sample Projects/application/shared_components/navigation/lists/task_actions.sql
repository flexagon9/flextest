prompt --application/shared_components/navigation/lists/task_actions
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(792973629409741253)
,p_name=>'Task Actions'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(792974661156741256)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Add To Do'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:15:P15_PROJECT_ID,P15_TASK_ID:&P31_PROJECT_ID.,&P31_TASK_ID.:'
,p_list_item_icon=>'fa-list'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(792975049272741257)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Add Link'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_PROJECT_ID,P23_TASK_ID:&P31_PROJECT_ID.,&P31_TASK_ID.:'
,p_list_item_icon=>'fa-link'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
