--application/shared_components/user_interface/templates/region/region_with_title_bar
prompt  ......region template 1024081250412455930
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1024081250412455930 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="ui-collapsible #REGION_CSS_CLASSES#" data-theme="b" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <h3 class="ui-collapsible-heading ui-btn ui-corner-top ui-btn-up-a">'||unistr('\000a')||
'    <span class="ui-btn-inner ui-corner-top ui-corner-bottom">'||unistr('\000a')||
'      <span lass="ui-btn-text">#TITLE#</span>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </h3>'||unistr('\000a')||
'  <div class="ui-collapsible-content ui-body-c ui-corner-bottom">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'    #SUB_REGIO'||
'NS#'||unistr('\000a')||
'    #EDIT#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Region (With Title Bar)'
 ,p_theme_id => 50
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

