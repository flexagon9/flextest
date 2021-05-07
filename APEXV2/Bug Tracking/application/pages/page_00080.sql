prompt --application/pages/page_00080
begin
wwv_flow_api.create_page(
 p_id=>80
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Bug Synchronization '
,p_step_title=>'Bug Synchronization '
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141354470818444)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(3797358846252064904)
,p_help_text=>'Choose from the Bug Synchronization options provided.'
,p_last_upd_yyyymmddhh24miss=>'20180223141459'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33554722944525100)
,p_plug_name=>'Bug Synchronization Options'
,p_region_template_options=>'#DEFAULT#:i-h320:t-Region--hideHeader:t-Region--noUI:t-Region--hiddenOverflow'
,p_component_template_options=>'u-colors:t-Cards--displayIcons:t-Cards--3cols:t-Cards--basic:t-Cards--animColorFill'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(33553281271525098)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1449126688631763848)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33557050474564236)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225683943093288318)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(9594178551161609111)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1225705996474288347)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(37957041321082099)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
end;
/
