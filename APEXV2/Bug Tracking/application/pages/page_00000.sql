prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_tab_set=>'TS2'
,p_name=>'Default Page'
,p_step_title=>'Default Page'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2509088058952367312)
,p_step_template=>wwv_flow_api.id(1225655852966288293)
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_upd_yyyymmddhh24miss=>'20180220142541'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9594180850946618485)
,p_plug_name=>'Title Bar'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--showBreadcrumb:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(1225683943093288318)
,p_plug_display_sequence=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(9594178551161609111)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1225705996474288347)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'2,4,5,8,9,10,11,13,16,17,18,19,20,24,25,26,28,32,45,47,49,50,51,54,56,57,59,60,61,63,64,69,71,73,74,75,77,79,81,82,83,84,89,93,94,95,96,101,175,1000,1001'
);
end;
/
