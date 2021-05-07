prompt --application/pages/page_00050
begin
wwv_flow_api.create_page(
 p_id=>50
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Sync Log'
,p_page_mode=>'MODAL'
,p_step_title=>'Sync Log'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_api.id(3797358846252064904)
,p_help_text=>unistr('Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions \2228</strong> button to define the number of rows displayed per page, filter, format, download, and/or save the interactive report.')
,p_last_upd_yyyymmddhh24miss=>'20180216101319'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1065570951603994495)
,p_plug_name=>'Refresh Log'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       CREATED_BY,',
'       CREATED,',
'       PRODUCT_ID,',
'       PRODUCT_NAME,',
'       START_TIME,',
'       FINISH_TIME,',
'       PRE_SYNC_BUGS,',
'       COUNT_OF_BUGS,',
'       REFRESH_TYPE,',
'       SQLERRM,',
'       ( select max(sync_last_upd) m',
'         from eba_bt_sw_defects d',
'         where product_id = h.product_id and sync_last_upd is not null ) last_sync_update',
'  from EBA_BT_REFRESH_HIST h',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1065571029249994495)
,p_name=>'Refresh Log'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No sync log data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MIKE'
,p_internal_uid=>1055501500246054670
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065571463138994508)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065571900413994511)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065572262400994512)
,p_db_column_name=>'CREATED'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065572723296994512)
,p_db_column_name=>'PRODUCT_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Product Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065573110478994513)
,p_db_column_name=>'PRODUCT_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Product Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065573465523994513)
,p_db_column_name=>'START_TIME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Start Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065573860730994514)
,p_db_column_name=>'FINISH_TIME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Finish Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065574248558994514)
,p_db_column_name=>'PRE_SYNC_BUGS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Pre Sync Bugs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065574711580994515)
,p_db_column_name=>'COUNT_OF_BUGS'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Count Of Bugs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065575116261994515)
,p_db_column_name=>'REFRESH_TYPE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Refresh Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1065575435291994516)
,p_db_column_name=>'SQLERRM'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Sqlerrm'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(991600199440883436)
,p_db_column_name=>'LAST_SYNC_UPDATE'
,p_display_order=>21
,p_column_identifier=>'L'
,p_column_label=>'Last sync update'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1065575868318995246)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10555064'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CREATED_BY:CREATED:PRODUCT_NAME:START_TIME:FINISH_TIME:PRE_SYNC_BUGS:COUNT_OF_BUGS:REFRESH_TYPE:SQLERRM:LAST_SYNC_UPDATE'
,p_sort_column_1=>'START_TIME'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3138538588108293241)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1065570951603994495)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID., RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
end;
/
