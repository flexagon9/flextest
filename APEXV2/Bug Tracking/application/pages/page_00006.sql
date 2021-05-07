prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Assignees'
,p_step_title=>'Assignees'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2509222245997328767)
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Bugs may be assigned to users identified in this list.  The columns S1 through S4 indicate the bug severity (1-4). The columns P1 through P3 indicate the bug fix priority (1-3).  Edit the Assignee''''s details by clicking the User Name.  You can cli'
||'ck on any linked values to drill down further into the Bugs report.</p>',
unistr('<p>Use the product select list to filter this report by a specific product. Click the <strong>Reset</strong> button to reset the interactive Assignees report. Click the <strong>Actions \2228</strong> button to define the number of rows displayed per page')
||', filter, format, download, and/or save the interactive Assignees report.</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180124063707'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37903360119839896)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225683943093288318)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(9594178551161609111)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1225705996474288347)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2509219242964308930)
,p_plug_name=>'Developers'
,p_region_template_options=>'js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   id,',
'   login_name,',
'   first_Name,',
'   last_name,',
'   email,',
'   work_phone,',
'   created_on,',
'   created_by,',
'   products,',
'   open_bugs,',
'   open_bugs_s1,',
'   open_bugs_s2,',
'   open_bugs_s3,',
'   open_bugs_s4,',
'   open_bugs_p1,',
'   open_bugs_p2,',
'   open_bugs_p3,',
'   open_bugs_p4,',
'   closed_bugs,',
'   open_bugs - closed_bugs open_closed,',
'   open_7,',
'   closed_7,',
'   open_90,',
'   closed_90,',
'   open_7 - closed_7 delta_7,',
'   open_14 - closed_14 delta_14,',
'   open_30 - closed_30 delta_30,',
'   open_90 - closed_90 delta_90',
'from (',
'select	 id,',
'         u.username as "LOGIN_NAME",',
'	 u."FIRST_NAME" as "FIRST_NAME",',
'	 u."LAST_NAME" as "LAST_NAME",',
'	 u."EMAIL" as "EMAIL",',
'	 u."WORK_PHONE" as "WORK_PHONE",',
'	 u."CREATED" as "CREATED_ON",',
'	 u."CREATED_BY" as "CREATED_BY" ,',
'   (select count(distinct product_id) ',
'    from eba_bt_sw_defects d ',
'    where u.id = d.ASSIGNED_TO_ID and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) products,',
'   (select count(*) ',
'    from eba_bt_sw_defects d, eba_bt_status c ',
'    where c.id = d.status_id and ',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0) and',
'          NVL(c.is_enhancement,''N'') = ''N''',
'          ) open_bugs,',
'   (select count(*) ',
'    from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_SEVERITY s',
'    where c.id = d.status_id and ',
'          s.id = d.severity_id and',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          s.SEQUENCE_NUMBER = 1 and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'          ) open_bugs_s1,',
'   (select count(*) ',
'    from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_SEVERITY s',
'    where c.id = d.status_id and ',
'          s.id = d.severity_id and',
'          u.id = d.ASSIGNED_TO_ID and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          c.IS_OPEN = ''Y'' and',
'          s.SEQUENCE_NUMBER = 2 and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'          ) open_bugs_s2,',
'   (select count(*) ',
'    from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_SEVERITY s',
'    where c.id = d.status_id and ',
'          s.id = d.severity_id and',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          s.SEQUENCE_NUMBER = 3 and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'          ) open_bugs_s3,',
'   (select count(*) ',
'    from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_SEVERITY s',
'    where c.id = d.status_id and ',
'          s.id = d.severity_id and',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          s.SEQUENCE_NUMBER = 4 and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'          ) open_bugs_s4,',
'--',
'   (select count(*) ',
'    from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_URGENCY s',
'    where c.id = d.status_id and ',
'          s.id = d.urgency_id and',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          s.SEQUENCE_NUMBER = 1 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'          ) open_bugs_p1,',
'   (select count(*) ',
'    from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_URGENCY s',
'    where c.id = d.status_id and ',
'          s.id = d.urgency_id and',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          s.SEQUENCE_NUMBER = 2 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'          ) open_bugs_p2,',
'   (select count(*) ',
'    from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_URGENCY s',
'    where c.id = d.status_id and ',
'          s.id = d.urgency_id and',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          s.SEQUENCE_NUMBER = 3 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'          ) open_bugs_p3,',
'   (select count(*) ',
'    from eba_bt_sw_defects d, eba_bt_status c, EBA_BT_URGENCY s',
'    where c.id = d.status_id and ',
'          s.id = d.urgency_id and',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          s.SEQUENCE_NUMBER = 4 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)',
'          ) open_bugs_p4,',
'--',
'   (select count(*)',
'     from eba_bt_sw_defects d, eba_bt_status c ',
'    where c.id = d.status_id and ',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''N'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) closed_bugs,',
'--',
'    (select count(*) c',
'     from eba_bt_sw_defects d, eba_bt_status c ',
'    where c.id = d.status_id and ',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          d.created >= localtimestamp - 7 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) open_7,',
'    (select count(*) c',
'     from eba_bt_sw_defects d, eba_bt_status c ',
'    where c.id = d.status_id and ',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''N'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          d.DATE_CLOSED >= localtimestamp - 7 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) closed_7,',
'--',
'    (select count(*) c',
'     from eba_bt_sw_defects d, eba_bt_status c ',
'    where c.id = d.status_id and ',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          d.created >= localtimestamp - 14 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) open_14,',
'    (select count(*) c',
'     from eba_bt_sw_defects d, eba_bt_status c ',
'    where c.id = d.status_id and ',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''N'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          d.DATE_CLOSED >= localtimestamp - 14 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) closed_14,',
'--',
'    (select count(*) c',
'     from eba_bt_sw_defects d, eba_bt_status c ',
'    where c.id = d.status_id and ',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          d.created >= localtimestamp - 30 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) open_30,',
'    (select count(*) c',
'     from eba_bt_sw_defects d, eba_bt_status c ',
'    where c.id = d.status_id and ',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''N'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          d.DATE_CLOSED >= localtimestamp - 30 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) closed_30,',
'--',
'    (select count(*) c',
'     from eba_bt_sw_defects d, eba_bt_status c ',
'    where c.id = d.status_id and ',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''Y'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          d.created >= localtimestamp - 90 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) open_90,',
'    (select count(*) c',
'     from eba_bt_sw_defects d, eba_bt_status c ',
'    where c.id = d.status_id and ',
'          u.id = d.ASSIGNED_TO_ID and',
'          c.IS_OPEN = ''N'' and',
'          NVL(c.is_enhancement,''N'') = ''N'' and',
'          d.DATE_CLOSED >= localtimestamp - 90 and',
'          (:P6_PRODUCT = d.product_id or :P6_PRODUCT = 0)) closed_90',
'from   EBA_BT_USERs u',
'where  (:P6_PRODUCT = 0 or ',
'       exists (select 1 from eba_bt_sw_defects d where d.ASSIGNED_TO_ID = u.id and',
'          :P6_PRODUCT = d.product_id)',
'       )',
') x'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(2509219328778308930)
,p_name=>'Developers'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>654520801472319750
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509219546561308948)
,p_db_column_name=>'LOGIN_NAME'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'User Name'
,p_column_link=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP,33:P33_ID:#ID#'
,p_column_linktext=>'#LOGIN_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509219631939308949)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509219744325308949)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509219837898308949)
,p_db_column_name=>'EMAIL'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'EMail'
,p_column_link=>'mailto:#EMAIL#'
,p_column_linktext=>'#EMAIL#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509219955148308949)
,p_db_column_name=>'WORK_PHONE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Work Phone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509220256125308949)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509220355672308950)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Updated'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509222841465348608)
,p_db_column_name=>'OPEN_BUGS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Open Bugs'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P6:&DEBUG.:RP,23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN,IRNN_STATUS_NAME:#ID#,Yes,'
,p_column_linktext=>'#OPEN_BUGS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509222953168348608)
,p_db_column_name=>'CLOSED_BUGS'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Closed Bugs'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P6:&DEBUG.:RP,23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN:#ID#,No'
,p_column_linktext=>'#CLOSED_BUGS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509283746558242717)
,p_db_column_name=>'PRODUCTS'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Products'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509292331413310573)
,p_db_column_name=>'OPEN_BUGS_S1'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Open S1'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P6:&DEBUG.:RP,23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN,IR_SEVERITY:#ID#,Yes,1. Critical'
,p_column_linktext=>'#OPEN_BUGS_S1#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509293129675326539)
,p_db_column_name=>'OPEN_BUGS_S2'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Open S2'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P6:&DEBUG.:RP,23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN,IR_SEVERITY:#ID#,Yes,2. High'
,p_column_linktext=>'#OPEN_BUGS_S2#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509293457483328844)
,p_db_column_name=>'OPEN_BUGS_S3'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Open S3'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P6:&DEBUG.:RP,23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN,IR_SEVERITY:#ID#,Yes,3. Medium'
,p_column_linktext=>'#OPEN_BUGS_S3#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509293743465335277)
,p_db_column_name=>'OPEN_BUGS_S4'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Open S4'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P6:&DEBUG.:RP,23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN,IR_SEVERITY:#ID#,Yes,4. Low'
,p_column_linktext=>'#OPEN_BUGS_S4#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509305533347583079)
,p_db_column_name=>'OPEN_BUGS_P1'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Open P1'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P6:&DEBUG.:RP,23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN,IR_URGENCY_NAME:#ID#,Yes,1. Critical'
,p_column_linktext=>'#OPEN_BUGS_P1#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509305947784591579)
,p_db_column_name=>'OPEN_BUGS_P2'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Open P2'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P6:&DEBUG.:RP,23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN,IR_URGENCY_NAME:#ID#,Yes,2. High'
,p_column_linktext=>'#OPEN_BUGS_P2#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509306036097591579)
,p_db_column_name=>'OPEN_BUGS_P3'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Open P3'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P6:&DEBUG.:RP,23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN,IR_URGENCY_NAME:#ID#,Yes,3. Medium'
,p_column_linktext=>'#OPEN_BUGS_P3#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509306142689591579)
,p_db_column_name=>'OPEN_BUGS_P4'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Open P4'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:P6:&DEBUG.:RP,23,RIR:IR_ASSIGNED_TO_ID,IR_IS_OPEN,IR_URGENCY_NAME:#ID#,Yes,4 - Low'
,p_column_linktext=>'#OPEN_BUGS_P4#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422107094794601185)
,p_db_column_name=>'OPEN_CLOSED'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'S999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422107418313602347)
,p_db_column_name=>'ID'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422110104380673177)
,p_db_column_name=>'DELTA_7'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Delta 7'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'S999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422110160308673177)
,p_db_column_name=>'DELTA_14'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Delta 14'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'S999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422110277502673177)
,p_db_column_name=>'DELTA_30'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Delta 30'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'S999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422110517557673178)
,p_db_column_name=>'DELTA_90'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Delta 90'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'S999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422173280527750231)
,p_db_column_name=>'OPEN_7'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Open 7'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422173351646750231)
,p_db_column_name=>'CLOSED_7'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Closed 7'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422174931842789724)
,p_db_column_name=>'OPEN_90'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Open 90'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1422175127645789725)
,p_db_column_name=>'CLOSED_90'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Closed 90'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2509220746427309910)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6545223'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LOGIN_NAME:OPEN_BUGS:CLOSED_BUGS:OPEN_CLOSED:OPEN_BUGS_S1:OPEN_BUGS_S2:OPEN_BUGS_S3:OPEN_BUGS_S4:DELTA_7:DELTA_14:DELTA_30:DELTA_90'
,p_sort_column_1=>'OPEN_BUGS'
,p_sort_direction_1=>'DESC'
,p_sum_columns_on_break=>'OPEN_BUGS:CLOSED_BUGS:OPEN_BUGS_S3:OPEN_BUGS_S2:OPEN_BUGS_S1:OPEN_BUGS_S4:OPEN_BUGS_P1:OPEN_BUGS_P3:OPEN_BUGS_P2:OPEN_BUGS_P4'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2509294045125340953)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2509223243404365825)
,p_button_sequence=>20
,p_button_name=>'ADD_DEVELOPER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Assignee'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,21::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71218607307269714)
,p_button_sequence=>30
,p_button_name=>'SYNC'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Sync'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
,p_required_patch=>wwv_flow_api.id(16725495374012530)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2509223059072351471)
,p_button_sequence=>10
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Reset Report'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2509294353804345766)
,p_name=>'P6_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2509294045125340953)
,p_item_default=>'0'
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Product -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1415235523701030103)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(941700347513969869)
,p_name=>'Refresh Report on Sync'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(71218607307269714)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(941700461859969870)
,p_event_id=>wwv_flow_api.id(941700347513969869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2509219242964308930)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1438263564381750275)
,p_name=>'Refresh IRR'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_PRODUCT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P6_PRODUCT'') == ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496372701831049826)
,p_event_id=>wwv_flow_api.id(1438263564381750275)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P6_PRODUCT := 0;'
,p_attribute_02=>'P6_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496373113571049830)
,p_event_id=>wwv_flow_api.id(1438263564381750275)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P6_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496372925902049828)
,p_event_id=>wwv_flow_api.id(1438263564381750275)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2509219242964308930)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496372783888049827)
,p_event_id=>wwv_flow_api.id(1438263564381750275)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2509219242964308930)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496373027936049829)
,p_event_id=>wwv_flow_api.id(1438263564381750275)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2509219242964308930)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
