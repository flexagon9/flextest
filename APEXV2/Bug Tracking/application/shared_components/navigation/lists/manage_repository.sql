prompt --application/shared_components/navigation/lists/manage_repository
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5580179187027286590)
,p_name=>'Manage Repository'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5580180290937286595)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Products'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP,6:::'
,p_list_item_icon=>'fa-tag'
,p_list_text_01=>'Define the list of products used to track bugs against.  Define zero or more product versions to target found in, fix by, fixed by releases.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'Manage'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'18'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5580180572218286595)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Product Versions'
,p_list_item_link_target=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-tag'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Define the product version numbers.  Bugs are reported against a product and a version.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'Manage'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'49'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5580179970798286595)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Categories'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,6:::'
,p_list_item_icon=>'fa-bullseye'
,p_list_text_01=>'Categories allow bugs to be classified, improving manageability.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'Manage'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'16'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3799738957127503354)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Statuses'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-edit'
,p_list_text_01=>'Status codes allow you to track the progression and final determination of a bug.  Each status code indicates if bugs of that status are considered open or closed.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3799758134402506236)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Priorities'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-heart-o'
,p_list_text_01=>'Priority codes are used to prioritize the fixing of bugs.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3799777342713508700)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Severity Codes'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-arrows-v'
,p_list_text_01=>'Severity codes are used to define the importance of the bug.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4101853529545299996)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Notifications'
,p_list_item_link_target=>'f?p=&APP_ID.:57:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-comment-o'
,p_list_text_01=>'Define notifications to alert users of important information.  Notifications will appear on this applications home page.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2517324839893936770)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Rename Application'
,p_list_item_link_target=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'Change the application name, displayed on the top left of each page, to one of your choosing.  By default, the application name is &quot;&APP_NAME.&quot;.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2726012658152700741)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Build Options'
,p_list_item_link_target=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-adjust'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID'))
,p_list_text_01=>'Manage the status of build options. Build options allow application functionality to be included or excluded from an application.  Use build options to factor your application.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1955847913862194986)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Manage Sample Data'
,p_list_item_link_target=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:56:::'
,p_list_item_icon=>'fa-database'
,p_list_text_01=>'Add and remove sample data.'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4498087935720781090)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Application Error Log'
,p_list_item_link_target=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:RP,RIR,CIR:::'
,p_list_item_icon=>'fa-alert'
,p_list_text_01=>'Report of all internal errors encountered within the application.'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2509239456425508793)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Manage Assignee Groups'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-sitemap'
,p_list_text_01=>'Bugs can optionally be assigned to groups such as QA, Release Management and Development.  Use this facility to manage the list of available groups.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2506149855734826791)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Page Privileges'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-eye'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Report of the pages within this application and their corresponding access control security level.'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1821813769077228308)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Application Appearance'
,p_list_item_link_target=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-desktop'
,p_list_text_01=>'Change user interface theme style for all users.'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
