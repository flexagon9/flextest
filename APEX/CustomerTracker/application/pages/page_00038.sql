--application/pages/page_00038
prompt  ...PAGE 38: Top Users
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 38
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Top Users'
 ,p_step_title => 'Top Users'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Top Users'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20130410111852'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select'||unistr('\000a')||
'lower(USERID)                   as THE_USER,'||unistr('\000a')||
'count(*)                        as PAGE_EVENTS,'||unistr('\000a')||
'median(ELAP)                    as MEDIAN_ELAPSED,'||unistr('\000a')||
'sum(NUM_ROWS)                   as ROWS_FETCHED,'||unistr('\000a')||
'sum(decode(IR_SEARCH,null,0,1)) as IR_SEARCHES,'||unistr('\000a')||
'sum(decode(SQLERRM,null,0,1))   as ERRORS,'||unistr('\000a')||
'sum(CONTENT_LENGTH)             as CONTENT_SERVED,'||unistr('\000a')||
'max(time_stamp)                 as MOST_RECENT'||unistr('\000a')||
'from apex_a';

s:=s||'ctivity_log l'||unistr('\000a')||
'where flow_id = :app_id'||unistr('\000a')||
'and time_stamp > sysdate - to_number(:P38_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')'||unistr('\000a')||
'group by lower(userid)'||unistr('\000a')||
'order by most_recent desc';

wwv_flow_api.create_page_plug (
  p_id=> 994177247492562445 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_plug_name=> 'Top Users',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 1020542669749437571+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_rest_enabled=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select'||unistr('\000a')||
'lower(USERID)                   as THE_USER,'||unistr('\000a')||
'count(*)                        as PAGE_EVENTS,'||unistr('\000a')||
'median(ELAP)                    as MEDIAN_ELAPSED,'||unistr('\000a')||
'sum(NUM_ROWS)                   as ROWS_FETCHED,'||unistr('\000a')||
'sum(decode(IR_SEARCH,null,0,1)) as IR_SEARCHES,'||unistr('\000a')||
'sum(decode(SQLERRM,null,0,1))   as ERRORS,'||unistr('\000a')||
'sum(CONTENT_LENGTH)             as CONTENT_SERVED,'||unistr('\000a')||
'max(time_stamp)                 as MOST_RECENT'||unistr('\000a')||
'from apex_a';

a1:=a1||'ctivity_log l'||unistr('\000a')||
'where flow_id = :app_id'||unistr('\000a')||
'and time_stamp > sysdate - to_number(:P38_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')'||unistr('\000a')||
'group by lower(userid)'||unistr('\000a')||
'order by most_recent desc';

wwv_flow_api.create_worksheet(
  p_id=> 994177370313562445+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_region_id=> 994177247492562445+wwv_flow_api.g_id_offset,
  p_name=> 'Top Users',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '1000000',
  p_max_row_count_message=> 'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'DPEAKE',
  p_internal_uid=> 420163926361892399);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 994178258056562448+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_worksheet_id => 994177370313562445+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MOST_RECENT',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'Most Recent',
  p_report_label           =>'Most Recent',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_format_mask            =>'since',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 658173044144105990+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_worksheet_id => 994177370313562445+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'THE_USER',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'The User',
  p_report_label           =>'The User',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 658173135939105992+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_worksheet_id => 994177370313562445+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'PAGE_EVENTS',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'Page Events',
  p_report_label           =>'Page Events',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 658173220124105993+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_worksheet_id => 994177370313562445+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MEDIAN_ELAPSED',
  p_display_order          =>11,
  p_column_identifier      =>'K',
  p_column_label           =>'Median Elapsed',
  p_report_label           =>'Median Elapsed',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 658173332224105993+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_worksheet_id => 994177370313562445+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ROWS_FETCHED',
  p_display_order          =>12,
  p_column_identifier      =>'L',
  p_column_label           =>'Rows Fetched',
  p_report_label           =>'Rows Fetched',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 658173446476105993+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_worksheet_id => 994177370313562445+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'IR_SEARCHES',
  p_display_order          =>13,
  p_column_identifier      =>'M',
  p_column_label           =>'Ir Searches',
  p_report_label           =>'Ir Searches',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 658173544362105993+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_worksheet_id => 994177370313562445+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ERRORS',
  p_display_order          =>14,
  p_column_identifier      =>'N',
  p_column_label           =>'Errors',
  p_report_label           =>'Errors',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 658173623516105993+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_worksheet_id => 994177370313562445+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CONTENT_SERVED',
  p_display_order          =>15,
  p_column_identifier      =>'O',
  p_column_label           =>'Content Served',
  p_report_label           =>'Content Served',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'THE_USER:PAGE_EVENTS:MEDIAN_ELAPSED:ROWS_FETCHED:IR_SEARCHES:ERRORS:CONTENT_SERVED:MOST_RECENT:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 994179072050581922+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_worksheet_id => 994177370313562445+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'4201657',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'Page Events',
  p_sort_direction_1        =>'DESC',
  p_sort_column_2           =>'0',
  p_sort_direction_2        =>'ASC',
  p_sort_column_3           =>'0',
  p_sort_direction_3        =>'ASC',
  p_sort_column_4           =>'0',
  p_sort_direction_4        =>'ASC',
  p_sort_column_5           =>'0',
  p_sort_direction_5        =>'ASC',
  p_sort_column_6           =>'0',
  p_sort_direction_6        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 994188949465670034 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 38,
  p_plug_name=> 'Button Bar',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 1020541067266437568+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 995297165593694280 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 38,
  p_button_sequence=> 10,
  p_button_plug_id => 994177247492562445+wwv_flow_api.g_id_offset,
  p_button_name    => 'RESET_REPORT',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020554662394437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Reset Report',
  p_button_position=> 'RIGHT_OF_IR_SEARCH_BAR',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:38,RIR::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>994178666953580145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 38,
  p_name=>'P38_TIMEFRAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 994188949465670034+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '00001.0000000000',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Timeframe',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'TIMEFRAME',
  p_lov=> 'select ''15 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, '||unistr('\000a')||
'trim(to_char(15/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all '||unistr('\000a')||
'select ''30 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, '||unistr('\000a')||
'trim(to_char(30/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all '||unistr('\000a')||
'select ''1 ''||wwv_flow_lang.system_message(initcap(''HOUR'')) d, '||unistr('\000a')||
'trim(to_char(1/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all '||unistr('\000a')||
'select ''90 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, '||unistr('\000a')||
'trim(to_char(90/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all '||unistr('\000a')||
'select ''2 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, '||unistr('\000a')||
'trim(to_char(1/12,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all '||unistr('\000a')||
'select ''3 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, '||unistr('\000a')||
'trim(to_char(3/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all '||unistr('\000a')||
'select ''4 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, '||unistr('\000a')||
'trim(to_char(4/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all '||unistr('\000a')||
'select ''5 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, '||unistr('\000a')||
'trim(to_char(5/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all '||unistr('\000a')||
'select ''6 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, '||unistr('\000a')||
'trim(to_char(6/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all '||unistr('\000a')||
'select ''8 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, '||unistr('\000a')||
'trim(to_char(8/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all '||unistr('\000a')||
'select ''10 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, '||unistr('\000a')||
'trim(to_char(10/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all '||unistr('\000a')||
'select ''12 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, '||unistr('\000a')||
'trim(to_char(12/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all '||unistr('\000a')||
'select ''16 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, '||unistr('\000a')||
'trim(to_char(16/24,''00000.9999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all '||unistr('\000a')||
'select ''1 ''||wwv_flow_lang.system_message(initcap(''DAY'')) d, trim(to_char(1,''00000.9999999999'')) t '||unistr('\000a')||
'from dual union all '||unistr('\000a')||
'select ''2 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(2,''00000.9999999999'')) t '||unistr('\000a')||
'from dual union all '||unistr('\000a')||
'select ''3 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(3,''00000.9999999999'')) t '||unistr('\000a')||
'from dual union all '||unistr('\000a')||
'select ''4 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(4,''00000.9999999999'')) t '||unistr('\000a')||
'from dual union all '||unistr('\000a')||
'select ''5 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(5,''00000.9999999999'')) t '||unistr('\000a')||
'from dual union all '||unistr('\000a')||
'select ''1 ''||wwv_flow_lang.system_message(initcap(''WEEK'')) d, trim(to_char(7,''00000.9999999999'')) t   '||unistr('\000a')||
'from dual union all '||unistr('\000a')||
'select ''2 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, trim(to_char(14,''00000.9999999999'')) t   '||unistr('\000a')||
'from dual order by 2',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- Select -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1020553657260437579+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'REDIRECT_SET_VALUE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 38
--
 
begin
 
null;
end;
null;
 
end;
/

 
