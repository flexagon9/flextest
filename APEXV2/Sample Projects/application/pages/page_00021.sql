prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(44535706737386353012)
,p_name=>'Team Members Review'
,p_step_title=>'Team Members Review'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20180201115422'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1082903523605885711)
,p_plug_name=>'Expectations for Incomplete Tasks'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(44535680543877352962)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1082903905983885711)
,p_region_id=>wwv_flow_api.id(1082903523605885711)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1082905132405885713)
,p_chart_id=>wwv_flow_api.id(1082903905983885711)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with data as (',
'	select t.assignee',
'	, t.id as task_id',
'	, eba_demo_projects_color_pkg.task_color',
'	  ( p_task_id => t.id',
'	   , p_completed_date => p.completed_date',
'	   , p_due_date => null',
'	  ) css_class',
'	from eba_demo_proj_tasks t',
'	, eba_demo_projects p',
'	where p.id = t.project_id',
'	and t.milestone_id is null',
'    and nvl(t.is_complete_yn,''N'') = ''N''',
'	UNION ALL',
'	select t.assignee ',
'	, t.id as task_id',
'	, eba_demo_projects_color_pkg.task_color',
'	  ( p_task_id => t.id',
'	   , p_completed_date => null',
'	   , p_due_date => m.due_date',
'	  ) css_class',
'	from eba_demo_proj_tasks t',
'	, eba_demo_proj_milestones m',
'	where m.id = t.milestone_id',
'    and nvl(t.is_complete_yn,''N'') = ''N''',
') ',
'select tm.id',
', nvl(tm.full_name, tm.username) as label',
', (select count(''x'') ',
'   from data d ',
'   where d.assignee = tm.id',
'   and d.css_class =  ''apex-cal-blue myicon-left myicon-check''',
'  ) value',
', ''On Schedule'' series',
', tm.created',
'from eba_demo_proj_team_members tm ',
'UNION ALL',
'select tm.id',
', nvl(tm.full_name, tm.username) as label',
', (select count(''x'') ',
'   from data d ',
'   where d.assignee = tm.id',
'   and d.css_class =  ''apex-cal-yellow myicon-left myicon-check''',
'  ) value',
', ''At Risk'' series',
', tm.created',
'from eba_demo_proj_team_members tm ',
'UNION ALL',
'select tm.id',
', nvl(tm.full_name, tm.username) as label',
', (select count(''x'') ',
'   from data d ',
'   where d.assignee = tm.id',
'   and d.css_class =  ''apex-cal-orange myicon-left myicon-check''',
'  ) value',
', ''Will Be Late'' series',
', tm.created',
'from eba_demo_proj_team_members tm ',
'order by 2'))
,p_series_name_column_name=>'SERIES'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1082904283999885711)
,p_chart_id=>wwv_flow_api.id(1082903905983885711)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Tasks'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1082904690850885712)
,p_chart_id=>wwv_flow_api.id(1082903905983885711)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Assignees'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>1
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1082905568778885714)
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
 p_id=>wwv_flow_api.id(1082906127694885715)
,p_plug_name=>'Project Leads'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(44535680543877352962)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1082906498000885715)
,p_region_id=>wwv_flow_api.id(1082906127694885715)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1082907748701885716)
,p_chart_id=>wwv_flow_api.id(1082906498000885715)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id',
', (select nvl(tm.full_name, tm.username)',
'   from eba_demo_proj_team_members tm',
'   where tm.id = p.project_lead',
'  ) ',
'  || '' [''|| p.name ||'']'' as label',
', (select count(''x'') from eba_demo_proj_tasks t ',
'where p.id = t.project_id ',
'and nvl(t.is_complete_yn,''N'') = ''Y''',
') value',
', ''Completed Tasks'' series',
', p.created',
'from eba_demo_projects p',
'UNION ALL',
'select p.id',
', (select nvl(tm.full_name, tm.username)',
'   from eba_demo_proj_team_members tm',
'   where tm.id = p.project_lead',
'  ) ',
'  || '' [''|| p.name ||'']'' as label',
', (select count(''x'') from eba_demo_proj_tasks t ',
'where p.id = t.project_id ',
'and nvl(t.is_complete_yn,''N'') = ''N''',
') value',
', ''Incompleted Tasks'' series',
', p.created',
'from eba_demo_projects p',
'order by 5'))
,p_series_name_column_name=>'SERIES'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1082906907972885715)
,p_chart_id=>wwv_flow_api.id(1082906498000885715)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1082907346344885716)
,p_chart_id=>wwv_flow_api.id(1082906498000885715)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Tasks'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1082908204090885717)
,p_plug_name=>'On-Time Completion'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(44535680543877352962)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1082908566774885717)
,p_region_id=>wwv_flow_api.id(1082908204090885717)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1082909841337885718)
,p_chart_id=>wwv_flow_api.id(1082908566774885717)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with data as (',
'	select t.assignee ',
'	, t.id as task_id',
'	, eba_demo_projects_color_pkg.task_color',
'	  ( p_task_id => t.id',
'	   , p_completed_date => p.completed_date',
'	   , p_due_date => null',
'	  ) css_class',
'	from eba_demo_proj_tasks t',
'	, eba_demo_projects p',
'	where p.id = t.project_id',
'	and t.milestone_id is null',
'    and nvl(t.is_complete_yn,''N'') = ''Y''',
'	UNION ALL',
'	select t.assignee ',
'	, t.id as task_id',
'	, eba_demo_projects_color_pkg.task_color',
'	  ( p_task_id => t.id',
'	   , p_completed_date => null',
'	   , p_due_date => m.due_date',
'	  ) css_class',
'	from eba_demo_proj_tasks t',
'	, eba_demo_proj_milestones m',
'	where m.id = t.milestone_id',
'    and nvl(t.is_complete_yn,''N'') = ''Y''',
') ',
'select tm.id',
', nvl(tm.full_name, tm.username) as label',
', (select count(''x'') ',
'   from data d ',
'   where d.assignee = tm.id',
'   and d.css_class =  ''apex-cal-green myicon-left myicon-check''',
'  ) value',
', ''On-Time'' series',
', tm.created',
'from eba_demo_proj_team_members tm ',
'UNION ALL',
'select tm.id',
', nvl(tm.full_name, tm.username) as label',
', (select count(''x'') ',
'   from data d ',
'   where d.assignee = tm.id',
'   and d.css_class =  ''apex-cal-red myicon-left myicon-check''',
'  ) value',
', ''Late'' series',
', tm.created',
'from eba_demo_proj_team_members tm ',
'order by 2'))
,p_series_name_column_name=>'SERIES'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1082909362370885717)
,p_chart_id=>wwv_flow_api.id(1082908566774885717)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Assignees'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1082909019144885717)
,p_chart_id=>wwv_flow_api.id(1082908566774885717)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Tasks'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>1
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
end;
/
