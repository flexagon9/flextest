prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'&APPLICATION_TITLE.'
,p_alias=>'HOME_DESKTOP'
,p_step_title=>'&APPLICATION_TITLE.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506150059449829428)
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// standard, cacheable elements',
'var pagePrefix = ''P'' + $(''#pFlowStepId'').val();',
'var displayAsId = pagePrefix + ''_DISPLAY_AS'';',
'var $displayAs = $(''#'' + displayAsId);',
'var $cardsReg = $(''#cards_region'');',
'var $reportReg = $(''#report_region'');',
'',
'// applyFilters triggers the refresh event on the correct region',
'function applyFilters() {',
'  var display = $v(displayAsId);',
'  ',
'  if (display === ''CARDS'') {',
'    $cardsReg.trigger(''apexrefresh'');',
'  } else if (display === ''REPORT'') {',
'    $reportReg.trigger(''apexrefresh'');',
'  }',
'}',
'',
'// toggleRegionDisplay is similar to applyFilters except that it also',
'// takes into account what regions or items need to be displayed or hidden',
'function toggleRegionDisplay(refresh) {',
'  var display = $v(displayAsId);',
'  ',
'  refresh = (refresh === false) ? false : true;',
'  ',
'  if (display === ''CARDS'') {',
'    $reportReg.hide();',
'    if (refresh) {',
'      $cardsReg.trigger(''apexrefresh'');',
'    }',
'    $cardsReg.show();',
'  } else if (display === ''REPORT'') {',
'    $cardsReg.hide();',
'    if (refresh) {',
'      $reportReg.trigger(''apexrefresh'');',
'    }',
'    $reportReg.show();',
'  }',
'}',
'',
'// standard display, sort, reset event bindings',
'$displayAs.change(toggleRegionDisplay);',
'  ',
'toggleRegionDisplay(false);'))
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>About this Application</h2>',
'<p>The Bug Tracker application is an easy-to-use Web-accessible method to enter and track bugs against various projects.</p>',
'<p>You can enter bugs along with a variety of information, including associated project, severity, status and who the bug has been assigned to, along with a number of attributes about the problem. You can easily view when a bug was created and last u'
||'pdated, along with a free form description of the bug.</p>',
'<p>You can customize the values for standard attributes, insuring that your Bug Tracker application will fit your particular needs. An administrator can specify products and their versions, categories, and codes for status, priority and severity.</p>',
'<p>Bug Tracker gives all users an easy way to view bugs, based on a variety of selection filters.</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180223141500'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1017380228487077965)
,p_name=>'Product Cards'
,p_region_name=>'cards_region'
,p_template=>wwv_flow_api.id(1225683798473288318)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--basic:t-Cards--displayInitials:t-Cards--4cols:t-Cards--animColorFill'
,p_region_attributes=>'style="display: none"'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select label card_title, ',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':1:''||:APP_SESSION||'':::1:P1_PRODUCT:''||id) card_link,',
'       decode(least(length_id,10),10,null,to_char(id)||'' '')||description card_text,',
'       trim(to_char(open_bugs,''999G999G999G990'')) ||''/''||',
'           trim(to_char(bugs,''999G999G999G990''))||'' open (+''||',
'           trim(to_char(created_31,''999G999G999G990''))||'', -''|| ',
'           trim(to_char(closed_31,''999G999G999G990''))||'', total of ''||',
'           trim(to_char(NVL(created_31,0) - NVL(closed_31,0),''S999G999G999G990''))||'' for last 31 days)'' card_subtext,',
'       upper(',
'          decode(instr(label,'' ''),',
'                 0, ',
'                 substr(label,1,2),',
'                 substr(label,1,1)||substr(label,instr(label,'' '')+1,1)',
'           ))  card_initials',
'from',
'(',
'select',
'    length(id) length_id,',
'    ID,',
'    PRODUCT_NAME label,',
'    DESCRIPTION,',
'    decode(is_active,''Y'',''Yes'',''N'',''No'',is_active) IS_ACTIVE,',
'    --',
'    (select count(*) ',
'     from EBA_BT_SW_DEFECTS b ',
'     where b.PRODUCT_ID = p.id) bugs,',
'    --',
'    (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where b.PRODUCT_ID = p.id and',
'          status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'')) open_bugs,',
'    --',
'    (select count(*) from EBA_BT_SW_DEFECTS b ',
'     where b.PRODUCT_ID = p.id and ',
'           is_active = ''Y'' and ',
'           created >= localtimestamp - 31) created_31,',
'    --',
'    (select count(*) from EBA_BT_SW_DEFECTS b ',
'     where b.PRODUCT_ID = p.id and ',
'           is_active = ''Y'' and ',
'           b.DATE_CLOSED >= localtimestamp - 31 and',
'           status_id in (select id from eba_bt_status where is_open = ''N'')',
'          ) closed_31',
'from EBA_BT_PRODUCT p',
') x',
'where :P8_DISPLAY_AS = ''CARDS''',
'order by label'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P8_DISPLAY_AS'
,p_query_row_template=>wwv_flow_api.id(1540743437476450428)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1065584258365299339)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1065584390665299340)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Card link'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1065584434359299341)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card text'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1065584562831299342)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Card subtext'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1065584713960299343)
,p_query_column_id=>5
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>5
,p_column_heading=>'Card initials'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1697488645736599984)
,p_name=>'Users Pending Approval'
,p_template=>wwv_flow_api.id(1225683798473288318)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null id,',
'    ''warning'' ALERT_TYPE,',
'    ''Users Pending Approval'' as ALERT_TITLE,',
'    ''There''',
'        ||case when count(*) = 1 then '' is '' else '' are '' end',
'        ||''<a href="''',
'        ||apex_util.prepare_url(''f?p=''||:APP_ID||'':45:''||:APP_SESSION||'':::RIR:IREQ_ACCESS_LEVEL_ID:Pending Approval'')',
'        ||''" title="Manage the Access Control List">''||count(*)',
'        ||case when count(*) = 1 then '' user</a> is'' else '' users</a> are'' end',
'        ||'' pending approval.'' ALERT_DESC,',
'    '''' alert_action',
'from eba_bt_users',
'where access_level_id = 0'))
,p_required_role=>wwv_flow_api.id(3797358846252064904)
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_bt_users',
'where access_level_id = 0'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(1449635398616265566)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_api.id(1065271160137186238)
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(983388062871905638)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(983388465089905639)
,p_query_column_id=>2
,p_column_alias=>'ALERT_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Alert type'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(983388901005905639)
,p_query_column_id=>3
,p_column_alias=>'ALERT_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Alert title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(983389282392905639)
,p_query_column_id=>4
,p_column_alias=>'ALERT_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Alert desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(983389657202905640)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ACTION'
,p_column_display_sequence=>5
,p_column_heading=>'Alert action'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(3381965186219163518)
,p_name=>'Notifications'
,p_template=>wwv_flow_api.id(1225683798473288318)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:#DEFAULT#'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    id,',
'    decode(lower(NOTIFICATION_TYPE),''yellow'',''warning'',''red'',''danger'',lower(NOTIFICATION_TYPE)) as ALERT_TYPE,',
'    NOTIFICATION_NAME as ALERT_TITLE,',
'    NOTIFICATION_DESCRIPTION as ALERT_DESC,',
'    '''' alert_action',
'from',
'    EBA_BT_NOTIFICATIONS',
'where',
'    (DISPLAY_FROM is null or DISPLAY_FROM <= current_date)',
'and',
'    (DISPLAY_UNTIL is null or DISPLAY_UNTIL >= current_date)',
'order by nvl(DISPLAY_SEQUENCE,0), NOTIFICATION_NAME'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from EBA_BT_NOTIFICATIONS',
' where (DISPLAY_FROM is null or DISPLAY_FROM <= current_date) and',
'       (DISPLAY_UNTIL is null or DISPLAY_UNTIL >= current_date)'))
,p_display_condition_type=>'EXISTS'
,p_query_row_template=>wwv_flow_api.id(1449635398616265566)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'0'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(983385806709903479)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(983386140206903479)
,p_query_column_id=>2
,p_column_alias=>'ALERT_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Alert type'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(983386532239903480)
,p_query_column_id=>3
,p_column_alias=>'ALERT_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Alert title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(983386997254903480)
,p_query_column_id=>4
,p_column_alias=>'ALERT_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Alert desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(983387359762903480)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ACTION'
,p_column_display_sequence=>5
,p_column_heading=>'Alert action'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3492841532013481630)
,p_plug_name=>'&APPLICATION_TITLE.'
,p_icon_css_classes=>'app-bug-tracking'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1235076342164147026)
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in ( select preference_value',
'            from eba_bt_preferences',
'            where preference_name = ''APPLICATION_SUBTITLE''',
'            union all',
'            select ''Track and Manage Software Bugs''',
'            from dual',
'            where not exists ( select null',
'                               from eba_bt_preferences',
'                               where preference_name = ''APPLICATION_SUBTITLE'')',
'          ) loop',
'    sys.htp.p(''<p>''||apex_escape.html(c1.preference_value)||''</p>'');',
'end loop;',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5363768601984404322)
,p_plug_name=>'Display As'
,p_parent_plug_id=>wwv_flow_api.id(3492841532013481630)
,p_region_css_classes=>'t-Form--search'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4400433058174014145)
,p_plug_name=>'Timezone'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' "TIMEZONE" ',
' '))
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5580609075373905585)
,p_plug_name=>'Products Report'
,p_region_name=>'report_region'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display: none"'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   id,',
'   product_name,',
'   description,',
'   is_active,',
'   bugs,',
'   open_bugs,',
'   s1, s2, s3, s4,',
'   urgency_1, urgency_2, urgency_3, ',
'   distinct_owners,',
'   created_7, created_14,',
'   closed_7, closed_14,',
'   created_7 - closed_7 delta_7,',
'   created_14 - closed_14 delta_14,',
'   CREATED_BY, created,',
'   updated_by, updated',
'from (',
'select',
'    ID,',
'    PRODUCT_NAME,',
'    DESCRIPTION,',
'    decode(is_active,''Y'',''Yes'',''N'',''No'',is_active) IS_ACTIVE,',
'    --',
'    (select count(*) ',
'     from EBA_BT_SW_DEFECTS b ',
'     where b.PRODUCT_ID = p.id) bugs,',
'    --',
'    (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where b.PRODUCT_ID = p.id and',
'          status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'')) open_bugs,',
'    --',
'    (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where b.PRODUCT_ID = p.id and',
'          severity_id in (select id',
'          from eba_bt_severity ',
'          where sequence_number = 1) and',
'    status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'')) s1,',
'    --',
'    (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where b.PRODUCT_ID = p.id and',
'          severity_id in (select id',
'          from eba_bt_severity ',
'          where sequence_number = 2) and',
'    status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'')) s2,',
'    --',
'    (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where b.PRODUCT_ID = p.id and',
'          severity_id in (select id',
'          from eba_bt_severity ',
'          where sequence_number = 3) and',
'    status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'')) s3,',
'    --',
'    (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where b.PRODUCT_ID = p.id and',
'          severity_id in (select id',
'          from eba_bt_severity ',
'          where sequence_number = 4) and',
'    status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'')) s4,',
'    --',
'    (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where b.PRODUCT_ID = p.id and',
'          urgency_id in (select id',
'          from eba_bt_urgency ',
'          where sequence_number = 1) and',
'    status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'')) urgency_1,',
'    --',
'    (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where b.PRODUCT_ID = p.id and',
'          urgency_id in (select id',
'          from eba_bt_urgency ',
'          where sequence_number = 2) and',
'    status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'')) urgency_2,',
'    --',
'    (select count(*) ',
'    from EBA_BT_SW_DEFECTS b ',
'    where b.PRODUCT_ID = p.id and',
'          urgency_id in (select id',
'          from eba_bt_urgency ',
'          where sequence_number = 3) and',
'    status_id in (select id',
'          from eba_bt_status ',
'          where is_open = ''Y'')) urgency_3,',
'    --',
'    (select count(distinct assigned_to_id) ',
'     from EBA_BT_SW_DEFECTS b ',
'     where b.PRODUCT_ID = p.id and ',
'           is_active = ''Y'') distinct_owners,',
'    --',
'    (select count(*) from EBA_BT_SW_DEFECTS b ',
'     where b.PRODUCT_ID = p.id and ',
'           is_active = ''Y'' and ',
'           created >= localtimestamp - 7) created_7,',
'    --',
'    (select count(*) from EBA_BT_SW_DEFECTS b ',
'     where b.PRODUCT_ID = p.id and ',
'           is_active = ''Y'' and ',
'           b.DATE_CLOSED >= localtimestamp - 7 and',
'           status_id in (select id from eba_bt_status where is_open = ''N'')',
'          ) closed_7,',
'    --',
'    (select count(*) from EBA_BT_SW_DEFECTS b ',
'     where b.PRODUCT_ID = p.id and ',
'           is_active = ''Y'' and ',
'           created >= localtimestamp - 14) created_14,',
'    --',
'    (select count(*) from EBA_BT_SW_DEFECTS b ',
'     where b.PRODUCT_ID = p.id and ',
'           is_active = ''Y'' and ',
'           b.DATE_CLOSED >= localtimestamp - 14 and',
'           status_id in (select id from eba_bt_status where is_open = ''N'')) closed_14,',
'    --',
'    CREATED,',
'    lower(created_by) CREATED_BY,',
'    UPDATED,',
'    lower(updated_by) UPDATED_BY',
'from EBA_BT_PRODUCT p',
') x',
'where :P8_DISPLAY_AS = ''REPORT'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P8_DISPLAY_AS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_column_width=>'summary="Products"'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5580609185330905585)
,p_name=>'Products'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>3725910658024916405
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5580609366438905651)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5580609477192905658)
,p_db_column_name=>'PRODUCT_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Product'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::P1_PRODUCT:#ID#'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5580609584736905658)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5580609663120905659)
,p_db_column_name=>'IS_ACTIVE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Active'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5580609769873905659)
,p_db_column_name=>'BUGS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Bugs'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR:IR_PRODUCT_ID:#ID#'
,p_column_linktext=>'#BUGS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5580609989603905660)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5580610190108905660)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4100555739775066411)
,p_db_column_name=>'OPEN_BUGS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Open Bugs'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,RIR:IR_PRODUCT_ID,IR_IS_OPEN:#ID#,Yes'
,p_column_linktext=>'#OPEN_BUGS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4100596935536084161)
,p_db_column_name=>'DISTINCT_OWNERS'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Distinct Owners'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4100699842770133481)
,p_db_column_name=>'CREATED_7'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Filed 7'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P8:&DEBUG.:RP,23,RIR:IR_PRODUCT_ID,IRGTE_CREATED_DATE,IR_IS_OPEN:#ID#,&P8_LAST_WEEK.,Yes'
,p_column_linktext=>'#CREATED_7#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523149131480431147)
,p_db_column_name=>'CREATED'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523149255518431150)
,p_db_column_name=>'UPDATED'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523166027661704418)
,p_db_column_name=>'S1'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'S1'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P8:&DEBUG.:RP,23,RIR:IR_PRODUCT_ID,IR_SEVERITY,IR_IS_OPEN:#ID#,1. Critical,Yes'
,p_column_linktext=>'#S1#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_help_text=>'Severity Level 1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523166443245708892)
,p_db_column_name=>'S2'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'S2'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P8:&DEBUG.:RP,23,RIR:IR_PRODUCT_ID,IR_SEVERITY,IR_IS_OPEN:#ID#,2. High,Yes'
,p_column_linktext=>'#S2#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523169141214736684)
,p_db_column_name=>'URGENCY_1'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'P1'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P8:&DEBUG.:RP,23,RIR:IR_PRODUCT_ID,IR_URGENCY_NAME,IR_IS_OPEN:#ID#,1. Critical,Yes'
,p_column_linktext=>'#URGENCY_1#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523169251820736684)
,p_db_column_name=>'URGENCY_2'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'P2'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P8:&DEBUG.:RP,23,RIR:IR_PRODUCT_ID,IR_URGENCY_NAME,IR_IS_OPEN:#ID#,2. High,Yes'
,p_column_linktext=>'#URGENCY_2#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509299144925395448)
,p_db_column_name=>'S3'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'S3'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P8:&DEBUG.:RP,23,RIR:IR_PRODUCT_ID,IR_SEVERITY,IR_IS_OPEN:#ID#,3. Medium,Yes'
,p_column_linktext=>'#S3#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509310636951657431)
,p_db_column_name=>'S4'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'S4'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P8:&DEBUG.:RP,23,RIR:IR_PRODUCT_ID,IR_SEVERITY,IR_IS_OPEN:#ID#,4. Low,Yes'
,p_column_linktext=>'#S4#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509320236994870153)
,p_db_column_name=>'URGENCY_3'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'P3'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P8:&DEBUG.:RP,23,RIR:IR_PRODUCT_ID,IR_URGENCY_NAME,IR_IS_OPEN:#ID#,3. Medium,Yes'
,p_column_linktext=>'#URGENCY_3#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1351705981888964987)
,p_db_column_name=>'CREATED_14'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Filed 14'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1376745538483005923)
,p_db_column_name=>'CLOSED_7'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Closed 7'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1376745699209005926)
,p_db_column_name=>'CLOSED_14'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Closed 14'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422731540792487603)
,p_db_column_name=>'DELTA_7'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'7 Day +1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'S999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422731637766487611)
,p_db_column_name=>'DELTA_14'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'14 Day +-'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'S999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5580610293254905902)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8983149'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'PRODUCT_NAME:BUGS:OPEN_BUGS:S1:S2:S3:S4:CLOSED_14:DELTA_14'
,p_sort_column_1=>'PRODUCT_NAME'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'BUGS:OPEN_BUGS:S1:S2:S3:S4:URGENCY_1:URGENCY_2:URGENCY_3:CREATED_7:CLOSED_7:CREATED_14:CLOSED_14:DELTA_7'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2509309956937647094)
,p_plug_name=>'Report Legend'
,p_parent_plug_id=>wwv_flow_api.id(5580609075373905585)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--accessibleHeading:margin-top-md'
,p_plug_template=>wwv_flow_api.id(1225681960450288316)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Columns S1 through S4 indicate the bug severity.<br />',
'Columns P1 through P3 indicate the bug fix priority.<br />',
'Filed 7 and Filed 14 identifies the number of bugs filed in the last 7 and 14 days.</p>'))
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1415234696747020556)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3492841532013481630)
,p_button_name=>'CREATE_PRODUCT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Add Product'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:17::'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(983382336525857969)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(3492841532013481630)
,p_button_name=>'CREATE_BUG'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Bug'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:RP,93::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4475489753709901881)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5580609075373905585)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1062952096847876078)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(5580609075373905585)
,p_button_name=>'SYNC'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Sync'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
,p_required_patch=>wwv_flow_api.id(16725495374012530)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(941698962024969855)
,p_branch_name=>'Search'
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,66:P66_SEARCH:&P8_SEARCH.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(992810598307913029)
,p_branch_name=>'Check First Run'
,p_branch_action=>'f?p=&APP_ID.:1000:&SESSION.:CC:&DEBUG.:RP,1000::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>'eba_bt_fw.get_preference_value(''FIRST_RUN'') = ''YES'''
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(980125059531680468)
,p_name=>'P8_LAST_WEEK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2509309956937647094)
,p_use_cache_before_default=>'NO'
,p_source=>'to_char(sysdate - 7,''DD-MON-YYYY'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1017380033047077964)
,p_name=>'P8_DISPLAY_AS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5363768601984404322)
,p_item_default=>'CARDS'
,p_prompt=>'Display as'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'PILL_DISPLAY_AS'
,p_lov=>'.'||wwv_flow_api.id(1489586479860043362)||'.'
,p_field_template=>wwv_flow_api.id(1225704767981288342)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1351717936443334219)
,p_name=>'P8_LAST_2_WEEKS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2509309956937647094)
,p_use_cache_before_default=>'NO'
,p_source=>'to_char(sysdate - 14,''DD-MON-YYYY'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5597468364096234242)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(941699654706969862)
,p_name=>'Refresh on Sync'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(1062952096847876078)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(941699789529969863)
,p_event_id=>wwv_flow_api.id(941699654706969862)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5580609075373905585)
,p_stop_execution_on_error=>'Y'
);
end;
/
