prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(44535706737386353012)
,p_name=>'Home'
,p_step_title=>'Home'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20180720091353'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89146468175352570)
,p_plug_name=>'Oracle APEX Communities and Resources'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(1947607847624884354)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.SAMPLEAPPFOOTER'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23569597225752931703)
,p_plug_name=>'Summary'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(44535680543877352962)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Open Projects'' label',
', count(*) value',
', ''f?p=''||:APP_ID||'':4:''||:APP_SESSION||'':::::'' link',
'from eba_demo_projects ',
'where status_cd != ''COMPLETED''',
'UNION ALL',
'select ''Upcoming Milestones'' label',
', count(*) value',
', ''f?p=''||:APP_ID||'':4:''||:APP_SESSION||'':::::'' link',
'from eba_demo_proj_milestones',
'where due_date > sysdate',
'UNION ALL',
'select ''Open Tasks'' label',
', count(*) value',
', ''f?p=''||:APP_ID||'':4:''||:APP_SESSION||'':::::'' link ',
'from eba_demo_proj_tasks',
'where is_complete_yn = ''N'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'&LINK.'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(23569597411582931704)
,p_name=>'Recent Projects'
,p_template=>wwv_flow_api.id(44535680543877352962)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Timeline--compact'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id project_id',
', t.id',
', null event_modifiers',
', null event_attributes',
', null user_color',
', dbms_lob.getlength(''PHOTO_BLOB'') user_avatar',
', t.full_name user_name',
', nvl(p.completed_date, p.updated) event_date',
', (case p.status_cd ',
'when ''ASSIGNED'' then ''is-removed''',
'when ''IN-PROGRESS'' then ''is-updated''',
'when ''COMPLETED'' then ''is-new''',
'end) event_status',
', (select s.description ',
'   from eba_demo_proj_status s',
'   where s.cd = p.status_cd',
'  ) event_type',
', (case p.status_cd ',
'when ''ASSIGNED'' then ''fa fa-clock-o''',
'when ''IN-PROGRESS'' then ''fa fa-refresh''',
'when ''COMPLETED'' then ''fa fa-check''',
'end) event_icon',
', p.name event_title',
', p.description event_desc',
'from eba_demo_projects p',
', eba_demo_proj_team_members t',
'where p.project_lead = t.id',
'order by p.updated desc'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(44535690552378352978)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569597752059931708)
,p_query_column_id=>1
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Project id'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569597859529931709)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598007598931710)
,p_query_column_id=>3
,p_column_alias=>'EVENT_MODIFIERS'
,p_column_display_sequence=>3
,p_column_heading=>'Event modifiers'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598089402931711)
,p_query_column_id=>4
,p_column_alias=>'EVENT_ATTRIBUTES'
,p_column_display_sequence=>4
,p_column_heading=>'Event attributes'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598158119931712)
,p_query_column_id=>5
,p_column_alias=>'USER_COLOR'
,p_column_display_sequence=>5
,p_column_heading=>'User color'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598271208931713)
,p_query_column_id=>6
,p_column_alias=>'USER_AVATAR'
,p_column_display_sequence=>6
,p_column_heading=>'User avatar'
,p_use_as_row_header=>'N'
,p_column_format=>'IMAGE:EBA_DEMO_PROJ_TEAM_MEMBERS:PHOTO_BLOB:ID::PHOTO_MIMETYPE:PHOTO_FILENAME:PHOTO_LAST_UPDATED::::'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598355760931714)
,p_query_column_id=>7
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>7
,p_column_heading=>'User name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598423122931715)
,p_query_column_id=>8
,p_column_alias=>'EVENT_DATE'
,p_column_display_sequence=>8
,p_column_heading=>'Event date'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598587022931716)
,p_query_column_id=>9
,p_column_alias=>'EVENT_STATUS'
,p_column_display_sequence=>9
,p_column_heading=>'Event status'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598653473931717)
,p_query_column_id=>10
,p_column_alias=>'EVENT_TYPE'
,p_column_display_sequence=>10
,p_column_heading=>'Event type'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598731702931718)
,p_query_column_id=>11
,p_column_alias=>'EVENT_ICON'
,p_column_display_sequence=>11
,p_column_heading=>'Event icon'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598825162931719)
,p_query_column_id=>12
,p_column_alias=>'EVENT_TITLE'
,p_column_display_sequence=>12
,p_column_heading=>'Event title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23569598964218931720)
,p_query_column_id=>13
,p_column_alias=>'EVENT_DESC'
,p_column_display_sequence=>13
,p_column_heading=>'Event desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(41817136713736092461)
,p_name=>'My Outstanding Tasks'
,p_template=>wwv_flow_api.id(44535680543877352962)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.name project',
', t.name task',
', t.end_date',
'from eba_demo_proj_tasks t',
', eba_demo_projects p',
', eba_demo_proj_milestones m',
', eba_demo_proj_team_members tm',
'where p.id = t.project_id',
'and   m.id = t.milestone_id (+)',
'and   tm.id = t.assignee',
'and   nvl(t.is_complete_yn, ''N'') = ''N''',
'and   upper(tm.username) = upper(:APP_USER)',
'order by t.end_date'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(44535689261364352977)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Outstanding Tasks'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(41817136771023092462)
,p_query_column_id=>1
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>1
,p_column_heading=>'Project'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(41817136916441092463)
,p_query_column_id=>2
,p_column_alias=>'TASK'
,p_column_display_sequence=>2
,p_column_heading=>'Task'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(41817136975109092464)
,p_query_column_id=>3
,p_column_alias=>'END_DATE'
,p_column_display_sequence=>3
,p_column_heading=>'End date'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44535708535356353030)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(44535683816227352965)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(44535708008096353023)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(44535701985274352994)
);
end;
/
