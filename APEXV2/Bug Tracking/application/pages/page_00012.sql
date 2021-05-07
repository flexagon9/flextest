prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Bugs'
,p_step_title=>'Bugs'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2508162743716731820)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'div.ebaTimeline{border-bottom:1px solid #DDD;clear:both;position:relative;}',
'div.ebaTimeline:last-child{border-bottom:none;}',
'div.ebaTimeline h3{font:bold 11px/12px Arial,sans-serif;margin:0;padding:9px 10px;width:80px;color:#333;position:absolute;top:0;left:0;}',
'div.ebaTimeline h3 + ul{margin:0;list-style:none;padding:0;margin:0 0 0 80px;}',
'div.ebaTimeline ul li{display:table;width:100%;position:relative;}',
'div.ebaTimeline ul.ebaNoHover li:hover span.eS,',
'div.ebaTimeline ul.ebaNoHover li:hover span.eL{background:transparent;}',
'div.ebaTimeline ul li:hover span.eS{background-color:#F8F8F8;}',
'div.ebaTimeline ul li:hover span.eL{background:#F8F8F8;}',
'div.ebaTimeline ul li:hover span.eL a.eN span{text-decoration:underline;}',
'div.ebaTimeline ul li span.eD,',
'div.ebaTimeline ul li span.eS,',
'div.ebaTimeline ul li span.eL{display:table-cell;vertical-align:top;}',
'div.ebaTimeline ul li span.eD{width:20px;padding:0 10px 0 0;font:normal 11px/30px Arial,sans-serif;border-right:1px solid #EEE;text-align:right;color:#666;}',
'div.ebaTimeline ul li span.eS{padding:5px;width:20px;border-bottom:1px dotted #EEE;;}',
'div.ebaTimeline ul li:last-child span.eS,',
'div.ebaTimeline ul li:last-child span.eL{border-bottom:none;}',
'div.ebaTimeline ul li span.eS span{display:block;width:12px;height:12px;border-radius:10px;-moz-border-radius:10px;-webkit-box-shadow:0 1px 1px rgba(255,255,255,.75),0 0 2px rgba(0,0,0,.5) inset;-moz-box-shadow:0 1px 1px rgba(255,255,255,.75),0 0 2px'
||' rgba(0,0,0,.5) inset;box-shadow:0 1px 1px rgba(255,255,255,.75),0 0 2px rgba(0,0,0,.5) inset;background:-webkit-gradient(linear,0 0,0 100%,from(transparent),to(rgba(0,0,0,.25)));background:-moz-linear-gradient(top,transparent,rgba(0,0,0,.25));margin'
||':4px;}',
'div.ebaTimeline ul li span.eS span.ebaRed{background-color:#F00;}',
'div.ebaTimeline ul li span.eS span.ebaYellow{background-color:#FCE709;}',
'div.ebaTimeline ul li span.eS span.ebaGreen{background-color:#22C615;}',
'div.ebaTimeline ul li span.eS span.ebaBlack{background-color:#444;}',
'div.ebaTimeline ul li span.eS span.ebaNull{background-color:#CCC;}',
'div.ebaTimeline ul li span.eL{border-bottom:1px dotted #EEE;}',
'div.ebaTimeline ul li a.eN{display:block;padding:7px 0;text-decoration:none;}',
'div.ebaTimeline ul li a.eN span{display:block;font:bold 12px/16px Arial,sans-serif;color:#333;}',
'div.ebaTimeline ul li a.eN em,',
'div.ebaTimeline ul li span.eL em{display:block;font:normal 11px/16px Arial,sans-serif;color:#666;}',
'div.ebaTimeline ul li a.ebaEditLink{position:absolute;right:0;top:0;display:block;margin:7px 7px 0 0;font:normal 11px/12px Arial,sans-serif;text-decoration:none;color:#666;padding:2px 10px;border-radius:4px;-moz-border-radius:4px;border:1px solid #EE'
||'E;-webkit-transition:background .2s linear,border .2s linear,color .2s linear;}',
'div.ebaTimeline ul li a.ebaEditLink:hover{border:1px solid #BBB;background:#FFF;color:#333;}',
'</style>'))
,p_step_template=>wwv_flow_api.id(1225655852966288293)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'    Filterable List of Bugs',
'</h2>',
'<p>',
'    View a complete list of bugs cataloged in the application. Use the search tools to group bugs by category and attribute.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180111133932'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1969781258245021059)
,p_plug_name=>'Bugs List'
,p_region_template_options=>'t-Region--noPadding:js-showMaximizeButton'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    a.id,',
'    ''f?p='' ||:APP_ID || '':31:'' || :APP_SESSION || ''::NO:31:P31_ID:'' || a.id the_link,',
'    ''green'' color,',
'    a.BUG_NUMBER,',
'    a.subject primary_label,',
'    a.description description,',
'    apex_util.get_since(a.created) attribute_01,',
'    (select s.status_code||'' ''||s.STATUS_NAME from EBA_BT_STATUS s where a.status_id = s.id) status,',
'    (select nvl(u.email,u.username) from EBA_BT_USERs u where a.ASSIGNED_TO_ID = u.ID) attribute_03,',
'    a.created,',
'    a.tags attribute_04',
'from EBA_BT_SW_DEFECTS a,',
'            eba_bt_status b,',
'            eba_bt_urgency c,',
'            eba_bt_users d,',
'            eba_bt_product e ',
'where a.STATUS_ID = b.id(+) and ',
'            a.URGENCY_ID = c.id(+) and ',
'            a.assigned_to_id = d.id (+) and ',
'            a.PRODUCT_ID = e.id (+) and',
'            --',
'            (nvl(:P12_SINCE,0) = 0 or a.created >= (localtimestamp -:P12_SINCE ) ) and',
'            --',
'            (:P12_SEARCH is null or ',
'            instr(upper(a.subject), upper(:P12_SEARCH)) > 0 or',
'            instr(upper(username), upper(:P12_SEARCH)) > 0 or',
'            instr(upper(submitted_by), upper(:P12_SEARCH)) > 0 or',
'            instr(upper(product_name), upper(:P12_SEARCH)) > 0 or',
'            instr(upper(a.description), upper(:P12_SEARCH)) > 0 ) and ',
'            (nvl(:P12_ASSIGNED,0) = 0 or a.assigned_to_id = :P12_ASSIGNED) and',
'            (nvl(:P12_PRODUCT,0) = 0 or a.product_id = :P12_PRODUCT) and',
'            (nvl(:P12_STATUS,0) = 0 or a.status_id = :P12_STATUS) and',
'            (nvl(:P12_SEVERITY,0) = 0 or a.severity_id = :P12_SEVERITY) and',
'            (nvl(:P12_PRIORITY,0) = 0 or a.urgency_id = :P12_PRIORITY) and',
'            (nvl(:P12_FOUND,0) = 0 or a.found_version_id = :P12_FOUND) and',
'            (nvl(:P12_FIXED_BY,0) = 0 or a.fix_by_version_id = :P12_FIXED_BY)',
'order by a.CREATED desc, a.id'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_ajax_items_to_submit=>'P12_SEARCH,P12_ASSIGNED,P12_PRODUCT,P12_STATUS,P12_SEVERITY,P12_PRIORITY,P12_FOUND,P12_FIXED_BY,P12_SINCE,P12_CONTROL_BREAK'
,p_plug_query_num_rows=>50
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_no_data_found=>'No bugs found.'
,p_attribute_01=>'BUG_NUMBER'
,p_attribute_02=>'COLOR'
,p_attribute_03=>'PRIMARY_LABEL'
,p_attribute_04=>'THE_LINK'
,p_attribute_05=>'ATTRIBUTE_01'
,p_attribute_06=>'ATTRIBUTE_03'
,p_attribute_07=>'ATTRIBUTE_04'
,p_attribute_09=>'DESCRIPTION'
,p_attribute_12=>'L'
,p_attribute_13=>'STATUS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1969781409183021060)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'ID'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1969781443332021061)
,p_name=>'THE_LINK'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'THE_LINK'
,p_is_visible=>true
,p_heading=>'The link'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1969781611994021062)
,p_name=>'COLOR'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'COLOR'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1969781719156021063)
,p_name=>'PRIMARY_LABEL'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'PRIMARY_LABEL'
,p_is_visible=>true
,p_heading=>'Primary label'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1969781803508021064)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'DESCRIPTION'
,p_is_visible=>true
,p_heading=>'Description'
,p_display_sequence=>50
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1969781956533021066)
,p_name=>'ATTRIBUTE_01'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'ATTRIBUTE_01'
,p_is_visible=>true
,p_heading=>'Created'
,p_display_sequence=>70
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1969782423267021070)
,p_name=>'ATTRIBUTE_03'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'ATTRIBUTE_03'
,p_is_visible=>true
,p_heading=>'Assigned to'
,p_display_sequence=>110
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1969782528573021071)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'CREATED'
,p_is_visible=>true
,p_heading=>'Created'
,p_display_sequence=>120
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1969782550534021072)
,p_name=>'ATTRIBUTE_04'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'ATTRIBUTE_04'
,p_is_visible=>true
,p_heading=>'Tags'
,p_display_sequence=>130
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1969782785138021074)
,p_name=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'STATUS'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>140
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984103815074590336)
,p_name=>'BUG_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'BUG_NUMBER'
,p_is_visible=>true
,p_heading=>'Bug number'
,p_display_sequence=>150
,p_use_as_row_header=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1969782920413021075)
,p_plug_name=>'Timeline'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    a.id,',
'    ''f?p='' ||:APP_ID || '':31:'' || :APP_SESSION || ''::NO:31:P31_ID:'' || a.id the_link,',
'    ''green'' color,',
'    a.BUG_NUMBER||'': ''||a.subject primary_label,',
'    a.description description,',
'    apex_util.get_since(a.created) attribute_01,',
'    (select s.status_code||'' ''||s.STATUS_NAME from EBA_BT_STATUS s where a.status_id = s.id) status,',
'    (select nvl(u.email,u.username) from EBA_BT_USERs u where a.ASSIGNED_TO_ID = u.ID) attribute_03,',
'    a.created,',
'    a.tags attribute_04',
'from EBA_BT_SW_DEFECTS a, ',
'            eba_bt_status b, ',
'            eba_bt_urgency c, ',
'            eba_bt_users d, ',
'            eba_bt_product e ',
'where a.STATUS_ID = b.id(+) and ',
'            a.URGENCY_ID = c.id(+) and ',
'            a.assigned_to_id = d.id (+) and ',
'            a.PRODUCT_ID = e.id (+) and',
'            --',
'            (nvl(:P12_SINCE,0) = 0 or a.created >= (localtimestamp -:P12_SINCE ) ) and',
'            --',
'            (:P12_SEARCH is null or ',
'            instr(upper(a.subject), upper(:P12_SEARCH)) > 0 or',
'            instr(upper(d.username), upper(:P12_SEARCH)) > 0 or',
'            instr(upper(submitted_by), upper(:P12_SEARCH)) > 0 or',
'            instr(upper(product_name), upper(:P12_SEARCH)) > 0 or',
'            instr(upper(a.description), upper(:P12_SEARCH)) > 0 ) and ',
'            (nvl(:P12_ASSIGNED,0) = 0 or a.assigned_to_id = :P12_ASSIGNED) and',
'            (nvl(:P12_PRODUCT,0) = 0 or a.product_id = :P12_PRODUCT) and',
'            (nvl(:P12_STATUS,0) = 0 or a.status_id = :P12_STATUS) and',
'            (nvl(:P12_SEVERITY,0) = 0 or a.severity_id = :P12_SEVERITY) and',
'            (nvl(:P12_PRIORITY,0) = 0 or a.urgency_id = :P12_PRIORITY) and',
'            (nvl(:P12_FOUND,0) = 0 or a.found_version_id = :P12_FOUND) and',
'            (nvl(:P12_FIXED_BY,0) = 0 or a.fix_by_version_id = :P12_FIXED_BY)',
'order by a.CREATED desc, a.id'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_ajax_items_to_submit=>'P12_SEARCH,P12_ASSIGNED,P12_PRODUCT,P12_STATUS,P12_SEVERITY,P12_PRIORITY,P12_FOUND,P12_FIXED_BY,P12_SINCE,P12_CONTROL_BREAK'
,p_plug_query_num_rows=>50
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_no_data_found=>'No bugs found.'
,p_attribute_01=>'CREATED'
,p_attribute_02=>'COLOR'
,p_attribute_03=>'PRIMARY_LABEL'
,p_attribute_04=>'THE_LINK'
,p_attribute_05=>'ATTRIBUTE_01'
,p_attribute_06=>'ATTRIBUTE_03'
,p_attribute_07=>'ATTRIBUTE_04'
,p_attribute_09=>'DESCRIPTION'
,p_attribute_12=>'D'
,p_attribute_13=>'STATUS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984102752369590326)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'ID'
,p_is_visible=>true
,p_heading=>'Id'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984102916457590327)
,p_name=>'THE_LINK'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'THE_LINK'
,p_is_visible=>true
,p_heading=>'The link'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984102981336590328)
,p_name=>'COLOR'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'COLOR'
,p_is_visible=>true
,p_heading=>'Color'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984103032632590329)
,p_name=>'PRIMARY_LABEL'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'PRIMARY_LABEL'
,p_is_visible=>true
,p_heading=>'Primary label'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984103219246590330)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'DESCRIPTION'
,p_is_visible=>true
,p_heading=>'Description'
,p_display_sequence=>50
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984103303276590331)
,p_name=>'ATTRIBUTE_01'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'ATTRIBUTE_01'
,p_is_visible=>true
,p_heading=>'Created'
,p_display_sequence=>60
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984103355653590332)
,p_name=>'ATTRIBUTE_03'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'ATTRIBUTE_03'
,p_is_visible=>true
,p_heading=>'Assigned to'
,p_display_sequence=>70
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984103484905590333)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'CREATED'
,p_is_visible=>true
,p_heading=>'Created'
,p_display_sequence=>80
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984103576140590334)
,p_name=>'ATTRIBUTE_04'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'ATTRIBUTE_04'
,p_is_visible=>true
,p_heading=>'Tags'
,p_display_sequence=>90
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1984103671789590335)
,p_name=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_data_type=>'STATUS'
,p_is_visible=>true
,p_heading=>'Status'
,p_display_sequence=>100
,p_use_as_row_header=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3671928954470677951)
,p_plug_name=>'Search Filter'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--stacked:t-Region--hiddenOverflow:t-Form--stretchInputs:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_02'
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3693160342268456003)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_button_name=>'RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1225705187803288346)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1341998593629788077)
,p_name=>'P12_CONTROL_BREAK'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_item_default=>'SEVERITY'
,p_prompt=>'Control Break'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'FILTER REPORT TYPE'
,p_lov=>'.'||wwv_flow_api.id(1341998686573791771)||'.'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1351428346655485886)
,p_name=>'P12_SINCE'
,p_item_sequence=>81
,p_item_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_item_default=>'365'
,p_prompt=>'Since'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SINCE'
,p_lov=>'.'||wwv_flow_api.id(3990156527528091805)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Show All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3671855446936656855)
,p_name=>'P12_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_prompt=>'Search'
,p_placeholder=>'Search Bugs'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1225704767981288342)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3672046145382694317)
,p_name=>'P12_ASSIGNED'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_prompt=>'Assignee'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'USERSLIST_WITH_NULL_OPTION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d,r from (',
'select ''Not Assigned'' d, -9999 r from dual',
'union all',
'select d,r from (',
'select username d,id r',
'from eba_bt_users',
'order by 1',
')',
')'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-All Owners-'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3672084333046700171)
,p_name=>'P12_PRODUCT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-All Products-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3672126446898704159)
,p_name=>'P12_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUSLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_NAME d, id r',
'from   eba_bt_status where upper(IS_ACTIVE) = ''Y''',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-All Status-'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3672172037333710882)
,p_name=>'P12_SEVERITY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_prompt=>'Severity'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEVERITY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select severity_name d, id r',
'from   EBA_BT_SEVERITY',
'order by nvl(sequence_number,99), severity_name'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-All Severity levels-'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3672210737464720346)
,p_name=>'P12_PRIORITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_prompt=>'Priority'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'URGENCYLIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select URGENCY_NAME d, ',
'         id  r',
'from   eba_bt_urgency ',
'where upper(IS_ACTIVE) = ''Y''',
'order by 1',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-All Priorities-'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3672260531492737579)
,p_name=>'P12_FOUND'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_prompt=>'Found'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'VERSION LIST P48'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v.version_name d, v.id r',
'  from eba_bt_version v',
' where nvl(v.product_id, :P48_PRODUCT_ID) = :P48_PRODUCT_ID',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-All found bugs-'
,p_cHeight=>1
,p_display_when=>'P12_PRODUCT'
,p_display_when_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3672295748808742543)
,p_name=>'P12_FIXED_BY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(3671928954470677951)
,p_prompt=>'Fixed By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'VERSION LIST P48'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v.version_name d, v.id r',
'  from eba_bt_version v',
' where nvl(v.product_id, :P48_PRODUCT_ID) = :P48_PRODUCT_ID',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-All Fixed bugs-'
,p_cHeight=>1
,p_display_when=>'P12_PRODUCT'
,p_display_when_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_field_template=>wwv_flow_api.id(1225704860700288343)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1342000107090801568)
,p_computation_sequence=>10
,p_computation_item=>'P12_CONTROL_BREAK'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'BUG'
,p_compute_when=>'P12_CONTROL_BREAK'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1342006698471893911)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1507443655567719527)
,p_name=>'Refresh Timeline on Filter Change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_SEARCH,P12_ASSIGNED,P12_PRODUCT,P12_STATUS,P12_SEVERITY,P12_PRIORITY,P12_FOUND,P12_FIXED_BY,P12_SINCE,P12_CONTROL_BREAK'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1512636615160140837)
,p_event_id=>wwv_flow_api.id(1507443655567719527)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1969781258245021059)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1512636684020140838)
,p_event_id=>wwv_flow_api.id(1507443655567719527)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1969782920413021075)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1507444048027719531)
,p_name=>'Preform search on enter'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === 13'
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507444146887719532)
,p_event_id=>wwv_flow_api.id(1507444048027719531)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1969781258245021059)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507444305685719533)
,p_event_id=>wwv_flow_api.id(1507444048027719531)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1969782920413021075)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1507444412556719534)
,p_event_id=>wwv_flow_api.id(1507444048027719531)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3693031650186429947)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'clear cache for this page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3693160342268456003)
);
end;
/
