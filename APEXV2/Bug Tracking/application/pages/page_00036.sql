prompt --application/pages/page_00036
begin
wwv_flow_api.create_page(
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Bug Usage Metrics'
,p_step_title=>'Bug Usage Metrics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141455855818868)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'    Bug Usage Metrics',
'</h2>',
'<p>',
'    View all activity for a bug &lpar;such as user views&rpar; plotted a calendar.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20170310115411'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2151220624075974042)
,p_plug_name=>'Bug Usage Metrics'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    trunc(view_timestamp) view_timestamp,',
'    trim(to_char(count(*),''999G999G999G990'')) ||'' Views / ''||',
'    trim(to_char(count(distinct app_username),''999G999G999G990'')) ||'' Users'' events',
'from',
'    eba_bt_clicks',
'where',
'    bug_id = :P36_ID ',
'and',
'    view_timestamp > sysdate - 90',
'group by trunc(view_timestamp ) '))
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'VIEW_TIMESTAMP'
,p_attribute_03=>'EVENTS'
,p_attribute_07=>'N'
,p_attribute_09=>'list:navigation'
,p_attribute_13=>'N'
,p_attribute_17=>'Y'
,p_attribute_19=>'Y'
,p_attribute_21=>'10'
,p_attribute_22=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2728848654944571497)
,p_plug_name=>'Hidden Items'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY_3'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2728848846216571497)
,p_name=>'P36_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2728848654944571497)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
end;
/
