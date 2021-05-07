prompt --application/shared_components/navigation/lists/access_control
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(3801644142226773463)
,p_name=>'Access Control '
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3801644358800773463)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Enable'
,p_list_item_link_target=>'javascript:openModal(''confirmEnableACL'');'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Enabling Access Control allows access to the application and its features to be controlled by an Access Control List (ACL).  Until access control is enabled, all authenticated users are administrators.'
,p_list_text_02=>'switchIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3801644949209773464)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Access Control'
,p_list_item_link_target=>'f?p=&APP_ID.:95:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-key'
,p_list_text_01=>'Use to change the Access Control Scope or to disable Access Control.'
,p_list_text_02=>'switchIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3801644651593773463)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Users'
,p_list_item_link_target=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:RP,45,RIR:::'
,p_list_item_icon=>'fa-users'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'eba_bt_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'') = ''Y'''
,p_list_text_01=>'Administrators can define the domain of users and assign each a role.'
,p_list_text_02=>'userIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2622497355294972744)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Username Format'
,p_list_item_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Define the username format for new users in this application.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
