prompt --application/pages/page_00033
begin
wwv_flow_api.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Assignee Summary'
,p_step_title=>'Assignee Summary'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2509222245997328767)
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'    Bug Assignee Summary',
'</h2>',
'<p>',
'    View an individual user''s bug assignments. Mouse over and click within each section to view more details about individual items.',
'</p>'))
,p_last_updated_by=>'HILARY'
,p_last_upd_yyyymmddhh24miss=>'20190314064827'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39449330677989466)
,p_plug_name=>'Open Bugs by Product Category'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.CATEGORY_NAME,',
'       count(*) c',
'	from EBA_BT_SW_DEFECTS d,',
'             eba_bt_category p,',
'             eba_bt_status c',
'	where p.id = d.category_id ',
'        and c.id = d.status_id ',
'        and nvl(d.is_active,''Y'') = ''Y''',
'	and (d.product_id = :P33_PRODUCT or nvl(:P33_PRODUCT,0) = 0)',
'and',
'       c.id in (select id from eba_bt_status where nvl(is_open,''Y'') = ''Y'')',
'and d.ASSIGNED_TO_ID = :P33_ID',
'	group by P.category_name ',
'	order by 2 desc '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P33_PRODUCT'
,p_plug_display_when_cond2=>'0'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'CATEGORY_NAME'
,p_attribute_03=>'f?p=&APP_ID.:23:&APP_SESSION.::&DEBUG.:23,RIR,RP:IR_CATEGORY:&CATEGORY_NAME.'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'20'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No data found.'
,p_plug_comment=>' style="height: 608px; overflow: hidden;" data-grid="col_2" data-grid-start="no"  '
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39453585707008268)
,p_plug_name=>'Open Bugs by Severity'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.SEVERITY_NAME SEVERITY_NAME, ',
'       count(*) c,',
'       c.sequence_number SEVERITY_NUMBER',
'from EBA_BT_SW_DEFECTS d,',
'                EBA_BT_SEVERITY c',
'where c.id = d.SEVERITY_id and (product_id = :P33_PRODUCT or nvl(:P33_PRODUCT,0) = 0) and',
'      d.status_id not in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'') and',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      d.status_id not in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'') and',
'      d.status_id  in (select id from eba_bt_status where NVL(is_open,''Y'') = ''Y'') ',
'group by c.sequence_number, c.SEVERITY_NAME  ',
'order by 3 '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'SEVERITY_NAME'
,p_attribute_03=>'f?p=&APP_ID.:23:&APP_SESSION.::&DEBUG.:23,RIR,RP:IR_SEVERITY_NUMBER:&SEVERITY_NUMBER.'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'5'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No data found.'
,p_plug_comment=>'style="height: 208px; overflow: hidden;" data-grid="col_2" data-grid-start="no" '
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39483126669060488)
,p_plug_name=>'Open External Customer Bugs'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(c.customer_Name) the_name, ',
'       count(*) c,',
'       c.id',
'from EBA_BT_SW_DEFECTS d,',
'     EBA_BT_CUSTOMERS c',
'where c.id = d.customer_id and ',
'      (product_id = :P33_PRODUCT or nvl(:P33_PRODUCT,0) = 0) and',
'      d.status_id not in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'') and',
'      NVL(c.is_internal_yn,''N'') = ''N'' and',
'      d.status_id  in (select id from eba_bt_status where NVL(is_open,''Y'') = ''Y'') ',
'and d.ASSIGNED_TO_ID = :P33_ID',
'group by upper(c.customer_Name)  , c.ID',
'order by 2 desc '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'THE_NAME'
,p_attribute_03=>'f?p=&APP_ID.:23:&APP_SESSION.::&DEBUG.:23,RIR,RP:IR_CUSTOMER_ID:&ID.'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'50'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No data found.'
,p_plug_comment=>'style="height: 208px; overflow: hidden;" data-grid="col_2" data-grid-start="no" '
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39522148610625635)
,p_plug_name=>'Bug Metrics'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) the_value, ''Open Bugs'' the_label, 100 the_disp_seq',
'from eba_bt_sw_defects d, eba_bt_status c ',
'where c.id = d.status_id and ',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      NVL(c.is_enhancement,''N'') = ''N'' and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'      union all',
'select count(*) the_value, ''Closed Bugs'' the_label, 190 the_disp_seq',
' from eba_bt_sw_defects d, eba_bt_status c ',
'where c.id = d.status_id and ',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''N'' and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Open S1 Bugs'' the_label, 110 the_disp_seq',
'from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_SEVERITY s',
'where c.id = d.status_id and ',
'      s.id = d.severity_id and',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      NVL(c.is_enhancement,''N'') = ''N'' and',
'      s.SEQUENCE_NUMBER = 1 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union All',
'select count(*) the_value, ''Open S2 Bugs'' the_label, 120 the_disp_seq',
'from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_SEVERITY s',
'where c.id = d.status_id and ',
'      s.id = d.severity_id and',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      s.SEQUENCE_NUMBER = 2 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all ',
'select count(*) the_value, ''Open S3 Bugs'' the_label, 130 the_disp_seq',
'from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_SEVERITY s',
'where c.id = d.status_id and ',
'      s.id = d.severity_id and',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      s.SEQUENCE_NUMBER = 3 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Open S4 Bugs'' the_label, 140 the_disp_seq',
'from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_SEVERITY s',
'where c.id = d.status_id and ',
'      s.id = d.severity_id and',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      s.SEQUENCE_NUMBER = 4 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Open P1 Bugs'' the_label, 150 the_disp_seq',
'from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_URGENCY s',
'where c.id = d.status_id and ',
'      s.id = d.urgency_id and',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      s.SEQUENCE_NUMBER = 1 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Open P2 Bugs'' the_label, 160 the_disp_seq',
'from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_URGENCY s',
'where c.id = d.status_id and ',
'      s.id = d.urgency_id and',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      s.SEQUENCE_NUMBER = 2 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Open P3 Bugs'' the_label, 170 the_disp_seq',
'from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_URGENCY s',
'where c.id = d.status_id and ',
'      s.id = d.urgency_id and',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      s.SEQUENCE_NUMBER = 3 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Open P4 Bugs'' the_label, 180 the_disp_seq',
'from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_URGENCY s',
'where c.id = d.status_id and ',
'      s.id = d.urgency_id and',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      s.SEQUENCE_NUMBER = 4 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'THE_LABEL'
,p_attribute_02=>'THE_VALUE'
,p_attribute_05=>'2'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39523089802647719)
,p_plug_name=>'Open / Close X Days'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) the_value, ''Open 7'' the_label, 200 the_disp_seq',
' from eba_bt_sw_defects d, eba_bt_status c ',
'where c.id = d.status_id and ',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      d.created >= (localtimestamp - 7) and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Closed 7'' the_label, 210 the_disp_seq',
' from eba_bt_sw_defects d, eba_bt_status c ',
'where c.id = d.status_id and ',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''N'' and',
'      d.DATE_CLOSED >= localtimestamp - 7 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Open 14'' the_label, 220 the_disp_seq',
' from eba_bt_sw_defects d, eba_bt_status c ',
'where c.id = d.status_id and ',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      d.created >= localtimestamp - 14 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Closed 14'' the_label, 230 the_disp_seq',
' from eba_bt_sw_defects d, eba_bt_status c ',
'where c.id = d.status_id and ',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''N'' and',
'      d.DATE_CLOSED >= localtimestamp - 14 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Open 30'' the_label, 240 the_disp_seq',
' from eba_bt_sw_defects d, eba_bt_status c ',
'where c.id = d.status_id and ',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      d.created >= localtimestamp - 30 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Closed 30'' the_label, 250 the_disp_seq',
' from eba_bt_sw_defects d, eba_bt_status c ',
'where c.id = d.status_id and ',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''N'' and',
'      d.DATE_CLOSED >= localtimestamp - 30 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Open 90'' the_label, 260 the_disp_seq',
' from eba_bt_sw_defects d, eba_bt_status c ',
'where c.id = d.status_id and ',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''Y'' and',
'      d.created >= localtimestamp - 90 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'union all',
'select count(*) the_value, ''Closed 90'' the_label, 270 the_disp_seq',
' from eba_bt_sw_defects d, eba_bt_status c ',
'where c.id = d.status_id and ',
'      d.ASSIGNED_TO_ID = :P33_ID and',
'      c.IS_OPEN = ''N'' and',
'      d.DATE_CLOSED >= localtimestamp - 90 and',
'      (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_customized=>'1'
,p_plug_customized_name=>'Open and Close'
,p_attribute_01=>'THE_LABEL'
,p_attribute_02=>'THE_VALUE'
,p_attribute_05=>'2'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(74487335020628647)
,p_name=>'Recent Bugs'
,p_template=>wwv_flow_api.id(1225690169574288324)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_component_template_options=>'t-MediaList--showDesc:t-MediaList--showBadges:t-MediaList--stack'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    ''fa-bug'' icon,',
'    BUG_NUMBER,',
'    apex_page.get_url(p_page => 31,  p_items => ''P31_ID'', p_values => d.id ) link,',
'    substr(subject,1,100) as list_title,',
'    (select substr(status_name,1,20) from EBA_BT_STATUS c where c.id = d.status_id) status,',
'    nvl(d.created, nvl(d.updated,d.submitted_on)) submitted_on,',
'    p.PRODUCT_NAME,',
'    d.ASSIGNED_TO_ID,',
'    '' '' link_attr,',
'    '' '' link_class,',
'    '' '' list_badge,',
'    '' '' list_class,',
'    '' '' list_text,',
'    (select username from eba_bt_users u where u.id = d.ASSIGNED_TO_ID) assignee,',
'    (select SEVERITY_NAME from EBA_BT_SEVERITY c where c.id = d.SEVERITY_id) severity,',
'    (select URGENCY_NAME from eba_bt_urgency u where d.urgency_id = u.id) priority,',
'    d.id bug_id,',
'    decode(b.is_open,''Y'',''Yes'',''N'',''No'',''Yes'') is_open,',
'    d.updated',
'from  EBA_BT_SW_DEFECTS d,',
'      eba_bt_product p,',
'      eba_bt_status b',
'where p.id = d.product_id and',
'      d.STATUS_ID = b.id (+) and ',
'      (d.product_id = :P33_PRODUCT or nvl(:P33_PRODUCT,0) = 0) and',
'      nvl(d.is_active,''Y'') = ''Y'' and',
'      NVL(b.is_enhancement,''N'') = ''N'' and',
'      d.ASSIGNED_TO_ID = :P33_ID ',
'order by nvl(d.updated,d.submitted_on) desc'))
,p_customized=>'1'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(707193968701263941)
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703955093419045553)
,p_query_column_id=>1
,p_column_alias=>'ICON'
,p_column_display_sequence=>1
,p_column_heading=>'Icon'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703955207927045554)
,p_query_column_id=>2
,p_column_alias=>'BUG_NUMBER'
,p_column_display_sequence=>2
,p_column_heading=>'Bug number'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956947293045572)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>19
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956345147045566)
,p_query_column_id=>4
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>13
,p_column_heading=>'List title'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703955364666045556)
,p_query_column_id=>5
,p_column_alias=>'STATUS'
,p_column_display_sequence=>3
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703955496994045557)
,p_query_column_id=>6
,p_column_alias=>'SUBMITTED_ON'
,p_column_display_sequence=>4
,p_column_heading=>'Submitted on'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703955562570045558)
,p_query_column_id=>7
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>5
,p_column_heading=>'Product name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703955706222045559)
,p_query_column_id=>8
,p_column_alias=>'ASSIGNED_TO_ID'
,p_column_display_sequence=>6
,p_column_heading=>'Assigned to id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956503351045567)
,p_query_column_id=>9
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>14
,p_column_heading=>'Link attr'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956604722045568)
,p_query_column_id=>10
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>15
,p_column_heading=>'Link class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956699644045569)
,p_query_column_id=>11
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>16
,p_column_heading=>'List badge'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'#STATUS#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956769601045570)
,p_query_column_id=>12
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>17
,p_column_heading=>'List class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956877180045571)
,p_query_column_id=>13
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>18
,p_column_heading=>'List text'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'#SEVERITY# &middot; #PRIORITY#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703955741069045560)
,p_query_column_id=>14
,p_column_alias=>'ASSIGNEE'
,p_column_display_sequence=>7
,p_column_heading=>'Assignee'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703955831687045561)
,p_query_column_id=>15
,p_column_alias=>'SEVERITY'
,p_column_display_sequence=>8
,p_column_heading=>'Severity'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956005800045562)
,p_query_column_id=>16
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>9
,p_column_heading=>'Priority'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956087904045563)
,p_query_column_id=>17
,p_column_alias=>'BUG_ID'
,p_column_display_sequence=>10
,p_column_heading=>'Bug id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956134269045564)
,p_query_column_id=>18
,p_column_alias=>'IS_OPEN'
,p_column_display_sequence=>11
,p_column_heading=>'Is open'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(703956273643045565)
,p_query_column_id=>19
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>12
,p_column_heading=>'Updated'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1428364647817809868)
,p_plug_name=>'hidden items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>10
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1428419784373968113)
,p_name=>'Product: &PRODUCT_NAME.'
,p_template=>wwv_flow_api.id(1225690169574288324)
,p_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-AVPList--variableLabelMedium:t-AVPList--leftAligned'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   id,',
'   login_name,',
'   first_Name||'' ''||last_name name,',
'   email,',
'   work_phone,',
'   created_on,',
'   created_by,',
'   products',
'from (',
'select	 id,',
'         u.username as "LOGIN_NAME",',
'	 u."FIRST_NAME" as "FIRST_NAME",',
'	 u."LAST_NAME" as "LAST_NAME",',
'	 u."EMAIL" as "EMAIL",',
'	 u."WORK_PHONE" as "WORK_PHONE",',
'	 u."CREATED" as "CREATED_ON",',
'	 u."CREATED_BY" as "CREATED_BY" ,',
'   (select count(distinct product_id) from eba_bt_sw_defects d where u.id = d.ASSIGNED_TO_ID and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) products',
'from   EBA_BT_USERs u',
'where  u.id = :P33_ID and (:PRODUCT_ID = 0 or ',
'       exists (select 1 from eba_bt_sw_defects d where d.ASSIGNED_TO_ID = u.id and',
'          :PRODUCT_ID = d.product_id)',
'       )',
') x'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1706272636221397804)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1428420059817968138)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1428420161416968140)
,p_query_column_id=>2
,p_column_alias=>'LOGIN_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Login'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1428433113566132582)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1428420446917968140)
,p_query_column_id=>4
,p_column_alias=>'EMAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Email'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1428420625883968140)
,p_query_column_id=>5
,p_column_alias=>'WORK_PHONE'
,p_column_display_sequence=>5
,p_column_heading=>'Work Phone'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1428420763340968140)
,p_query_column_id=>6
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>6
,p_column_heading=>'Created On'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1428420917140968140)
,p_query_column_id=>7
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>7
,p_column_heading=>'Created By'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1428420968643968140)
,p_query_column_id=>8
,p_column_alias=>'PRODUCTS'
,p_column_display_sequence=>8
,p_column_heading=>'Products'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1506948209461262235)
,p_plug_name=>'Fix By Open Bugs'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'PRODUCT_ID'
,p_plug_display_when_cond2=>'0'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1506948236428262236)
,p_region_id=>wwv_flow_api.id(1506948209461262235)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'N'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1506948427192262237)
,p_chart_id=>wwv_flow_api.id(1506948236428262236)
,p_seq=>10
,p_name=>'Fix By'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l||'' (''||v||'')'' l,',
'       v,',
'       id',
'from(',
'select',
'     nvl(c.version_name,''NONE DEFINED'') l,',
'     count(*) v,',
'     nvl(c.id,0) id',
'from EBA_BT_SW_DEFECTS a,',
'     eba_bt_status b,',
'     eba_bt_version c',
'where (:PRODUCT_ID = 0 or a.product_id = :PRODUCT_ID) and',
'      (NVL(:PRODUCT_ID,0) != 0 ) and',
'      a.status_id = b.id (+) and',
'      a.FIX_BY_VERSION_ID = c.id (+) and',
'      b.is_open = ''Y'' and',
'      NVL(b.is_enhancement,''N'') = ''N'' and',
'      a.ASSIGNED_TO_ID = :P33_ID',
'group by nvl(c.version_name,''NONE DEFINED''), nvl(c.id,0)',
')',
'order by 1 desc'))
,p_items_value_column_name=>'V'
,p_items_label_column_name=>'L'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN,IR_FIX_BY_VERSION_ID:&P33_ID.,Yes,&ID.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1506948607473262239)
,p_chart_id=>wwv_flow_api.id(1506948236428262236)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1506948524548262238)
,p_chart_id=>wwv_flow_api.id(1506948236428262236)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1506948704742262240)
,p_plug_name=>'Open Bugs by Status'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>90
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_customized=>'1'
,p_plug_comment=>' style="height: 400px; overflow: hidden;" data-grid="col_2" data-grid-start="yes"  '
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1506948744745262241)
,p_region_id=>wwv_flow_api.id(1506948704742262240)
,p_chart_type=>'bar'
,p_height=>'260'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1506948906176262242)
,p_chart_id=>wwv_flow_api.id(1506948744745262241)
,p_seq=>10
,p_name=>'Bugs'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.status_name status_name,',
'       count(*) c',
'from EBA_BT_SW_DEFECTS d,',
'                EBA_BT_STATUS c ',
'where  c.id = d.status_id and ',
'       (product_id = :P33_PRODUCT or nvl(:P33_PRODUCT,0) = 0) and',
'       c.id in (select id from eba_bt_status where nvl(is_open,''Y'') = ''Y'') and',
'       c.id not in (select id from eba_bt_status where nvl(is_enhancement,''N'') = ''Y'') ',
'and d.ASSIGNED_TO_ID = :P33_ID',
'group by c.status_name',
'order by 2 desc'))
,p_items_value_column_name=>'C'
,p_items_label_column_name=>'STATUS_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR:IREQ_STATUS_NAME,IREQ_PRODUCT_ID:&STATUS_NAME.,&P33_PRODUCT.'
,p_link_target_type=>'REDIRECT_PAGE'
);
end;
/
begin
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1506949024936262243)
,p_chart_id=>wwv_flow_api.id(1506948744745262241)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1506949031905262244)
,p_chart_id=>wwv_flow_api.id(1506948744745262241)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1428419652844962564)
,p_name=>'P33_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1428364647817809868)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1428426873228066477)
,p_name=>'P33_USERNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1428364647817809868)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1428427821330088580)
,p_computation_sequence=>10
,p_computation_item=>'P33_USERNAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username',
'from EBA_BT_USERs u',
'where id = :P33_ID'))
);
end;
/
