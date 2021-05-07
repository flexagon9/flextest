prompt --application/shared_components/navigation/lists/reports
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6332843892290810451)
,p_name=>'Reports'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1342742698423475065)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Bugs Filed by Date'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Analysis of bugs filed by date, line chart, pie chart, and report'
,p_list_text_02=>'calendarIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1414017958989749672)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Bugs Fixed by Date'
,p_list_item_link_target=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Analysis of bugs fixed or closed by date, line chart, pie chart, and report'
,p_list_text_02=>'calendarIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1414018796393753703)
,p_list_item_display_sequence=>3
,p_list_item_link_text=>'Filed vs Fixed'
,p_list_item_link_target=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Analysis of bugs filed vs fixed by week; the delta of filed - fixed.'
,p_list_text_02=>'calendarIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1342004813084848418)
,p_list_item_display_sequence=>7
,p_list_item_link_text=>'Filterable List Report'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-sort-alpha-asc'
,p_list_text_01=>'Bugs displayed in list format with options to group by product, status, and priority.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6366388575699998062)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Bugs by Assignee'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,38:::'
,p_list_item_icon=>'fa-user'
,p_list_text_01=>'Pie chart of bugs assignees.  Filter by product, status and priority.'
,p_list_text_02=>'chartIcon'
,p_list_text_03=>'View Chart'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4524280850372194685)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Bug Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'View bug file dates on a monthly calendar.'
,p_list_text_02=>'calendarIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2529825946334337175)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Tag Cloud'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tag'
,p_list_text_01=>'View a list of tags with drill down to tagged content.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(983400168932035089)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-dashboard'
,p_list_text_01=>'Bubble chart of bugs per product and other metrics'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
