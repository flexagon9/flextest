prompt --application/pages/page_00086
begin
wwv_flow_api.create_page(
 p_id=>86
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Enhancements'
,p_step_title=>'Enhancements'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>unistr('<p>Use the product select list to filter this report by a specific product. Click the <strong>Reset</strong> button to reset the interactive Enhancements report. Click the <strong>Actions \2228</strong> button to define the number of rows displayed per p')
||'age, filter, format, download, and/or save the interactive Enhancements report.</p>'
,p_last_upd_yyyymmddhh24miss=>'20180124063707'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37874575838478320)
,p_plug_name=>'Enhancement Requests'
,p_region_template_options=>'js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>20
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
'     a.submitted_by_id submitted_by_id,',
'     SUBMITTED_ON,',
'     e.PRODUCT_NAME,',
'     apex_util.prepare_url(''f?p='' || :app_id || '':48:'' || :app_session || '':::48:P48_ID:''||a.id) as url ,',
'     (select version_name from EBA_BT_VERSION v where v.id = a.FIXED_VERSION_ID) fixed_in,',
'      (select version_name from EBA_BT_VERSION v where v.id = a.FOUND_VERSION_ID) found_in,',
'      (select version_name from EBA_BT_VERSION v where v.id = a.FIX_BY_VERSION_ID) fix_by,',
'     nvl(a.fix_by_version_id,0) fix_by_version_id,',
'     a.created,',
'     to_char(a.created,''YYYY.MM'') file_month,',
'     a.created created_date,',
'     a.date_closed,',
'     (select category_name from eba_bt_category cat where cat.id = a.category_id) category,',
'     a.category_id,',
'     nvl(NVL(a.sync_last_upd,a.updated),a.created) updated,',
'     dbms_lob.substr(a.description,500,1) description, ',
'     a.tags,',
'     decode(b.is_open,''Y'',''Yes'',''N'',''No'',null,''Yes'') is_open,',
'     c.id priority_id,',
'     a.SEVERITY_id severity_id,',
'     a.assigned_to_id,',
'     a.created_by,',
'     a.customer,',
'     a.sync_last_upd,',
'     (select distinct first_value(link_target) over (order by created desc) from EBA_BT_LINKS where bug_id = a.id ) link_target',
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
'    NVL(b.is_enhancement,''N'') = ''Y'' '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(37874877298478323)
,p_name=>'Search Results'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than 10,000 rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No enhancements found.'
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
,p_owner=>'MIKE'
,p_internal_uid=>27805348294538498
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37875011103478325)
,p_db_column_name=>'ID'
,p_display_order=>2
,p_column_identifier=>'A'
,p_column_label=>'Enhancement ID'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37882496483478334)
,p_db_column_name=>'PRODUCT_NAME'
,p_display_order=>3
,p_column_identifier=>'G'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37880468498478332)
,p_db_column_name=>'SUBJECT'
,p_display_order=>4
,p_column_identifier=>'B'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37880927180478332)
,p_db_column_name=>'STATUS_NAME'
,p_display_order=>5
,p_column_identifier=>'C'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37881271545478333)
,p_db_column_name=>'URGENCY_NAME'
,p_display_order=>6
,p_column_identifier=>'D'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37881678339478333)
,p_db_column_name=>'LOGIN_NAME'
,p_display_order=>7
,p_column_identifier=>'E'
,p_column_label=>'Assignee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37882856446478334)
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
 p_id=>wwv_flow_api.id(37882125817478333)
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
 p_id=>wwv_flow_api.id(37883321165478335)
,p_db_column_name=>'BUG_NUMBER'
,p_display_order=>12
,p_column_identifier=>'K'
,p_column_label=>'Enhancement #'
,p_column_link=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31:P31_ID:#ID#'
,p_column_linktext=>'#BUG_NUMBER#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch t-Button--small"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37883665064478336)
,p_db_column_name=>'SEVERITY'
,p_display_order=>13
,p_column_identifier=>'L'
,p_column_label=>'Severity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37884124232478336)
,p_db_column_name=>'FIXED_IN'
,p_display_order=>14
,p_column_identifier=>'M'
,p_column_label=>'Fixed In'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37884429260478337)
,p_db_column_name=>'FOUND_IN'
,p_display_order=>15
,p_column_identifier=>'N'
,p_column_label=>'Found In'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37884887596478337)
,p_db_column_name=>'FIX_BY'
,p_display_order=>16
,p_column_identifier=>'O'
,p_column_label=>'Fix By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37885262090478337)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>18
,p_column_identifier=>'Q'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37885639982478338)
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
 p_id=>wwv_flow_api.id(37886105137478339)
,p_db_column_name=>'PRODUCT_ID'
,p_display_order=>21
,p_column_identifier=>'T'
,p_column_label=>'Selected Product'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37886512111478339)
,p_db_column_name=>'IS_OPEN'
,p_display_order=>22
,p_column_identifier=>'U'
,p_column_label=>'Open'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37886924939478339)
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
 p_id=>wwv_flow_api.id(37887327728478340)
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
 p_id=>wwv_flow_api.id(37887663844478340)
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
 p_id=>wwv_flow_api.id(37888042857478340)
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
 p_id=>wwv_flow_api.id(37875349597478326)
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
 p_id=>wwv_flow_api.id(37875753681478327)
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
 p_id=>wwv_flow_api.id(37876169897478327)
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
 p_id=>wwv_flow_api.id(37876605389478327)
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
 p_id=>wwv_flow_api.id(37877284867478328)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>32
,p_column_identifier=>'AE'
,p_column_label=>'Filed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37877712820478328)
,p_db_column_name=>'CATEGORY'
,p_display_order=>33
,p_column_identifier=>'AF'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37878092702478329)
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
 p_id=>wwv_flow_api.id(37878481988478329)
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
 p_id=>wwv_flow_api.id(37878881513478330)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>36
,p_column_identifier=>'AI'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37879309727478330)
,p_db_column_name=>'UPDATED'
,p_display_order=>37
,p_column_identifier=>'AJ'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37879667606478330)
,p_db_column_name=>'SYNC_LAST_UPD'
,p_display_order=>38
,p_column_identifier=>'AK'
,p_column_label=>'Sync Last Upd'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37880080928478331)
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
 p_id=>wwv_flow_api.id(38182703955815119)
,p_db_column_name=>'SUBMITTED_BY_ID'
,p_display_order=>40
,p_column_identifier=>'AM'
,p_column_label=>'Selected Submitter'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38200964871900398)
,p_db_column_name=>'FILE_MONTH'
,p_display_order=>41
,p_column_identifier=>'AN'
,p_column_label=>'File Month'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(37888499757478341)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'278190'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'BUG_NUMBER:SUBJECT:STATUS_NAME:SEVERITY:LOGIN_NAME:CREATED_DATE:FOUND_IN:TAGS:UPDATED:IS_OPEN:LINK_TARGET:'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'CREATED_DATE'
,p_sort_direction_2=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37890655991483880)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225683943093288318)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(9594178551161609111)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1225705996474288347)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37985157893083071)
,p_plug_name=>'Top Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI:t-Form--leftLabels'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1475420074870911684)
,p_button_sequence=>20
,p_button_name=>'CREATE_BUG'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Bug'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:RP,93:P93_STATUS_ID:15'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37989907454425146)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(37874575838478320)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37985516351083098)
,p_name=>'P86_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(37985157893083071)
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
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Choose the product name'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(37989304886093459)
,p_computation_sequence=>10
,p_computation_item=>'PRODUCT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&P86_PRODUCT.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1496373164812049831)
,p_name=>'Refresh IRR'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P86_PRODUCT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P86_PRODUCT'') == ''0'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496373253186049832)
,p_event_id=>wwv_flow_api.id(1496373164812049831)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P86_PRODUCT := 0;'
,p_attribute_02=>'P86_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496373510549049834)
,p_event_id=>wwv_flow_api.id(1496373164812049831)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P86_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496373543949049835)
,p_event_id=>wwv_flow_api.id(1496373164812049831)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(37874575838478320)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496373356331049833)
,p_event_id=>wwv_flow_api.id(1496373164812049831)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(37874575838478320)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1496373699967049836)
,p_event_id=>wwv_flow_api.id(1496373164812049831)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(37874575838478320)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
