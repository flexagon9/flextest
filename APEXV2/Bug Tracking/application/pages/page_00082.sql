prompt --application/pages/page_00082
begin
wwv_flow_api.create_page(
 p_id=>82
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Bug Synchronization Log'
,p_page_mode=>'MODAL'
,p_step_title=>'Bug Synchronization Log'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141354470818444)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_api.id(3797358846252064904)
,p_required_patch=>wwv_flow_api.id(16725495374012530)
,p_help_text=>unistr('This page shows an entry in the report for every time a product''s bugs have been synchronized. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions \2228</strong> button to define the number of rows displayed')
||' per page, filter, format, download, and/or save the interactive report.'
,p_last_upd_yyyymmddhh24miss=>'20180220100601'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33580380172690059)
,p_plug_name=>'Refresh Log'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select created_by refresher,',
'    product_id,',
'    start_time,',
'    finish_time,',
'    count_of_bugs bugs,',
'    sqlerrm status,',
'    (cast(finish_time as date) - cast(start_time as date)) * 86400',
'        + to_char(finish_time,''.ff'') - to_char(start_time,''.ff'') seconds_elapsed,',
'    (   select p.product_name||'' (''||p.external_id||'')'' d',
'        from eba_bt_product p',
'        where p.id = h.product_id ) product,',
'    count_of_ins,',
'    count_of_upd,',
'    count_of_noop,',
'    count_of_del,',
'    count_of_bugs,',
'    created_by refreshed_by',
'from EBA_BT_REFRESH_HIST h'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(33580650012690060)
,p_name=>'Refresh Log'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>23511121008750235
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33580747966690060)
,p_db_column_name=>'PRODUCT_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Product ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33581138366690061)
,p_db_column_name=>'START_TIME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Start Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33581545614690061)
,p_db_column_name=>'FINISH_TIME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Finish Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33581993489690062)
,p_db_column_name=>'COUNT_OF_BUGS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Bugs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33582373779690062)
,p_db_column_name=>'COUNT_OF_INS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Inserts'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33582765904690063)
,p_db_column_name=>'COUNT_OF_UPD'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Updates'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33583167322690063)
,p_db_column_name=>'COUNT_OF_DEL'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Deletes'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33583531463690063)
,p_db_column_name=>'COUNT_OF_NOOP'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Noop'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33583970590690064)
,p_db_column_name=>'REFRESHER'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Refresher'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33584330241690064)
,p_db_column_name=>'BUGS'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Bugs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33584775061690064)
,p_db_column_name=>'STATUS'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33585159951690065)
,p_db_column_name=>'SECONDS_ELAPSED'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Seconds Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D000'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33585614140690065)
,p_db_column_name=>'PRODUCT'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33585960288690065)
,p_db_column_name=>'REFRESHED_BY'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Refreshed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(33586338798690066)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'235169'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRODUCT:START_TIME:COUNT_OF_UPD:COUNT_OF_INS:COUNT_OF_DEL:COUNT_OF_NOOP:REFRESHER:BUGS:SECONDS_ELAPSED:STATUS:'
,p_sort_column_1=>'START_TIME'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(941698910331969854)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(33580380172690059)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:82:&SESSION.::&DEBUG.:RP,RIR,82::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
end;
/
