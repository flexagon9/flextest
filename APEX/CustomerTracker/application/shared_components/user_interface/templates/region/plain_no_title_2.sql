--application/shared_components/user_interface/templates/region/plain_no_title
prompt  ......region template 1362210875681694842
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1362210875681694842 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#">'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'#SUB_REGIONS#'||unistr('\000a')||
'#CLOSE#'||unistr('\000a')||
'#DELETE#'||unistr('\000a')||
'#CREATE#'||unistr('\000a')||
'#EDIT#'||unistr('\000a')||
'#CHANGE#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Plain (No Title)'
 ,p_theme_id => 150
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

