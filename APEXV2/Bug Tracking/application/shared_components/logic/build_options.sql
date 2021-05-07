prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(16725495374012530)
,p_build_option_name=>'Synchronize from Master System'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allows for custom synchronization between a master bug system.  Use this only if you code a EBA_BT_BUG_REFRESH procedure.'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(1065271160137186238)
,p_build_option_name=>'Show users pending approval'
,p_build_option_status=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the home page of this application a region exists to notify administrative users that new users need to be provided ACL entry.  '
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(2725981753149490323)
,p_build_option_name=>'Content Completeness Widget'
,p_build_option_status=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'This build option controls whether the "Content Completeness" plugin region is displayed on the Bug details page or not.'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(2725982031583500250)
,p_build_option_name=>'Validations Widget'
,p_build_option_status=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'This build option controls whether the "Validations" plugin region is displayed on the Bug details page or not.'
);
end;
/
