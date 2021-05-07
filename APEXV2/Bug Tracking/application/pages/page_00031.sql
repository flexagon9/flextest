prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(2333082129878819730)
,p_name=>'Bug &BUG_NUMBER.'
,p_alias=>'BUG'
,p_step_title=>'Bug &BUG_NUMBER.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(2506141455855818868)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(1225666547885288302)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'    Single Bug View',
'</h2>',
'<p>',
'    Detailed view of a single bug. This view shows the Description, Updates, Links, and Attachments associated with the bug.',
'</p>',
'<h3>',
'    Updates',
'</h3>',
'<p>',
'    Add brief notes or comments to the bug in this section.',
'</p>',
'<p>',
'    Click the <strong>Add Update</strong> icon &lpar;+&rpar; to add a new update.',
'</p>',
'<h3>',
'    Links',
'</h3>',
'<p>',
'    Add relevant URLs that are related to the bug.',
'</p>',
'<p>',
'    Click the <strong>Add Link</strong> icon &lpar;+&rpar; to add a new link.',
'</p>',
'<h3>',
'    Attachments',
'</h3>',
'<p>',
'    Upload attachments &lpar;such as image files or documents&rpar; that are related to the bug.',
'</p>',
'<p>',
'    Click the <strong>Add Attachment</strong> icon &lpar;+&rpar; to add a new attachment.',
'</p>',
'<h3>',
'    Expandable Side Column',
'</h3>',
'<p>',
'    Click the <strong>Menu</strong> icon in the top-right to expand or collapse a side column. The side column contains further details and controls.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20180105125144'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1103610627725053563)
,p_plug_name=>'Region Display Selector'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1415143285439481218)
,p_plug_name=>'Description'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   x clob;',
'   c integer := 0;',
'   t varchar2(32767);',
'begin',
'sys.htp.p(''<p style="white-space: pre-line">'');',
'for c1 in (',
'   select a.description , subject',
'   from EBA_BT_SW_DEFECTS a ',
'   where a.id = :P31_ID) loop',
'   c := c + 1;',
'   if c = 1 and length(c1.subject) > 40 then',
'      sys.htp.p(''<strong>''||apex_escape.html(c1.subject)||''</strong><br>'');',
'   end if;',
'   x := c1.description;',
'   x := replace(x,chr(10),''*newline*'');',
'   x := replace(x,chr(13),null);',
'   for j in 0 .. 80 loop',
'      t := null;',
'      t := replace(sys.htf.escape_sc(dbms_lob.substr(x,2000 ,(j*2000) + 1)),''*newline*'',''<br>'');',
'      if t is not null then',
'          sys.htp.prn(t);',
'      else ',
'          exit;',
'      end if;',
'   end loop;',
'',
'end loop;',
'sys.htp.p(''</p>'');',
'exception when others then sys.htp.prn(sqlerrm);',
'',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2647295741215444412)
,p_plug_name=>'Date Closed'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.date_closed, ''Bug Closed'' label',
'from eba_bt_sw_defects a ',
'where a.id = :P31_ID'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.MINICALENDAR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_bt_sw_defects a',
'where a.id = :P31_ID',
'    and a.date_closed is not null'))
,p_attribute_01=>'DATE_CLOSED'
,p_attribute_02=>'LABEL'
,p_plug_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_bt_sw_defects a',
'where a.id = :P31_ID',
'    and a.date_closed is not null'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2722725550751252797)
,p_plug_name=>'Usage Metrics - 90 days'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    count(*) c,',
'    ''Views'' l,',
'    1 disp',
'from',
'    eba_bt_clicks',
'where',
'    bug_id = :P31_ID ',
'and',
'    view_timestamp > sysdate - 90',
'UNION',
'select',
'    count(distinct app_username)  c,',
'    ''Users'' l,',
'    2 disp',
'from',
'    eba_bt_clicks',
'where',
'    bug_id = :P31_ID ',
'and',
'    view_timestamp > sysdate - 90',
'order by disp    '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'L'
,p_attribute_02=>'C'
,p_attribute_04=>'f?p=&APP_ID.:36:&APP_SESSION.:::36:P36_ID:&P31_ID.'
,p_attribute_05=>'2'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2723096148022549360)
,p_plug_name=>'Validations'
,p_region_template_options=>'#DEFAULT#:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    verified_by,',
'    created',
'from',
'    eba_bt_verifications',
'where',
'    bug_id = :P31_ID',
'order by',
'    created desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.VALIDATOR'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_required_patch=>wwv_flow_api.id(2725982031583500250)
,p_attribute_01=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,30:P30_ID,LAST_VIEW:&P31_ID.,31'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(2723097334909573968)
,p_name=>'Bug Validations'
,p_region_name=>'view_validations'
,p_template=>wwv_flow_api.id(1233751870134533188)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'REGION_POSITION_04'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	lower(verified_by) as validated_by,',
'        created last_validated,',
'	created validation_date,',
'	verification_comment',
'from',
'	eba_bt_verifications',
'where',
'	bug_id = :P31_ID',
'order by',
'	created desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1225695925336288332)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No validations have been recorded'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2723097656336573972)
,p_query_column_id=>1
,p_column_alias=>'VALIDATED_BY'
,p_column_display_sequence=>1
,p_column_heading=>'Validated By'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2723238634278537576)
,p_query_column_id=>2
,p_column_alias=>'LAST_VALIDATED'
,p_column_display_sequence=>2
,p_column_heading=>'Last Validated'
,p_use_as_row_header=>'N'
,p_column_format=>'since'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2723097744781573972)
,p_query_column_id=>3
,p_column_alias=>'VALIDATION_DATE'
,p_column_display_sequence=>3
,p_column_heading=>'Validation Date'
,p_use_as_row_header=>'N'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2723097855166573972)
,p_query_column_id=>4
,p_column_alias=>'VERIFICATION_COMMENT'
,p_column_display_sequence=>4
,p_column_heading=>'Comment'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2723381046381364804)
,p_plug_name=>'Content Completeness'
,p_region_template_options=>'#DEFAULT#:t-Region--stacked:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(1225690169574288324)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    metric,',
'    the_score,',
'    max_value ',
'from',
'    (',
'        select  ''Bug has a fix-by version'' metric, ',
'                decode(fix_by_version_id,null,0,20) the_score,',
'                20 max_value',
'        from eba_bt_sw_defects where id = :P31_ID',
'        union all ',
'        select  ''Bug has description longer then 200 characters'' metric, ',
'                decode(dbms_lob.getlength(description),0,0,10) the_score,',
'                10 max_value ',
'        from eba_bt_sw_defects where id = :P31_ID and nvl(dbms_lob.getlength(description),0) >= 200',
'        union all ',
'        select  ''Bug has tags'' metric, ',
'                decode(tags,null,0,10) the_score,',
'                10 max_value ',
'        from eba_bt_sw_defects where id = :P31_ID',
'        union all ',
'        select  ''Bug has description'' metric, ',
'                decode(dbms_lob.getlength(description),0,0,20) the_score,',
'                20 max_value ',
'        from eba_bt_sw_defects where id = :P31_ID',
'        union all',
'        select  nvl(max(''Bug has links''),''Bug has links'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_bt_links l',
'        where l.bug_id = :P31_ID ',
'        union all',
'        select  nvl(max(''Bug has Bug updates''),''Bug has Bug updates'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_bt_notes u',
'        where  u.bug_id = :P31_ID ',
'        union all',
'        select  nvl(max(''Bug has Bug updates in last week''),''Bug has Bug updates in last week'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_bt_notes u',
'        where  u.bug_id = :P31_ID and u.updated > (sysdate - 7)',
'        union all',
'        select  nvl(max(''Bug has attachments''),''Bug has attachments'') metric, ',
'                decode(count(*),0,0,5) the_score,',
'                nvl(max(5),5) max_value ',
'        from eba_bt_files f',
'        where  f.bug_id = :P31_ID ',
'        union all',
'        select  nvl(max(''Bug status is "Assigned"''),''Bug status is "Assigned"'') metric, ',
'                decode(count(*),0,0,10) the_score,',
'                nvl(max(10),10) max_value ',
'        from eba_bt_sw_defects s, eba_bt_status c',
'        where s.id = :P31_ID and s.status_id = c.id and nvl(upper(c.status_name),''NULL'') = ''ASSIGNED''',
'        union all',
'        select  nvl(max(''Bug verifications exist''),''Bug verifications exist'') metric, ',
'                decode(max((select count(*) from eba_bt_verifications v',
'        where v.bug_id = :P31_ID )),0,0,20) the_score,',
'                nvl(max(20),20) max_value ',
'        from eba_bt_sw_defects where id = :P31_ID',
'        union all',
'        select  nvl(max(''Bug verifications exist in last week''),''Bug verifications exist in last week'') metric, ',
'                decode(max((select count(*) from eba_bt_verifications v',
'        where v.bug_id = :P31_ID and v.created > (sysdate - 7))),0,0,30) the_score,',
'                nvl(max(30),30) max_value ',
'        from eba_bt_sw_defects where id = :P31_ID',
'        union all',
'        select  nvl(max(''Bug verifications exist in last week by Bug filer''),''Bug verifications exist in last week by Bug filer'') metric, ',
'                decode(max((select count(*) from eba_bt_verifications v',
'        where v.bug_id = :P31_ID and v.created > (sysdate - 7) and (',
'        upper(:app_user) = upper(created_by)',
'        ))),0,0,30) the_score,',
'                nvl(max(30),30) max_value ',
'        from eba_bt_sw_defects where id = :P31_ID',
'    ) x',
'order by',
'    1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.COMPLETENESS'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_required_patch=>wwv_flow_api.id(2725981753149490323)
,p_attribute_01=>'66'
,p_attribute_02=>'Strong'
,p_attribute_03=>'33'
,p_attribute_04=>'Moderate'
,p_attribute_05=>'0'
,p_attribute_06=>'Weak'
,p_attribute_07=>'Very Weak'
,p_attribute_08=>'Completeness Score Details'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4176108729059384051)
,p_plug_name=>'Hidden Items'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4176109127758384054)
,p_plug_name=>'Right Side'
,p_component_template_options=>'#DEFAULT#:t-LinksList--showIcons:t-LinksList--actions'
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_api.id(1233762771935660927)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1225700021233288336)
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(4176109552342384055)
,p_name=>'Updates'
,p_template=>wwv_flow_api.id(1225690169574288324)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select '''' class, --use grayComment for gray look',
'        ''Note'' note_type,',
'        replace(apex_escape.html(dbms_lob.substr(note,1000,1)),chr(10),''<br />'') comment_text,',
'        '''' attribute_1,',
'        '''' attribute_2,',
'        '''' attribute_3,',
'        '''' attribute_4,',
'        lower(created_by) user_name,',
'        substr(created_by,0,2) user_icon,',
'        ''u-color-''||(ora_hash(created_by,44) + 1) icon_modifier,',
'        apex_util.get_since(created) comment_date,',
'        '' '' actions,',
'        created',
'from EBA_BT_NOTES',
'where   bug_id = :P31_ID',
'union all',
'select ''grayComment'' class, --use grayComment for gray look',
'    ''Automatic Update'' note_type,',
'    initcap(replace(replace(f.column_name,''_ID'',null),''_'','' '')) note_text,',
'    '' changed from <strong>''||apex_escape.html(substr(f.old_value,1,1000))||''</strong>'' attribute_1,',
'    '' to <strong>''||apex_escape.html(substr(f.new_value,1,1000))||''</strong>'' attribute_2,',
'    '' '' attribute_3,',
'    '' '' attribute_4,',
'    lower(f.changed_by) created_by,',
'    substr(f.changed_by,0,2) user_icon,',
'    ''u-color-''||(ora_hash(f.changed_by,44) + 1) icon_modifier,',
'    apex_util.get_since(f.change_date) created_on,',
'    '' '' actions,',
'    f.change_date',
'from eba_bt_history f',
'where f.table_name = ''SW_DEFECTS''',
'    and component_id = :P31_ID',
'order by 11 desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1225695508851288330)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No updates found.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176109753597384056)
,p_query_column_id=>1
,p_column_alias=>'CLASS'
,p_column_display_sequence=>1
,p_column_heading=>'Class'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176109841881384057)
,p_query_column_id=>2
,p_column_alias=>'NOTE_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Note Type'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1103610706175053564)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>8
,p_column_heading=>'Comment text'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176110059983384058)
,p_query_column_id=>4
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>3
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176110142035384058)
,p_query_column_id=>5
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>4
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176110239915384058)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>5
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176110355435384058)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>6
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1103610776400053565)
,p_query_column_id=>8
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>9
,p_column_heading=>'User name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1103611025920053567)
,p_query_column_id=>9
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>11
,p_column_heading=>'User icon'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1103611070857053568)
,p_query_column_id=>10
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>12
,p_column_heading=>'Icon modifier'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1103610922252053566)
,p_query_column_id=>11
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>10
,p_column_heading=>'Comment date'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1103611227542053569)
,p_query_column_id=>12
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>13
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176110739942384058)
,p_query_column_id=>13
,p_column_alias=>'CREATED'
,p_column_display_sequence=>7
,p_column_heading=>'Created'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(4176111239153384058)
,p_name=>'Attachments'
,p_template=>wwv_flow_api.id(1225690169574288324)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--inline:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    id,',
'    ''<a href="''||APEX_UTIL.GET_BLOB_FILE_SRC(''P69_FILE_BLOB'',id)||''">''||apex_escape.html(filename)||''</a>'' filename,',
'    file_mimetype,',
'    file_charset,',
'    apex_util.filesize_mask(dbms_lob.getlength(file_blob)) f_len,',
'    substr(file_comments,1,50)||decode(greatest(length(file_comments),50),50,'''',''...'') FILE_COMMENTS,',
'    case when instr(upper(FILENAME),''.PPT'') > 0or instr(upper(FILENAME),''.PPTX'') > 0 then',
'        ''fa fa fa-file-powerpoint-o''',
'    when instr(upper(FILENAME),''.XLS'') > 0 or instr(upper(FILENAME),''.XLSX'') > 0 then',
'        ''fa fa fa-file-excel-o''',
'    when instr(upper(FILENAME),''.DOC'') > 0 or instr(upper(FILENAME),''.DOCX'') > 0 then',
'        ''fa fa fa-file-word-o''',
'    when instr(upper(FILENAME),''.PDF'') > 0 then',
'        ''fa fa fa-file-pdf-o''',
'    when instr(upper(FILENAME),''.GIF'') > 0 or',
'         instr(upper(FILENAME),''.PNG'') > 0 or',
'         instr(upper(FILENAME),''.TIFF'') > 0 or',
'         instr(upper(FILENAME),''.JPG'') > 0 then',
'        ''fa fa fa-file-image-o''',
'    else',
'        ''fa fa fa-file-o''',
'    end file_type,',
'    case when instr(upper(FILENAME),''.PPT'') > 0or instr(upper(FILENAME),''.PPTX'') > 0 then',
'        ''MS Powerpoint File''',
'    when instr(upper(FILENAME),''.XLS'') > 0 or instr(upper(FILENAME),''.XLSX'') > 0 then',
'        ''MS Excel File''',
'    when instr(upper(FILENAME),''.DOC'') > 0 or instr(upper(FILENAME),''.DOCX'') > 0 then',
'        ''MS Word File''',
'    when instr(upper(FILENAME),''.PDF'') > 0 then',
'        ''Adobe PDF File''',
'    when instr(upper(FILENAME),''.GIF'') > 0 or',
'         instr(upper(FILENAME),''.PNG'') > 0 or',
'         instr(upper(FILENAME),''.TIFF'') > 0 or',
'         instr(upper(FILENAME),''.JPG'') > 0 then',
'        ''Image File''',
'    else',
'        ''Text File''',
'    end file_type_title,',
'    created,',
'    lower(created_by) created_by',
'from EBA_BT_FILES f',
'where bug_id = :P31_ID ',
'order by created desc;'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1225695925336288332)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No attachments found.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176112249413384059)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176111447057384058)
,p_query_column_id=>2
,p_column_alias=>'FILENAME'
,p_column_display_sequence=>4
,p_column_heading=>'Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176111545132384058)
,p_query_column_id=>3
,p_column_alias=>'FILE_MIMETYPE'
,p_column_display_sequence=>5
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176111635893384058)
,p_query_column_id=>4
,p_column_alias=>'FILE_CHARSET'
,p_column_display_sequence=>6
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176111741843384058)
,p_query_column_id=>5
,p_column_alias=>'F_LEN'
,p_column_display_sequence=>7
,p_column_heading=>'Size'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176111838866384058)
,p_query_column_id=>6
,p_column_alias=>'FILE_COMMENTS'
,p_column_display_sequence=>8
,p_column_heading=>'Description'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176111950571384059)
,p_query_column_id=>7
,p_column_alias=>'FILE_TYPE'
,p_column_display_sequence=>3
,p_column_heading=>'Type'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span class="#FILE_TYPE#" title="#FILE_TYPE_TITLE#"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2295186311381994030)
,p_query_column_id=>8
,p_column_alias=>'FILE_TYPE_TITLE'
,p_column_display_sequence=>1
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176112045262384059)
,p_query_column_id=>9
,p_column_alias=>'CREATED'
,p_column_display_sequence=>10
,p_column_heading=>'Date Added'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176112149549384059)
,p_query_column_id=>10
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>9
,p_column_heading=>'Added By'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(4176113357635384061)
,p_name=>'Links'
,p_template=>wwv_flow_api.id(1225690169574288324)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--inline:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select link_text, link_target, lower(created_by) created_by, created, link_comments ',
'    from EBA_BT_LINKS ',
'    where bug_id = :P31_ID order by created desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1225695925336288332)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No links found.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176113550299384061)
,p_query_column_id=>1
,p_column_alias=>'LINK_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Name'
,p_use_as_row_header=>'N'
,p_column_link=>'#LINK_TARGET#'
,p_column_linktext=>'#LINK_TEXT#'
,p_column_link_attr=>'target="_blank"'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176113638411384061)
,p_query_column_id=>2
,p_column_alias=>'LINK_TARGET'
,p_column_display_sequence=>1
,p_column_heading=>'Link Target'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176113728671384061)
,p_query_column_id=>3
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>4
,p_column_heading=>'Added By'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176113840930384061)
,p_query_column_id=>4
,p_column_alias=>'CREATED'
,p_column_display_sequence=>5
,p_column_heading=>'Date Added'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176113945604384061)
,p_query_column_id=>5
,p_column_alias=>'LINK_COMMENTS'
,p_column_display_sequence=>3
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(4176118246524384064)
,p_name=>'Bug &BUG_NUMBER.'
,p_template=>wwv_flow_api.id(1225683798473288318)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-AVPList--variableLabelMedium:t-AVPList--leftAligned'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     a.id,',
'     a.bug_number,',
'     a.SUBJECT , ',
'     STATUS_NAME, ',
'     lower(d.username) login_name, ',
'     ( select username from eba_bt_users where id = a.submitted_by_id ) submitted_by,',
'     a.SUBMITTED_ON,',
'     e.PRODUCT_NAME,',
'     f.severity_name severity,',
'     g.urgency_name priority,',
'     (select version_name from EBA_BT_VERSION v where v.id = a.FIXED_VERSION_ID)||'' - ''||to_char(date_closed,''Day DD-MON-YYYY'') fixed_in,',
'      (select version_name from EBA_BT_VERSION v where v.id = a.FOUND_VERSION_ID)||'' - ''||',
'      to_char(a.created,''Day DD-MON-YYYY'')||''  by ''||lower(( select username from eba_bt_users where id = a.submitted_by_id )) found_in,',
'      (select version_name from EBA_BT_VERSION v where v.id = a.FIX_BY_VERSION_ID) fix_by,',
'     lower(a.created_by) created_by,',
'     a.created,',
'     nvl(a.updated,a.created) updated,',
'     a.tags,',
'     a.customer,',
'     (select CATEGORY_NAME from eba_bt_category cc where cc.id = a.CATEGORY_ID ) category',
'from',
'    EBA_BT_SW_DEFECTS a, ',
'    eba_bt_status b, ',
'    eba_bt_users d, ',
'    eba_bt_product e ,',
'    eba_bt_severity f,',
'    eba_bt_urgency g',
'where a.STATUS_ID = b.id(+) and ',
'    a.assigned_to_id = d.id (+) and ',
'    a.PRODUCT_ID = e.id (+) and',
'    a.severity_id = f.id (+) and',
'    a.urgency_id = g.id (+)',
'   and a.id = :P31_ID',
'order by 1'))
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
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
end;
/
begin
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176118453274384065)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176601453682438195)
,p_query_column_id=>2
,p_column_alias=>'BUG_NUMBER'
,p_column_display_sequence=>2
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176601538646438195)
,p_query_column_id=>3
,p_column_alias=>'SUBJECT'
,p_column_display_sequence=>4
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176601651033438195)
,p_query_column_id=>4
,p_column_alias=>'STATUS_NAME'
,p_column_display_sequence=>5
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176601853780438195)
,p_query_column_id=>5
,p_column_alias=>'LOGIN_NAME'
,p_column_display_sequence=>6
,p_column_heading=>'Assigned To'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176602035962438195)
,p_query_column_id=>6
,p_column_alias=>'SUBMITTED_BY'
,p_column_display_sequence=>7
,p_column_heading=>'Submitted By'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176602142635438195)
,p_query_column_id=>7
,p_column_alias=>'SUBMITTED_ON'
,p_column_display_sequence=>8
,p_column_heading=>'Submitted On'
,p_use_as_row_header=>'N'
,p_column_format=>'DD-MON-YYYY HH24:MI Day'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176602242933438195)
,p_query_column_id=>8
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>11
,p_column_heading=>'Product'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'PRODUCT_ID'
,p_display_when_condition2=>'0'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1322451930213244364)
,p_query_column_id=>9
,p_column_alias=>'SEVERITY'
,p_column_display_sequence=>16
,p_column_heading=>'Severity'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1322452131295252461)
,p_query_column_id=>10
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>17
,p_column_heading=>'Priority'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176602442046438195)
,p_query_column_id=>11
,p_column_alias=>'FIXED_IN'
,p_column_display_sequence=>14
,p_column_heading=>'Fixed In'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176602542547438196)
,p_query_column_id=>12
,p_column_alias=>'FOUND_IN'
,p_column_display_sequence=>12
,p_column_heading=>'Found In'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176602640412438196)
,p_query_column_id=>13
,p_column_alias=>'FIX_BY'
,p_column_display_sequence=>13
,p_column_heading=>'Fix By'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2726607743449284842)
,p_query_column_id=>14
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>9
,p_column_heading=>'Filed By'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176119433318384066)
,p_query_column_id=>15
,p_column_alias=>'CREATED'
,p_column_display_sequence=>10
,p_column_heading=>'Filed'
,p_use_as_row_header=>'N'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176119652393384066)
,p_query_column_id=>16
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>3
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4176118941613384065)
,p_query_column_id=>17
,p_column_alias=>'TAGS'
,p_column_display_sequence=>15
,p_column_heading=>'Tags'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1436677841791557147)
,p_query_column_id=>18
,p_column_alias=>'CUSTOMER'
,p_column_display_sequence=>18
,p_column_heading=>'Customer'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1534557560642156400)
,p_query_column_id=>19
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>19
,p_column_heading=>'Category'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4524249634986979061)
,p_plug_name=>'Time Zone'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1225683798473288318)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
' "TIMEZONE" ',
' '))
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4176108139312384049)
,p_button_sequence=>10
,p_button_name=>'EDIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit Bug'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:48:P48_ID:&P31_ID.'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4176111045976384058)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(4176109552342384055)
,p_button_name=>'POPNOTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Add Update'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP,64:P64_BUG_ID:&P31_ID.'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4176110830027384058)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(4176109552342384055)
,p_button_name=>'GONOTES'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Notes'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.:::67:P67_ID:&P31_ID.'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4176114243521384061)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(4176113357635384061)
,p_button_name=>'POP_LINK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Add Link'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_BUG_ID:&P31_ID.'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4176114038116384061)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(4176113357635384061)
,p_button_name=>'VIEW_LINKS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View Links'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:62:&SESSION.:::62:P62_ID:&P31_ID.'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4176112356079384059)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(4176111239153384058)
,p_button_name=>'POPATTACHMENT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'Add Attachment'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,69:P69_BUG_ID:&P31_ID.'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4176112536473384059)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_api.id(4176111239153384058)
,p_button_name=>'VIEW_ATTACHMENTS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1225705056775288345)
,p_button_image_alt=>'View Attachments'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:68:&SESSION.:::68:P68_ID:&P31_ID.'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2723106040197632266)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_api.id(2723096148022549360)
,p_button_name=>'VALIDATE_BUG'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1225705764797288347)
,p_button_image_alt=>'Validate'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:30:P30_ID,LAST_VIEW:&P31_ID.,31'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(3797424040496072790)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4176121048749384072)
,p_branch_action=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::P31_ID:&P31_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 11-JAN-2012 16:02 by MIKE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2411063151505656276)
,p_name=>'P31_ROW_KEY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4176108729059384051)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select BUG_NUMBER',
'from EBA_BT_SW_DEFECTS',
'where id = :P31_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4176108944017384051)
,p_name=>'P31_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4176108729059384051)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1342018864892167218)
,p_computation_sequence=>20
,p_computation_item=>'BUG_NUMBER'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.bug_number || '': '' || a.subject',
'from',
'    EBA_BT_SW_DEFECTS a',
'where  a.id = :P31_ID '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(71617684393931527)
,p_computation_sequence=>30
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1096896715459896332)
,p_name=>'Refresh Update'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId === 64'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1096896761520896333)
,p_event_id=>wwv_flow_api.id(1096896715459896332)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4176109552342384055)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1096898543113896351)
,p_name=>'Refresh Links'
,p_event_sequence=>20
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId === 73'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1096898724856896352)
,p_event_id=>wwv_flow_api.id(1096898543113896351)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4176113357635384061)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1096898411194896349)
,p_name=>'Refresh Attachments'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId === 69'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1096898476597896350)
,p_event_id=>wwv_flow_api.id(1096898411194896349)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4176111239153384058)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2722722644041241312)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Count Clicks'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_bt_clicks (bug_id) values (:P31_ID);',
'delete from eba_bt_clicks where view_timestamp < (sysdate - 90);',
'commit;'))
);
end;
/
