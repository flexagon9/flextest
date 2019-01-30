--application/shared_components/navigation/lists/mobile_options
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1725035094776758860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Mobile Options',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 1725035312779758861 + wwv_flow_api.g_id_offset,
  p_list_id=> 1725035094776758860 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Customers',
  p_list_item_link_target=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:201:::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '201',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1725035613719758861 + wwv_flow_api.g_id_offset,
  p_list_id=> 1725035094776758860 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Products',
  p_list_item_link_target=> 'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:203:::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '203',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1725035904216758861 + wwv_flow_api.g_id_offset,
  p_list_id=> 1725035094776758860 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Orders',
  p_list_item_link_target=> 'f?p=&APP_ID.:205:&SESSION.::&DEBUG.:205:::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '205',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1363114189963159199 + wwv_flow_api.g_id_offset,
  p_list_id=> 1725035094776758860 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Reports',
  p_list_item_link_target=> 'f?p=&APP_ID.:208:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '208',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1725036492678758862 + wwv_flow_api.g_id_offset,
  p_list_id=> 1725035094776758860 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>50,
  p_list_item_link_text=> 'Calendar',
  p_list_item_link_target=> 'f?p=&APP_ID.:215:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '212',
  p_list_item_owner=> '');
 
null;
 
end;
/

