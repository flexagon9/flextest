prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(44535706737386353012)
,p_name=>'Gantt Chart'
,p_step_title=>'Gantt Chart'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20160503094914'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1082628058076391808)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(44535683816227352965)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(44535708008096353023)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(44535701985274352994)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1082628651242391810)
,p_plug_name=>'Gantt Chart'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(44535680543877352962)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(1082629007224391810)
,p_default_chart_type=>'ProjectGantt'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart_502324053274772350'
,p_chart_width=>1200
,p_chart_height=>600
,p_display_attr=>':H:::::::::::N::::::::'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y::N:S:E::'
,p_pie_attr=>':::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME:Y:Y:Series::::Y:N'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'7'
,p_x_axis_label_font=>'::'
,p_y_axis_label_font=>'::'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'::'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_grid_labels_font=>'Tahoma:10:#000000'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(1082629400415391814)
,p_chart_id=>wwv_flow_api.id(1082629007224391810)
,p_series_seq=>10
,p_series_name=>'Gantt Entries'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''f?p=&APP_ID.:5:''||:APP_SESSION||''::::P5_ID:''||p.id link',
', p.name   name',
', p.id     id',
', null     parent_id',
', (select min(t.start_date)',
'   from eba_demo_proj_tasks t',
'   where t.project_id = p.id',
'  ) actual_start',
', case when p.completed_date is not null',
'    then p.completed_date',
'    else (select max(t.end_date)',
'          from eba_demo_proj_tasks t',
'          where t.project_id = p.id)',
'  end actual_end',
', decode(p.status_cd, ''COMPLETED'', 100, ''IN-PROGRESS'', 50, 0)  progress',
'from eba_demo_projects p',
'-- UNION ALL',
'-- select ''f?p=&APP_ID.:7:''||:APP_SESSION||''::::P7_ID:''||m.id link',
'-- , m.name     name',
'-- , m.id     id',
'-- , m.project_id  parent_id',
'-- , m.due_date    actual_start',
'-- , null  actual_end',
'-- , case when due_date <= sysdate then 100 else 0 end progress',
'-- from eba_demo_proj_milestones m',
'UNION ALL',
'select ''f?p=&APP_ID.:9:''||:APP_SESSION||''::::P9_ID:''||t.id link',
', t.name     name',
', t.id     id',
'-- , t.project_id  parent_id',
', null parent_id',
', t.start_date    actual_start',
', t.end_date      actual_end',
', decode(t.is_complete_yn, ''Y'', 100, case when start_date < sysdate then 50 else 0 end)  progress',
'from eba_demo_proj_tasks t',
'order by 5'))
,p_series_query_type=>'SQL_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>100
,p_show_action_link=>'N'
);
end;
/
