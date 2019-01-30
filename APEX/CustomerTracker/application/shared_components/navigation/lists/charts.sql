--application/shared_components/navigation/lists/charts
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1734045121679414908 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Charts',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 1734045306895414909 + wwv_flow_api.g_id_offset,
  p_list_id=> 1734045121679414908 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Customer Orders',
  p_list_item_link_target=> 'f?p=&APP_ID.:209:&SESSION.:',
  p_list_text_01=> '',
  p_list_item_current_type=> '',
  p_list_item_current_for_pages=> '209',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1734045600720414909 + wwv_flow_api.g_id_offset,
  p_list_id=> 1734045121679414908 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Sales by Category',
  p_list_item_link_target=> 'f?p=&APP_ID.:210:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '210',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1734052693984593275 + wwv_flow_api.g_id_offset,
  p_list_id=> 1734045121679414908 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Sales by Product',
  p_list_item_link_target=> 'f?p=&APP_ID.:211:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1734045915839414909 + wwv_flow_api.g_id_offset,
  p_list_id=> 1734045121679414908 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Sales by Category / Month',
  p_list_item_link_target=> 'f?p=&APP_ID.:212:&SESSION.:',
  p_list_text_01=> '',
  p_list_item_current_type=> '',
  p_list_item_current_for_pages=> '211',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1734046205629414909 + wwv_flow_api.g_id_offset,
  p_list_id=> 1734045121679414908 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>50,
  p_list_item_link_text=> 'Sales by State',
  p_list_item_link_target=> 'f?p=&APP_ID.:213:&SESSION.:',
  p_list_text_01=> '',
  p_list_item_current_type=> '',
  p_list_item_current_for_pages=> '212',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1734262120329599017 + wwv_flow_api.g_id_offset,
  p_list_id=> 1734045121679414908 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>60,
  p_list_item_link_text=> 'Tags',
  p_list_item_link_target=> 'f?p=&APP_ID.:214:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

