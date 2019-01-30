--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 1020523965544437557
 
begin
 
wwv_flow_api.create_template (
  p_id => 1020523965544437557 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 25
 ,p_name => 'Popup'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/modernizr/2.6.2/modernizr.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'[if lt IE 9]#IMAGE_PREFIX#libraries/respond-js/1.1.0/respond.min.js?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/js/4_2#MIN#.js?v=#APEX_VERSION#'
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_25/css/4_2.css?v=#APEX_VERSION#'||unistr('\000a')||
'#IMAGE_PREFIX#themes/theme_25/css/responsive_grid.css?v=#APEX_VERSION#'
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3 no-js" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD# id="uPopup">'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'
 ,p_box => 
'<div id="uBodyContainer">'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'  <div class="apex_grid_container">'||unistr('\000a')||
'    <div class="apex_cols apex_span_12">'||unistr('\000a')||
'      #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion successMessage clearfix" id="uSuccessMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uSuccessMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #SUCCESS_MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="apex_grid_container">'||unistr('\000a')||
'  <div class="apex_cols apex_span_12">'||unistr('\000a')||
'    <section class="uMessageRegion errorMessage clearfix" id="uNotificationMessage">'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        <a href="javascript:void(0)" onclick="apex.jQuery(''#uNotificationMessage'').remove();" class="uCloseMessage"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'        <div class="uMessageText">'||unistr('\000a')||
'          <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
'          #MESSAGE#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 4
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="apex_row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="apex_cols apex_span_#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'alpha'
 ,p_grid_last_column_attributes => 'omega'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 1020524363471437557 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 1020523965544437557 + wwv_flow_api.g_id_offset
 ,p_name => 'Content Body'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 12
  );
null;
 
end;
/

