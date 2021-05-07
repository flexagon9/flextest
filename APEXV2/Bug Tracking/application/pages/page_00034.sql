prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Categories'
,p_step_title=>'Categories'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'    Bugs by Categories',
'</h2>',
'<p>',
'    View the number of bugs contained in each category.',
'</p>',
'<p>',
'    Click the Bug Count to view a list of bugs in that category.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180124063707'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1428596134903751516)
,p_plug_name=>'&PRODUCT_NAME. Categories'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(1225689895461288323)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select x.category_name, x.id, x.c, 100 * (x.c / y.c ) chart ',
'from (',
'select p.CATEGORY_NAME,',
'       p.id,',
'       count(*) c',
'from EBA_BT_SW_DEFECTS d,',
'             eba_bt_category p,',
'             eba_bt_status c',
'	where p.id = d.category_id ',
'        and c.id = d.status_id ',
'        and nvl(d.is_active,''Y'') = ''Y''',
'	and (d.product_id = :P34_PRODUCT or nvl(:P34_PRODUCT,0) = 0)',
'and',
'       c.id in (select id from eba_bt_status where nvl(is_open,''Y'') = ''Y'')',
'	group by P.category_name , p.id',
') x,',
'(select count(*) c',
'from EBA_BT_SW_DEFECTS d,',
'             eba_bt_category p,',
'             eba_bt_status c',
'	where p.id = d.category_id ',
'        and c.id = d.status_id ',
'        and nvl(d.is_active,''Y'') = ''Y''',
'	and (d.product_id = :P34_PRODUCT or nvl(:P34_PRODUCT,0) = 0)',
'and',
'       c.id in (select id from eba_bt_status where nvl(is_open,''Y'') = ''Y'') ) y',
'order by 2 desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1428596354481751530)
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
,p_internal_uid=>1418526825477811705
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1428602097875807800)
,p_db_column_name=>'CATEGORY_NAME'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Category Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1428602179176807801)
,p_db_column_name=>'C'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Bug Count'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23,RIR:IR_CATEGORY_ID:#ID#'
,p_column_linktext=>'#C#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1428676103962936317)
,p_db_column_name=>'ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Selected Caegory'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1428728234960095901)
,p_db_column_name=>'CHART'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Chart'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1428598246852751557)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'14185288'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CATEGORY_NAME:C:ID:CHART'
,p_sort_column_1=>'C'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'TARGETED_BY_OPEN'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'VERSION_NAME'
,p_sort_direction_3=>'DESC'
,p_sort_column_4=>'RELEASE_DATE'
,p_sort_direction_4=>'DESC NULLS LAST'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1428598494503751567)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1428598687730751567)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1428596134903751516)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1428598900527751568)
,p_name=>'P34_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1428598494503751567)
,p_item_default=>'&PRODUCT_ID.'
,p_prompt=>'Product'
,p_source=>'&PRODUCT_ID.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Products -'
,p_lov_null_value=>'0'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1428599410277751577)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
end;
/
