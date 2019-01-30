--application/shared_components/user_interface/templates/calendar/basic_calendar
prompt  ......template 1725031808453723832
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 1725031808453723832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Basic Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th scope="col" class="m-DayOfWeek">#IDY#</th>',
  p_month_title_format=> '<table summary="" role="presentation" class="m-Calendar" id="calendar_month_#REGION_STATIC_ID#" data-enhance=false>'||unistr('\000a')||
'<tr><th class="m-MonthTitle" colspan="7" >#IMONTH# #YYYY#</th></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'',
  p_month_open_format=> '<tr>',
  p_month_close_format=> '<tr><td colspan="7">'||unistr('\000a')||
'<div id="calendar_day_details_#REGION_STATIC_ID#"></div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<script>'||unistr('\000a')||
'    apex.jQuery( this) .on("pageshow", function() {'||unistr('\000a')||
'           lDetails$ = apex.jQuery( "#calendar_day_details_#REGION_STATIC_ID#" );'||unistr('\000a')||
'     apex.jQuery( ".m-Today" ).addClass("m-Day");'||unistr('\000a')||
'        apex.jQuery( ".m-Today" ).removeClass( "m-Today" );'||unistr('\000a')||
'     apex.jQuery("#calendar_month_#REGION_STATIC_ID#").find("td[data-date=#CURRENT_DATE#]").addClass( "m-Today" );'||unistr('\000a')||
'     apex.widget.calendar.getDayData( "#REGION_STATIC_ID#", ''#CURRENT_DATE#'', {'||unistr('\000a')||
'            clear:   function() {'||unistr('\000a')||
'                         lDetails$.empty();'||unistr('\000a')||
'                     },'||unistr('\000a')||
'            success: function( pData ) {'||unistr('\000a')||
'                lDetails$.html( pData );'||unistr('\000a')||
'            }'||unistr('\000a')||
'        });'||unistr('\000a')||
'    });'||unistr('\000a')||
'    // register a delegated event on the table listening for all clicks in TD''s'||unistr('\000a')||
'    apex.jQuery( "##REGION_STATIC_ID#" )'||unistr('\000a')||
'        .on( "apexafterrefresh", function() {'||unistr('\000a')||
'            apex.jQuery( "#calendar_month_#REGION_STATIC_ID#" ).find( "[data-role=''listview'']").listview(); })'||unistr('\000a')||
'        .on( "swipeleft", function() {'||unistr('\000a')||
'            apex.widget.calendar.ajax_calendar(''S'', ''next''); } )'||unistr('\000a')||
'        .on( "swiperight", function() {'||unistr('\000a')||
'            apex.widget.calendar.ajax_calendar(''S'', ''previous''); } );'||unistr('\000a')||
''||unistr('\000a')||
'    apex.jQuery( window ).on( "orientationchange", function (pEvent) {'||unistr('\000a')||
'        if ( pEvent.orientation === "landscape" ) {'||unistr('\000a')||
'            if ( $v( "p_calendar_type" ) === "M" || $v( "p_calendar_type" ) === "D" || $v( "p_calendar_type" ) === "A") {'||unistr('\000a')||
'                apex.widget.calendar.ajax_calendar( "W", "same");'||unistr('\000a')||
'            }'||unistr('\000a')||
'        } else {'||unistr('\000a')||
'            if ( $v( "p_calendar_type" ) == "W" ) {'||unistr('\000a')||
'                apex.widget.calendar.ajax_calendar( "M", "same" ); '||unistr('\000a')||
'            }'||unistr('\000a')||
'        }'||unistr('\000a')||
'        return false;'||unistr('\000a')||
'    });'||unistr('\000a')||
''||unistr('\000a')||
'    apex.jQuery( "#calendar_month_#REGION_STATIC_ID#" ).on( "tap", "td[class^=m-]", function () {'||unistr('\000a')||
'        var lDate     = apex.jQuery( this ).data( "date" ),'||unistr('\000a')||
'            lDetails$ = apex.jQuery( "#calendar_day_details_#REGION_STATIC_ID#" );'||unistr('\000a')||
'        apex.jQuery(".apex-calendar-today-has-data").addClass(''apex-calendar-has-data'');'||unistr('\000a')||
'        apex.jQuery(".apex-calendar-today-has-data").removeClass("apex-calendar-today-has-data");'||unistr('\000a')||
'        apex.jQuery( ".m-Today" ).addClass("m-Day");'||unistr('\000a')||
'        apex.jQuery( ".m-Today" ).removeClass( "m-Today" );'||unistr('\000a')||
'        apex.jQuery( this ).addClass( "m-Today" );'||unistr('\000a')||
''||unistr('\000a')||
'        apex.widget.calendar.getDayData( "#REGION_STATIC_ID#", lDate, {'||unistr('\000a')||
'            clear:   function() {'||unistr('\000a')||
'                         lDetails$.empty();'||unistr('\000a')||
'                     },'||unistr('\000a')||
'            success: function( pData ) {'||unistr('\000a')||
'                lDetails$.html( pData );'||unistr('\000a')||
'            }'||unistr('\000a')||
'        });'||unistr('\000a')||
'    });'||unistr('\000a')||
'    apex.jQuery( "#calendar_month_#REGION_STATIC_ID#" ).on( "taphold", "td[class^=m-]", function (e) {'||unistr('\000a')||
'       apex.widget.calendar.ajaxAddData(e);'||unistr('\000a')||
'    });'||unistr('\000a')||
'</script>',
  p_day_title_format=> '<div class="content-primary" class="m-DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="m-Day #HAS_DATA#" data-date="#CANONICAL_DATE#">#TITLE_FORMAT#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td class="m-Today #HAS_DATA#" data-date="#CANONICAL_DATE#">#TITLE_FORMAT#',
  p_weekend_title_format=> '<div class="content-primary" class="m-WeekendDayTitle">#DD#</div>'||unistr('\000a')||
'',
  p_weekend_open_format => '<td class="m-WeekendDay #HAS_DATA#"  data-date="#CANONICAL_DATE#">#TITLE_FORMAT#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="content-primary" class="m-NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="m-NonDay"  data-date="#CANONICAL_DATE#">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '',
  p_daily_open_format => '',
  p_daily_close_format => '',
  p_weekly_title_format => '<table summary="" role="presentation" class="m-WeekCalendar">'||unistr('\000a')||
'	<tr>'||unistr('\000a')||
'        <th class="m-monthTitle" colspan="7" >#WTITLE#</th>'||unistr('\000a')||
'	</tr>',
  p_weekly_day_of_week_format => '<th scope="col" class="m-DayOfWeek" >#IDY# #MM#/#DD#</th>'||unistr('\000a')||
'',
  p_weekly_month_open_format => '',
  p_weekly_month_close_format => '</table>'||unistr('\000a')||
'<script>'||unistr('\000a')||
'    // register a delegated event on the table listening for all taphold in TD''s'||unistr('\000a')||
'    apex.jQuery( "##REGION_STATIC_ID#" ).on( "taphold", "td[class^=m-]", function (e) {'||unistr('\000a')||
'        apex.widget.calendar.ajaxAddData(e);'||unistr('\000a')||
'    });'||unistr('\000a')||
'</script>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="m-Day">',
  p_weekly_day_close_format => '</td>',
  p_weekly_today_open_format => '<td class="m-Today">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td class="m-NonDay">',
  p_weekly_weekend_close_format => '</td>',
  p_weekly_time_open_format => '<th scope="row" class="m-hour">',
  p_weekly_time_close_format => '</th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr rowspan="2">',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th scope="col" class="m-DayOfWeek">#IDAY# #DD# #IMONTH# #YYYY#</th>',
  p_daily_month_title_format => '<table summary="" role="presentation" class="m-DayCalendar"><tr>'||unistr('\000a')||
'',
  p_daily_month_open_format => '',
  p_daily_month_close_format => '</table>'||unistr('\000a')||
'<script>'||unistr('\000a')||
'    // register a delegated event on the table listening for all taphold in TD''s'||unistr('\000a')||
'    apex.jQuery( "##REGION_STATIC_ID#" ).on( "taphold", "td[class^=m-]", function (e) {'||unistr('\000a')||
'        apex.widget.calendar.ajaxAddData(e);'||unistr('\000a')||
'    });'||unistr('\000a')||
'</script>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td class="m-Day">',
  p_daily_day_close_format => '</td>',
  p_daily_today_open_format => '<td class="m-ToDay">',
  p_daily_time_open_format => '<th scope="row" class="m-hour">',
  p_daily_time_close_format => '</th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr rowspan="2" >',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '<ul data-role="listview">'||unistr('\000a')||
'#DAYS#'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'',
  p_agenda_past_day_format => '<li data-role="list-divider" data-theme="d">#IDAY# #IMONTH# #DD# #YYYY#</li>',
  p_agenda_today_day_format => '<li data-role="list-divider" data-theme="b">#IDAY# #IMONTH# #DD# #YYYY#</li>',
  p_agenda_future_day_format => '<li  data-role="list-divider" >#IDAY# #IMONTH# #DD# #YYYY#</li>',
  p_agenda_past_entry_format => '<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>',
  p_agenda_today_entry_format => '<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>',
  p_agenda_future_entry_format => '<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>',
  p_month_data_format => '<ul id="listview_#REGION_STATIC_ID#" data-role="listview" data-inset="true" data-theme="c">#DAYS#</ul>'||unistr('\000a')||
'',
  p_month_data_entry_format => '<li align="left" >#LINK##DATA#<p class="ui-li-aside">#TIME#</p></li>'||unistr('\000a')||
' ',
  p_theme_id  => 150,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ...application themes
--
