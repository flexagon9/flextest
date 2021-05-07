prompt --application/shared_components/navigation/lists/bug_loading
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(4522797632230485069)
,p_name=>'Bug Loading'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4522797831280485070)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Load Bugs from Spreadsheet'
,p_list_item_link_target=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:61,71,74,75:::'
,p_list_item_icon=>'fa-file-excel-o'
,p_list_text_01=>'Use a wizard to load bugs from cut and pasted data or from a spreadsheet.'
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(16723487055995351)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Synchronize Bugs'
,p_list_item_link_target=>'f?p=&APP_ID.:80:&SESSION.::&DEBUG.:RP,80:::'
,p_list_item_icon=>'fa-gear'
,p_list_text_01=>'Perform custom bug synchronization from master bug system.'
,p_required_patch=>wwv_flow_api.id(16725495374012530)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(16742011777326865)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Remove Products and Bugs'
,p_list_item_link_target=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.:79:::'
,p_list_item_icon=>'fa-trash-o'
,p_list_text_01=>'Remove all bugs for a given product with option to remove product description.'
,p_required_patch=>wwv_flow_api.id(16725495374012530)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1065981674266382350)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Sync Log'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-search'
,p_list_text_01=>'Sync from external bug system log'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
