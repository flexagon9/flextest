prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Tag Cloud'
,p_step_title=>'Tag Cloud'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2508162743716731820)
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page shows a chart of tags with click through to their references.'
,p_last_updated_by=>'HILARY'
,p_last_upd_yyyymmddhh24miss=>'20190314064827'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2710389833380924243)
,p_plug_name=>'Attachment Tags'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    distinct tag as tag,',
'    count(*) as tag_count',
'from',
'    eba_bt_tags',
'where',
'    content_type = ''FILE''',
'group by',
'    tag'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_no_data_found=>'No attachment tags found.'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'f?p=&APP_ID.:29:&APP_SESSION.:::RIR:IRC_TAGS:#TAG#'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5604483467261755708)
,p_plug_name=>'Bug Tags'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag,',
'    count(*) as tag_count',
'from eba_bt_tags',
'where content_type = ''DEFECT''',
'group by tag',
'order by 2 desc, 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'TAG'
,p_attribute_03=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,RIR:IRC_TAGS:&TAG.'
,p_attribute_04=>'TAG_COUNT'
,p_attribute_05=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,RIR:IRC_TAGS:&TAG.'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'1000'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No bug tags found.'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1415237824968068847)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
end;
/
