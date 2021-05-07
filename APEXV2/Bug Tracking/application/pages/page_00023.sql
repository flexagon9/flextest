prompt --application/pages/page_00023
begin
wwv_flow_api.create_page(
 p_id=>23
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Popup Bugs'
,p_step_title=>'Bugs'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141455855818868)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'',
'',
'',
'//-->',
'</script>'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_step_template=>wwv_flow_api.id(1225652808464288287)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>unistr('<p>Click the <strong>Reset</strong> button to reset the interactive Bugs report. Click the <strong>Actions \2228</strong> button to define the number of rows displayed per page, filter, format, download, and/or save the interactive Bugs report.</p>')
,p_last_upd_yyyymmddhh24miss=>'20180124063707'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71199017827003507)
,p_plug_name=>'About Container'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71202320697047424)
,p_plug_name=>'About No Sync'
,p_parent_plug_id=>wwv_flow_api.id(71199017827003507)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(''<p>'');',
'',
'for c1 in (select product_name from eba_bt_product where id = :PRODUCT_ID) loop',
'    sys.htp.p(apex_escape.html(c1.product_name)||'' bugs:  '');',
'end loop;',
'sys.htp.p(''Click on column headings to sort and filter specific columns.  '');',
'sys.htp.p(''Click the <strong>Action</strong> button to control column selection and view additional options.  '');',
'',
'',
'sys.htp.p(''</p>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_required_patch=>-wwv_flow_api.id(16725495374012530)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4400434035711036036)
,p_plug_name=>'timezone'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>50
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
 p_id=>wwv_flow_api.id(6308606594045289321)
,p_plug_name=>'Bugs'
,p_region_template_options=>'js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     a.id,',
'     a.bug_number,',
'     a.SUBJECT, ',
'     STATUS_NAME, ',
'     URGENCY_NAME, ',
'     username LOGIN_NAME, ',
'     a.product_id,',
'     (select SEVERITY_NAME from EBA_BT_SEVERITY s where s.id = a.SEVERITY_id) severity,',
'     (select sequence_number from EBA_BT_SEVERITY s where s.id = a.SEVERITY_id) severity_number,',
'     ( select username from eba_bt_users where id = a.submitted_by_id ) submitted_by,',
'     SUBMITTED_ON,',
'     e.PRODUCT_NAME,',
'     apex_util.prepare_url(''f?p='' || :app_id || '':48:'' || :app_session || '':::48:P48_ID:''||a.id) as url ,',
'     (select version_name from EBA_BT_VERSION v where v.id = a.FIXED_VERSION_ID) fixed_in,',
'      (select version_name from EBA_BT_VERSION v where v.id = a.FOUND_VERSION_ID) found_in,',
'     NVL((select version_name from EBA_BT_VERSION v where v.id = a.FIX_BY_VERSION_ID),''Not Targeted'') fix_by,',
'     nvl(a.fix_by_version_id,0) fix_by_version_id,',
'     a.created,',
'     a.created created_date,',
'     a.date_closed,',
'     (select category_name from eba_bt_category cat where cat.id = a.category_id) category,',
'     a.category_id,',
'     coalesce(a.sync_last_upd,a.updated,a.created) updated,',
'     dbms_lob.substr(a.description,500,1) description, ',
'     a.tags,',
'     decode(b.is_open,''Y'',''Yes'',''N'',''No'',null,''Yes'') is_open,',
'     c.id priority_id,',
'     a.SEVERITY_id severity_id,',
'     a.assigned_to_id,',
'     a.created_by,',
'     (select customer_name from eba_bt_customers cc where cc.id = a.customer_id) customer,',
'     a.customer_id,',
'     a.sync_last_upd,',
'     (select distinct first_value(link_target) over (order by created desc) from EBA_BT_LINKS where bug_id = a.id ) link_target,',
'     b.id status_code',
'from EBA_BT_SW_DEFECTS a, ',
'    eba_bt_status b, ',
'    eba_bt_urgency c, ',
'    eba_bt_users d, ',
'    eba_bt_product e ',
'where',
'   ( e.id = :PRODUCT_ID or nvl(:PRODUCT_ID,0) = 0 ) and',
'    a.STATUS_ID = b.id (+) and ',
'    a.URGENCY_ID = c.id (+) and ',
'    a.assigned_to_id = d.id (+) and ',
'    a.PRODUCT_ID = e.id (+) and',
'    NVL(b.is_enhancement,''N'') = ''N'';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(6308606682635289321)
,p_name=>'Search Results'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than 10,000 rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No bugs found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:PDF'
,p_download_filename=>'bugs'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>4453908155329300141
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308606866673289329)
,p_db_column_name=>'ID'
,p_display_order=>2
,p_column_identifier=>'A'
,p_column_label=>'Bug ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308607467801289333)
,p_db_column_name=>'PRODUCT_NAME'
,p_display_order=>3
,p_column_identifier=>'G'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308606970534289332)
,p_db_column_name=>'SUBJECT'
,p_display_order=>4
,p_column_identifier=>'B'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308607098893289332)
,p_db_column_name=>'STATUS_NAME'
,p_display_order=>5
,p_column_identifier=>'C'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308607181325289332)
,p_db_column_name=>'URGENCY_NAME'
,p_display_order=>6
,p_column_identifier=>'D'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308607275741289333)
,p_db_column_name=>'LOGIN_NAME'
,p_display_order=>7
,p_column_identifier=>'E'
,p_column_label=>'Assignee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308607568216289333)
,p_db_column_name=>'URL'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'URL'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6308607373414289333)
,p_db_column_name=>'SUBMITTED_BY'
,p_display_order=>9
,p_column_identifier=>'F'
,p_column_label=>'Submitted By'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503059777931333389)
,p_db_column_name=>'BUG_NUMBER'
,p_display_order=>12
,p_column_identifier=>'K'
,p_column_label=>'Bug #'
,p_column_link=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31:P31_ID:#ID#'
,p_column_linktext=>'#BUG_NUMBER#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch t-Button--small"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503063781188419443)
,p_db_column_name=>'SEVERITY'
,p_display_order=>13
,p_column_identifier=>'L'
,p_column_label=>'Severity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503064781673504749)
,p_db_column_name=>'FIXED_IN'
,p_display_order=>14
,p_column_identifier=>'M'
,p_column_label=>'Fixed In'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503064872645504750)
,p_db_column_name=>'FOUND_IN'
,p_display_order=>15
,p_column_identifier=>'N'
,p_column_label=>'Found In'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503064966778504750)
,p_db_column_name=>'FIX_BY'
,p_display_order=>16
,p_column_identifier=>'O'
,p_column_label=>'Fix By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5511114286465556738)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>18
,p_column_identifier=>'Q'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5604482274656691560)
,p_db_column_name=>'TAGS'
,p_display_order=>20
,p_column_identifier=>'S'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_rpt_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'  from eba_bt_tags_type_sum',
' where content_type = ''DEFECT''',
'   and tag_count > 0'))
,p_rpt_show_filter_lov=>'C'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4522797153093472240)
,p_db_column_name=>'PRODUCT_ID'
,p_display_order=>21
,p_column_identifier=>'T'
,p_column_label=>'Selected Product'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4522808132249636494)
,p_db_column_name=>'IS_OPEN'
,p_display_order=>22
,p_column_identifier=>'U'
,p_column_label=>'Open'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523120645305857929)
,p_db_column_name=>'SUBMITTED_ON'
,p_display_order=>23
,p_column_identifier=>'V'
,p_column_label=>'Submitted On'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523120746499857929)
,p_db_column_name=>'CREATED'
,p_display_order=>24
,p_column_identifier=>'W'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523120957485857929)
,p_db_column_name=>'PRIORITY_ID'
,p_display_order=>26
,p_column_identifier=>'Y'
,p_column_label=>'Selected Priority'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523121052192857930)
,p_db_column_name=>'SEVERITY_ID'
,p_display_order=>27
,p_column_identifier=>'Z'
,p_column_label=>'Selected Severity'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4523160848739682105)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>28
,p_column_identifier=>'AA'
,p_column_label=>'Filed'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4526695842802221947)
,p_db_column_name=>'DATE_CLOSED'
,p_display_order=>29
,p_column_identifier=>'AB'
,p_column_label=>'Closed'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509264533502127176)
,p_db_column_name=>'ASSIGNED_TO_ID'
,p_display_order=>30
,p_column_identifier=>'AC'
,p_column_label=>'Selected Assignee'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2509307955738618288)
,p_db_column_name=>'SEVERITY_NUMBER'
,p_display_order=>31
,p_column_identifier=>'AD'
,p_column_label=>'Selected Severity Number'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1322397010468933954)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>32
,p_column_identifier=>'AE'
,p_column_label=>'Filed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1342756735868778634)
,p_db_column_name=>'CATEGORY'
,p_display_order=>33
,p_column_identifier=>'AF'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414649466009568287)
,p_db_column_name=>'FIX_BY_VERSION_ID'
,p_display_order=>34
,p_column_identifier=>'AG'
,p_column_label=>'Selected Fix By Version '
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1428675565234927662)
,p_db_column_name=>'CATEGORY_ID'
,p_display_order=>35
,p_column_identifier=>'AH'
,p_column_label=>'Selected Category'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1436528525324821377)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>36
,p_column_identifier=>'AI'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1436591636441042217)
,p_db_column_name=>'UPDATED'
,p_display_order=>37
,p_column_identifier=>'AJ'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1436591816559042219)
,p_db_column_name=>'SYNC_LAST_UPD'
,p_display_order=>38
,p_column_identifier=>'AK'
,p_column_label=>'Sync Last Upd'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2198483573519639662)
,p_db_column_name=>'LINK_TARGET'
,p_display_order=>39
,p_column_identifier=>'AL'
,p_column_label=>'Latest Link'
,p_column_link=>'#LINK_TARGET#'
,p_column_linktext=>'<span class="t-Icon fa fa-external-link"></span><span class="u-VisuallyHidden">Open Link</span>'
,p_column_link_attr=>'target="_blank" class="t-Button t-Button--simple t-Button--warning t-Button--small t-Button--noLabel t-Button--icon t-Button--iconOnly t-Button--stretch"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37907367042927853)
,p_db_column_name=>'CUSTOMER_ID'
,p_display_order=>40
,p_column_identifier=>'AM'
,p_column_label=>'Selected Customer'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(57292785930249927)
,p_db_column_name=>'STATUS_CODE'
,p_display_order=>50
,p_column_identifier=>'AN'
,p_column_label=>'Status Code'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6308607785309289550)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8129151'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'BUG_NUMBER:SUBJECT:STATUS_NAME:SEVERITY:LOGIN_NAME:CREATED_DATE:UPDATED:FIX_BY:IS_OPEN:LINK_TARGET:'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'CREATED_DATE'
,p_sort_direction_2=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10624973776903908539)
,p_button_sequence=>10
,p_button_name=>'CREATE_BUG'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Bug'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:93::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37955916907064875)
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
 p_id=>wwv_flow_api.id(1051964589084326898)
,p_button_sequence=>5
,p_button_name=>'ALL_PRODUCTS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'All Products'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-archive'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1350248403837273291)
,p_button_sequence=>20
,p_button_name=>'SELECT_PRODUCT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Select Product'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-archive'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4522797230714475210)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6308606594045289321)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10403737478436782649)
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6334016700014764281)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10624974000306908540)
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(10624973776903908539)
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10404678982992603753)
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6334022699714792647)
,p_branch_sequence=>30
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5505090477303529697)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(941699523735969860)
,p_name=>'Refresh After Sync (Button)'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37955916907064875)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(941699560385969861)
,p_event_id=>wwv_flow_api.id(941699523735969860)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(6308606594045289321)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2546782143724702918)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set product from p6'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P6_PRODUCT > 0 then',
'    apex_util.ir_filter (',
'       p_page_id        => 23,',
'       p_report_column  => ''PRODUCT_ID'',',
'       p_operator_abbr  => ''EQ'',',
'       p_filter_value   => :P6_PRODUCT );',
'end if;'))
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6363223598302601050)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10403734005406773071)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'2'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(991599813880883432)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set PRODUCT_ID to zero'
,p_process_sql_clob=>':PRODUCT_ID := ''0'';'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1051964589084326898)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10404650488481584798)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when=>'QUERY'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
