--application/shared_components/user_interface/templates/region/standard_region_no_padding
prompt  ......region template 1020545355391437572
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1020545355391437572 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uRegionNoPadding #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Standard Region - No Padding'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 25
 ,p_theme_class_id => 13
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

