prompt --application/pages/page_00090
begin
wwv_flow_api.create_page(
 p_id=>90
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Enhancements Dashboard'
,p_step_title=>'Enhancements Dashboard'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'By default this page shows a dashboard of enhancement data for all enhancements in the application. You can change the Product filter value at the top of the page to change the displayed results. Click the <strong>Reset</strong> button to reset the p'
||'age to its default values.'
,p_last_updated_by=>'HILARY'
,p_last_upd_yyyymmddhh24miss=>'20190314064827'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37895305511641955)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225683943093288318)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(9594178551161609111)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1225705996474288347)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38160637572541299)
,p_plug_name=>'Enhancements by Product'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.product_name,',
'       count(*) c,',
'       p.id',
'from eba_bt_sw_defects d,',
'     eba_bt_product p',
'where p.id = d.product_id and ',
'      d.status_id  in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'')  and',
'      (NVL(:P90_PRODUCT,0)= 0 or p.id = NVL(:P90_PRODUCT,0))',
'group by p.product_name, p.id',
'order by 2 desc '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'PRODUCT_NAME'
,p_attribute_03=>'f?p=&APP_ID.:86:&APP_SESSION.::&DEBUG.:86,RIR,RP:P86_PRODUCT:&ID.'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'50'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No enhancements found.'
,p_plug_comment=>' style="height: 208px; overflow: hidden;" data-grid="col_2" data-grid-start="yes"  '
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38164440273657633)
,p_plug_name=>'Top Filers'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.username LOGIN_NAME,',
'       count(*) c,',
'       u.id sid',
'from eba_bt_sw_defects d,',
'     eba_bt_users u,',
'     eba_bt_product p',
'where u.id = d.submitted_by_id and',
'      d.product_id = p.id and',
'      d.status_id  in (select id from eba_bt_status where NVL(is_enhancement,''N'') = ''Y'')  and',
'      (NVL(:P90_PRODUCT,0)= 0 or p.id = NVL(:P90_PRODUCT,0))',
'group by u.username, u.id',
'order by 2 desc ',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'LOGIN_NAME'
,p_attribute_03=>'f?p=&APP_ID.:86:&APP_SESSION.::&DEBUG.:86,RIR,RP:P86_PRODUCT,IR_SUBMITTED_BY_ID:&P80_PRODUCT.,&SID.'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'50'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No filers found.'
,p_plug_comment=>' style="height: 208px; overflow: hidden;" data-grid="col_2" data-grid-start="yes"  '
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38166848036738268)
,p_plug_name=>'Filed by Month'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(d.created,''YYYY.MM'') filing_month,',
'       count(*) c',
'from eba_bt_sw_defects d,',
'     eba_bt_product p',
'where p.id = d.product_id and',
'      d.status_id  in (select id from eba_bt_status s where NVL(s.is_enhancement,''N'') = ''Y'') and',
'      (NVL(:P90_PRODUCT,0)= 0 or p.id = NVL(:P90_PRODUCT,0))',
'group by  to_char(d.created,''YYYY.MM'')',
'order by 1 desc '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'FILING_MONTH'
,p_attribute_03=>'f?p=&APP_ID.:86:&APP_SESSION.::&DEBUG.:86,RIR,RP:P86_PRODUCT,IR_FILE_MONTH:&P90_PRODUCT.,&FILING_MONTH.'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'500'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No filed enhancements found.'
,p_plug_comment=>' style="height: 208px; overflow: hidden;" data-grid="col_2" data-grid-start="yes"  '
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38167736437753075)
,p_plug_name=>'Top Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI:t-Form--leftLabels'
,p_plug_template=>wwv_flow_api.id(1225684792970288320)
,p_plug_display_sequence=>1
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38743347846247501)
,p_plug_name=>'Severity'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(d.created,''YYYY.MM'') filing_month,',
'       count(*) c',
'from eba_bt_sw_defects d,',
'     eba_bt_product p',
'where p.id = d.product_id and',
'      d.status_id  in (select id from eba_bt_status s where NVL(s.is_enhancement,''N'') = ''Y'') and',
'      (NVL(:P90_PRODUCT,0)= 0 or p.id = NVL(:P90_PRODUCT,0))',
'group by  to_char(d.created,''YYYY.MM'')',
'order by 1 desc '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'FILING_MONTH'
,p_attribute_03=>'f?p=&APP_ID.:86:&APP_SESSION.::&DEBUG.:86,RIR,RP:P86_PRODUCT,IR_FILE_MONTH:&P90_PRODUCT.,&FILING_MONTH.'
,p_attribute_04=>'C'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'500'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No severities found.'
,p_plug_comment=>' style="height: 208px; overflow: hidden;" data-grid="col_2" data-grid-start="yes"  '
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38160971312541303)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(38160637572541299)
,p_button_name=>'VIEW_assignees'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View Assignees'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38164789450657634)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(38164440273657633)
,p_button_name=>'VIEW_assignees'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View Assignees'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38168068591753077)
,p_name=>'P90_PRODUCT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(38167736437753075)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Products -'
,p_lov_null_value=>'0'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Choose the product name'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
end;
/
