prompt --application/pages/page_00200
begin
wwv_flow_api.create_page(
 p_id=>200
,p_user_interface_id=>wwv_flow_api.id(44535706737386353012)
,p_name=>'Home - Mobile'
,p_step_title=>'Home - Mobile'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(455770727713806832)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_navigation_list_position=>'TOP'
,p_navigation_list_id=>wwv_flow_api.id(455034182148612163)
,p_navigation_list_template_id=>wwv_flow_api.id(39211003846943661)
,p_nav_list_template_options=>'#DEFAULT#:t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_last_upd_yyyymmddhh24miss=>'20180720101226'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420517555770339882)
,p_plug_name=>'Actions'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1947607847624884354)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Open Projects'' as label,',
'        count(*) as value,',
'        ''f?p=''||:APP_ID||'':220:''||:APP_SESSION||'':::'' as url',
'from eba_demo_projects',
'where completed_date is null',
'union all',
'select ''Upcoming Milestones'' as label,',
'        count(*) as value,',
'        ''f?p=''||:APP_ID||'':230:''||:APP_SESSION||'':::'' as url',
'from eba_demo_proj_milestones',
'where due_date > sysdate',
'union all',
'select',
'    ''Incomplete Tasks'' as label,',
'    count(*) as value,',
'    ''f?p=''||:APP_ID||'':240:''||:APP_SESSION||'':::240'' as url',
'from eba_demo_proj_tasks',
'where nvl(is_complete_yn, ''N'') = ''N'''))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'INSET'
,p_attribute_02=>'LABEL'
,p_attribute_08=>'VALUE'
,p_attribute_16=>'&URL.'
);
end;
/
