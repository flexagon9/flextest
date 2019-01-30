--application/shared_components/user_interface/templates/region/modal_region
prompt  ......region template 1020542965405437571
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 1020542965405437571 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="apex_grid_container modal_grid">'||unistr('\000a')||
'  <div class="apex_cols apex_span_8 modal_col">'||unistr('\000a')||
'    <section class="uRegion uWhiteRegion uModalRegion uAlertRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'      <div class="uRegionHeading">'||unistr('\000a')||
'        <h1>#TITLE#</h1>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'      <div class="uRegionContent clearfix">'||unistr('\000a')||
'        #BODY#'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'        <span class'||
'="uButtonContainer">'||unistr('\000a')||
'          #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'        </span>'||unistr('\000a')||
'    </section>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Modal Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 25
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
wwv_flow_api.create_plug_tmpl_display_point (
  p_id => 1020543245987437571 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plug_template_id => 1020542965405437571 + wwv_flow_api.g_id_offset
 ,p_name => 'Region Body'
 ,p_placeholder => 'BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 6
  );
null;
 
end;
/

