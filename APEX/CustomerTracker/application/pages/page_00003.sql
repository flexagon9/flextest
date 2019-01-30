--application/pages/page_00003
prompt  ...PAGE 3: Products
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 3
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Products'
 ,p_step_title => 'Sample Database Application - Products'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188011359373082 + wwv_flow_api.g_id_offset
 ,p_inline_css => 
'table.apexir_WORKSHEET_CUSTOM td {'||unistr('\000a')||
'border-right: none !important;'||unistr('\000a')||
'}'
 ,p_step_template => 1020515051496437553 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20130716124327'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select p.product_id,'||unistr('\000a')||
'       p.product_name, '||unistr('\000a')||
'       p.product_description, '||unistr('\000a')||
'       p.category, '||unistr('\000a')||
'       decode(p.product_avail, ''Y'',''Yes'',''N'',''No'') product_avail,'||unistr('\000a')||
'       p.list_price,'||unistr('\000a')||
'       (select sum(quantity) from demo_order_items where product_id = p.product_id) units,'||unistr('\000a')||
'       (select sum(quantity * p.list_price) from demo_order_items where product_id = p.product_id) sales,       '||unistr('\000a')||
'       (selec';

s:=s||'t count(o.customer_id) from demo_orders o, demo_order_items t where o.order_id = t.order_id and t.product_id = p.product_id group by p.product_id) customers,'||unistr('\000a')||
'       (select max(o.order_timestamp) od from demo_orders o, demo_order_items i where o.order_id = i.order_id and i.product_id = p.product_id) last_date_sold,'||unistr('\000a')||
'       p.product_id img,'||unistr('\000a')||
'apex_util.prepare_url(''f?p=''||:app_id||'':6:''||:app_session';

s:=s||'||''::::P6_PRODUCT_ID,P6_BRANCH:''||p.product_id||'',''||3) icon_link,'||unistr('\000a')||
'decode(nvl(dbms_lob.getlength(p.product_image),0),0,null,'||unistr('\000a')||
'    ''<img alt="''||p.product_name||''" title="''||p.product_name||''" style="border: 4px solid #CCC; -moz-border-radius: 4px; -webkit-border-radius: 4px;" ''||'||unistr('\000a')||
'    ''src="''||'||unistr('\000a')||
'    apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',p.product_id)||'||unistr('\000a')||
'    ''" height="75" width="75" />'')'||unistr('\000a')||
'    ';

s:=s||'detail_img,'||unistr('\000a')||
'decode(nvl(dbms_lob.getlength(p.product_image),0),0,null,'||unistr('\000a')||
'    apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',p.product_id))'||unistr('\000a')||
'    detail_img_no_style,'||unistr('\000a')||
'    tags'||unistr('\000a')||
'from demo_product_info p';

wwv_flow_api.create_page_plug (
  p_id=> 7400401913230195362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_plug_name=> 'Products',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_rest_enabled=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select p.product_id,'||unistr('\000a')||
'       p.product_name, '||unistr('\000a')||
'       p.product_description, '||unistr('\000a')||
'       p.category, '||unistr('\000a')||
'       decode(p.product_avail, ''Y'',''Yes'',''N'',''No'') product_avail,'||unistr('\000a')||
'       p.list_price,'||unistr('\000a')||
'       (select sum(quantity) from demo_order_items where product_id = p.product_id) units,'||unistr('\000a')||
'       (select sum(quantity * p.list_price) from demo_order_items where product_id = p.product_id) sales,       '||unistr('\000a')||
'       (selec';

a1:=a1||'t count(o.customer_id) from demo_orders o, demo_order_items t where o.order_id = t.order_id and t.product_id = p.product_id group by p.product_id) customers,'||unistr('\000a')||
'       (select max(o.order_timestamp) od from demo_orders o, demo_order_items i where o.order_id = i.order_id and i.product_id = p.product_id) last_date_sold,'||unistr('\000a')||
'       p.product_id img,'||unistr('\000a')||
'apex_util.prepare_url(''f?p=''||:app_id||'':6:''||:app_session';

a1:=a1||'||''::::P6_PRODUCT_ID,P6_BRANCH:''||p.product_id||'',''||3) icon_link,'||unistr('\000a')||
'decode(nvl(dbms_lob.getlength(p.product_image),0),0,null,'||unistr('\000a')||
'    ''<img alt="''||p.product_name||''" title="''||p.product_name||''" style="border: 4px solid #CCC; -moz-border-radius: 4px; -webkit-border-radius: 4px;" ''||'||unistr('\000a')||
'    ''src="''||'||unistr('\000a')||
'    apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',p.product_id)||'||unistr('\000a')||
'    ''" height="75" width="75" />'')'||unistr('\000a')||
'    ';

a1:=a1||'detail_img,'||unistr('\000a')||
'decode(nvl(dbms_lob.getlength(p.product_image),0),0,null,'||unistr('\000a')||
'    apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',p.product_id))'||unistr('\000a')||
'    detail_img_no_style,'||unistr('\000a')||
'    tags'||unistr('\000a')||
'from demo_product_info p';

wwv_flow_api.create_worksheet(
  p_id=> 7400401998019195362+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_region_id=> 7400401913230195362+wwv_flow_api.g_id_offset,
  p_name=> 'Products',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '1000000',
  p_max_row_count_message=> 'The maximum row count for this report is #MAX_ROW_COUNT# rows. Please apply a filter to reduce the number of records in your query.',
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
  p_allow_save_rpt_public=>'Y',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
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
  p_show_notify=>'Y',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'Y',
  p_icon_view_use_custom=>'N',
  p_icon_view_link_column=>'ICON_LINK',
  p_icon_view_img_src_column=>'DETAIL_IMG_NO_STYLE',
  p_icon_view_label_column=>'PRODUCT_NAME',
  p_icon_view_img_attr_text=>'width="75" height="75"',
  p_icon_view_columns_per_row=>5,
  p_detail_view_enabled_yn=>'Y',
  p_detail_view_before_rows=>'<style>'||unistr('\000a')||
'table.apexir_WORKSHEET_CUSTOM { border: none !important; -moz-box-shadow: none; box-shadow: none; -webkit-box-shadow: none; }'||unistr('\000a')||
'.apexir_WORKSHEET_DATA td {border-bottom: none !important;}'||unistr('\000a')||
'table.reportDetail td {'||unistr('\000a')||
'        padding: 2px 4px !important;'||unistr('\000a')||
'	border: none !important;'||unistr('\000a')||
'	font: 11px/16px Arial, sans-serif;'||unistr('\000a')||
'	}'||unistr('\000a')||
'	table.reportDetail td.separator {'||unistr('\000a')||
'		background: #F0F0F0 !important;'||unistr('\000a')||
'		padding: 0 !important;'||unistr('\000a')||
'		height: 1px !important;'||unistr('\000a')||
'padding: 0;'||unistr('\000a')||
'		line-height: 2px !important;'||unistr('\000a')||
'overflow: hidden;'||unistr('\000a')||
'		}'||unistr('\000a')||
'table.reportDetail td h1 {margin: 0 !important}'||unistr('\000a')||
'table.reportDetail td img {margin-top: 8px; border: 4px solid #CCC; -moz-border-radius: 4px; -webkit-border-radius: 4px;}'||unistr('\000a')||
'</style>'||unistr('\000a')||
'<table class="reportDetail">',
  p_detail_view_for_each_row=>'<tr>'||unistr('\000a')||
'<td rowspan="5" valign="top"><img width="75" height="75" src="#DETAIL_IMG_NO_STYLE#" alt="#PRODUCT_NAME#"></td>'||unistr('\000a')||
'<td colspan="6"><h1><a href="#ICON_LINK#"><strong>#PRODUCT_NAME#</strong></a></h1></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><strong>#CATEGORY_LABEL#:</strong></td><td>#CATEGORY#</td>'||unistr('\000a')||
'<td><strong>#PRODUCT_AVAIL_LABEL#:</strong></td><td>#PRODUCT_AVAIL#</td>'||unistr('\000a')||
'<td><strong>#LAST_DATE_SOLD_LABEL#:</strong></td><td>#LAST_DATE_SOLD#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td align="left"><strong>#PRODUCT_DESCRIPTION_LABEL#:</strong></td><td colspan="5" >#PRODUCT_DESCRIPTION#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td style="padding-bottom: 0px;"><strong>#LIST_PRICE_LABEL#</strong></td>'||unistr('\000a')||
'<td style="padding-bottom: 0px;"><strong>#UNITS_LABEL#</strong></td>'||unistr('\000a')||
'<td style="padding-bottom: 0px;"><strong>#SALES_LABEL#</strong></td>'||unistr('\000a')||
'<td style="padding-bottom: 0px;"><strong>#CUSTOMERS_LABEL#</strong></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td style="padding-top: 0px;">#LIST_PRICE#</td>'||unistr('\000a')||
'<td style="padding-top: 0px;">#UNITS#</td>'||unistr('\000a')||
'<td style="padding-top: 0px;">#SALES#</td>'||unistr('\000a')||
'<td style="padding-top: 0px;">#CUSTOMERS#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td colspan="7" class="separator">&nbsp;</td></tr>',
  p_detail_view_after_rows=>'<tr><td colspan="7" class="separator"></td></tr>'||unistr('\000a')||
'</table>',
  p_owner=>'DPEAKE',
  p_internal_uid=> 1);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7400402221051195363+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'PRODUCT_ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Product_Id',
  p_report_label           =>'Product_Id',
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
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7400402303441195363+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'PRODUCT_NAME',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Name',
  p_report_label           =>'Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_PRODUCT_ID,P6_BRANCH:#PRODUCT_ID#,3',
  p_column_linktext        =>'#PRODUCT_NAME#',
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
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'This column contains the name of a product.');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7400402396031195363+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'PRODUCT_DESCRIPTION',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Description',
  p_report_label           =>'Description',
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
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7400402521289195363+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CATEGORY',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Category',
  p_report_label           =>'Category',
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
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7400402623117195364+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'PRODUCT_AVAIL',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Available',
  p_report_label           =>'Available',
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
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7400402700557195364+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LIST_PRICE',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Price',
  p_report_label           =>'Price',
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
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'RIGHT',
  p_format_mask            =>'FML999G999G999G999G990D00',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7400402816144195364+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'UNITS',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Units',
  p_report_label           =>'Units',
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
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7400402902114195364+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SALES',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'Sales',
  p_report_label           =>'Sales',
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
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'RIGHT',
  p_format_mask            =>'FML999G999G999G999G990D00',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7400402999750195364+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CUSTOMERS',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'Customers',
  p_report_label           =>'Customers',
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
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7430744284902112400+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'IMG',
  p_display_order          =>11,
  p_column_identifier      =>'K',
  p_column_label           =>'Image',
  p_report_label           =>'Image',
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
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_format_mask            =>'IMAGE:DEMO_PRODUCT_INFO:PRODUCT_IMAGE:PRODUCT_ID::MIMETYPE:FILENAME:IMAGE_LAST_UPDATE::inline:',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 7558347684378950817+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ICON_LINK',
  p_display_order          =>12,
  p_column_identifier      =>'L',
  p_column_label           =>'Icon Link',
  p_report_label           =>'Icon Link',
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
  p_display_text_as        =>'HIDDEN',
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
  p_id => 7558347778859950824+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'DETAIL_IMG',
  p_display_order          =>13,
  p_column_identifier      =>'M',
  p_column_label           =>'Image',
  p_report_label           =>'Image',
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
  p_display_text_as        =>'WITHOUT_MODIFICATION',
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
  p_id => 7566962989155827798+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'DETAIL_IMG_NO_STYLE',
  p_display_order          =>14,
  p_column_identifier      =>'N',
  p_column_label           =>'Detail Img No Style',
  p_report_label           =>'Detail Img No Style',
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
  p_display_text_as        =>'HIDDEN',
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
  p_id => 4168889234079356652+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LAST_DATE_SOLD',
  p_display_order          =>15,
  p_column_identifier      =>'O',
  p_column_label           =>'Last Date Sold',
  p_report_label           =>'Last Date Sold',
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
  p_tz_dependent           =>'Y',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 4168889321255356653+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'TAGS',
  p_display_order          =>16,
  p_column_identifier      =>'P',
  p_column_label           =>'Tags',
  p_report_label           =>'Tags',
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
  p_display_text_as        =>'LOV_ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
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
rc1:=rc1||'PRODUCT_NAME:CATEGORY:PRODUCT_AVAIL:LIST_PRICE:UNITS:SALES:CUSTOMERS:DETAIL_IMG:LAST_DATE_SOLD:TAGS';

wwv_flow_api.create_worksheet_rpt(
  p_id => 7400403302502196117+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 7400401998019195362+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_type             =>'REPORT',
  p_report_alias            =>'4870199',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_view_mode               =>'DETAIL',
  p_report_columns          =>rc1,
  p_sort_column_1           =>'PRODUCT_NAME',
  p_sort_direction_1        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT b.product_name, SUM(a.quantity * b.list_price)'||unistr('\000a')||
'    FROM DEMO_ORDER_ITEMS a, DEMO_PRODUCT_INFO b'||unistr('\000a')||
'    WHERE a.product_id = b.product_id'||unistr('\000a')||
'    GROUP BY b.product_name'||unistr('\000a')||
'    ORDER BY 2 desc';

wwv_flow_api.create_report_region (
  p_id=> 7699769020376983343 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_name=> 'Top 5 Products',
  p_region_name=>'',
  p_template=> 1020545355391437572+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'BODY_1',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_condition_type=> 'NEVER',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 1020546565977437575+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '5',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No data found.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '5',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12"',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12"',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7699769305282983351 + wwv_flow_api.g_id_offset,
  p_region_id=> 7699769020376983343 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'PRODUCT_NAME',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7699769396055983351 + wwv_flow_api.g_id_offset,
  p_region_id=> 7699769020376983343 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'SUM(A.QUANTITY*B.LIST_PRICE)',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 7699962695207884421 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3,
  p_button_sequence=> 10,
  p_button_plug_id => 7400401913230195362+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(1020554846275437579+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Create Product',
  p_button_position=> 'RIGHT_OF_IR_SEARCH_BAR',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_BRANCH:3',
  p_button_css_classes=>'rightarrow',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>7699962911042884423 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&FLOW_ID.:6:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>7699962695207884421+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 4168745828989069737 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_computation_sequence => 10,
  p_computation_item=> 'LAST_VIEW',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '3',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 3
--
 
begin
 
null;
end;
null;
 
end;
/

 
