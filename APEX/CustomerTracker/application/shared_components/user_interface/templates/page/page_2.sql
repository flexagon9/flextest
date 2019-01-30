--application/shared_components/user_interface/templates/page/page
prompt  ......Page template 1725024315711723827
 
begin
 
wwv_flow_api.create_template (
  p_id => 1725024315711723827 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 150
 ,p_name => 'Page'
 ,p_is_popup => false
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_50/css/4_2.css'
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html>'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <meta charset="utf-8" />'||unistr('\000a')||
'  <meta name="apple-mobile-web-app-capable" content="yes">'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'  #TEMPLATE_CSS#'||unistr('\000a')||
'  #APEX_JAVASCRIPT#'||unistr('\000a')||
'  #TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'  #APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'  #HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'
 ,p_box => 
'<div id="#PAGE_STATIC_ID#" data-role="page" data-theme="c" data-url="#REQUESTED_URL#">'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
''||unistr('\000a')||
'<div data-role="content" data-theme="c">'||unistr('\000a')||
'  <div id="messages">'||unistr('\000a')||
'    #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'</div><!-- /content -->'||unistr('\000a')||
''||unistr('\000a')||
'#REGION_POSITION_08#'||unistr('\000a')||
''||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
''||
'</div><!-- /page -->'
 ,p_footer_template => 
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="ui-bar ui-bar-d success" id="success-message">'||unistr('\000a')||
'  <h4 style="display:inline-block;margin-top:5px;">#SUCCESS_MESSAGE#</h4>'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="ui-bar ui-bar-b notification" id="notification-message">'||unistr('\000a')||
'  <h4 style="display:inline-block; margin-top:5px;">#MESSAGE#</h4>'||unistr('\000a')||
'</div>'
 ,p_theme_class_id => 17
 ,p_grid_type => 'VARIABLE'
 ,p_grid_max_columns => 5
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => false
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '<div class="ui-grid-#USED_COLUMNS_ALPHA_MINUS# apex-grid-debug">#ROWS#</div>'
 ,p_grid_row_template => '#COLUMNS#'
 ,p_grid_column_template => '<div class="ui-block-#COLUMN_ALPHA#">#CONTENT#</div>'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document).on("apex-devbar-grid-debug-on", function(){'||unistr('\000a')||
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").addClass("ui-bar-e"); });'||unistr('\000a')||
''||unistr('\000a')||
'apex.jQuery(document).on("apex-devbar-grid-debug-off", function(){'||unistr('\000a')||
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").removeClass("ui-bar-e"); });'||unistr('\000a')||
''
 ,p_has_edit_links => false
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

