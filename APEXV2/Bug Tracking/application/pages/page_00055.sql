prompt --application/pages/page_00055
begin
wwv_flow_api.create_page(
 p_id=>55
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Releases'
,p_step_title=>'Releases'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Use the product select list to filter this report by a specific product. Click the <strong>Reset</strong> button to reset the interactive Releases report. Click the <strong>Actions \2228</strong> button to define the number of rows displayed per page, fi')
||'lter, format, download, and/or save the interactive Releases report.'
,p_last_upd_yyyymmddhh24miss=>'20180124063707'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1414659075877727482)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1414660889695747825)
,p_plug_name=>'Releases'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''f?p=''||:APP_ID||'':51:''||:APP_SESSION||'':::51:P51_ID:''||v.id edit_url,',
'    v.id, ',
'    p.product_name product,',
'    p.product_name||'' ''||v.version_name product_release,',
'    v.product_id,',
'    v.version_name,',
'    v.description,',
'    v.release_date,',
'    v.is_active,',
'    v.created,',
'    v.created_by,',
'    v.updated,',
'    v.updated_by,',
'    (select count(*) from eba_bt_sw_defects a where a.fix_by_version_id = v.id and a.product_id = p.id) targeted_by,',
'    (select count(*) from eba_bt_sw_defects a where a.fix_by_version_id = v.id and a.product_id = p.id and status_id in ',
'    (select id from eba_bt_status s where s.id = a.status_id and s.is_open = ''Y'')) targeted_by_open,',
'    (select count(*) from eba_bt_sw_defects a where a.fix_by_version_id = v.id and a.product_id = p.id and status_id in ',
'    (select id from eba_bt_status s where s.id = a.status_id and s.is_open = ''N'')) targeted_by_closed,',
'    (select count(*) from eba_bt_sw_defects a where a.fixed_version_id = v.id and a.product_id = p.id) fixed_in,',
'    (select count(*) from eba_bt_sw_defects a where a.found_version_id = v.id and a.product_id = p.id) found_id',
'from eba_bt_version v,',
'    eba_bt_product p',
'where p.id = v.product_id and',
'    (:P55_PRODUCT = p.id or NVL(:P55_PRODUCT,0) = 0)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1414660995722747825)
,p_name=>'Releases'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
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
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>1404591466718808000
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414661154587747845)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'selected release'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414661322543747847)
,p_db_column_name=>'PRODUCT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414661404685747847)
,p_db_column_name=>'PRODUCT_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Product Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414661505692747848)
,p_db_column_name=>'VERSION_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Release'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414661542352747848)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414661661339747848)
,p_db_column_name=>'RELEASE_DATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Release Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414661814300747848)
,p_db_column_name=>'IS_ACTIVE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Is Active'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414661851540747848)
,p_db_column_name=>'CREATED'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414661962077747848)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414662034998747848)
,p_db_column_name=>'UPDATED'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414662200280747848)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414664149029796910)
,p_db_column_name=>'TARGETED_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Fix By'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,RIR,23:IR_FIX_BY:#VERSION_NAME#'
,p_column_linktext=>'#TARGETED_BY#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414664260066796910)
,p_db_column_name=>'FIXED_IN'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Fixed In'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414664445931808246)
,p_db_column_name=>'FOUND_ID'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Found In'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR:IR_FOUND_IN:#FOUND_ID#'
,p_column_linktext=>'#FOUND_ID#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414664975486824441)
,p_db_column_name=>'EDIT_URL'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Edit'
,p_column_link=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.:51:P51_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_security_scheme=>wwv_flow_api.id(3797358846252064904)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414713723654875979)
,p_db_column_name=>'TARGETED_BY_OPEN'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Fix By (Open)'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR:IR_FIX_BY,IR_IS_OPEN:#VERSION_NAME#,Yes'
,p_column_linktext=>'#TARGETED_BY_OPEN#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414714020146886372)
,p_db_column_name=>'TARGETED_BY_CLOSED'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Fix By (Closed)'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR:IR_FIX_BY,IR_IS_OPEN:#VERSION_NAME#,No'
,p_column_linktext=>'#TARGETED_BY_CLOSED#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1414715577147933313)
,p_db_column_name=>'PRODUCT_RELEASE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Product Release'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1414662253626748095)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'14045928'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'EDIT_URL:PRODUCT_RELEASE:FOUND_ID:TARGETED_BY_OPEN:TARGETED_BY_CLOSED:FIXED_IN:RELEASE_DATE:DESCRIPTION:'
,p_sort_column_1=>'TARGETED_BY_OPEN'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'VERSION_NAME'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'RELEASE_DATE'
,p_sort_direction_3=>'DESC NULLS LAST'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1414664604227815926)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1414660889695747825)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:&APP_PAGE_ID.:&DEBUG.:&DEBUG.::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1414659275291727483)
,p_name=>'P55_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1414659075877727482)
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
 p_id=>wwv_flow_api.id(1414713215178851904)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1103797885780068164)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1103797946698068165)
,p_event_id=>wwv_flow_api.id(1103797885780068164)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1414660889695747825)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1438262317666750262)
,p_name=>'Refresh IRR'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_PRODUCT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P55_PRODUCT'') == ''0'' || $v(''P55_PRODUCT'') == ''undefined'''
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438262364598750263)
,p_event_id=>wwv_flow_api.id(1438262317666750262)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P55_PRODUCT := 0;'
,p_attribute_02=>'P55_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438262832799750268)
,p_event_id=>wwv_flow_api.id(1438262317666750262)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P55_PRODUCT'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438262554703750265)
,p_event_id=>wwv_flow_api.id(1438262317666750262)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1414660889695747825)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438262503409750264)
,p_event_id=>wwv_flow_api.id(1438262317666750262)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1414660889695747825)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1438262670131750266)
,p_event_id=>wwv_flow_api.id(1438262317666750262)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1414660889695747825)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
