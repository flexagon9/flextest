--application/shared_components/navigation/lists/reports
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4168871924531197385 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Reports',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 4168872129193197387 + wwv_flow_api.g_id_offset,
  p_list_id=> 4168871924531197385 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Customer Map',
  p_list_item_link_target=> 'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Map of orders with zoom in and out',
  p_list_text_02=> 'reportIcon',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '13',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 4168872414061197388 + wwv_flow_api.g_id_offset,
  p_list_id=> 4168871924531197385 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Product Order Tree',
  p_list_item_link_target=> 'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Tree control with expand and collapse',
  p_list_text_02=> 'reportIcon',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '19',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 4168892228126875291 + wwv_flow_api.g_id_offset,
  p_list_id=> 4168871924531197385 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Tags',
  p_list_item_link_target=> 'f?p=&APP_ID.:28:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'View tags by customer, product, and order.',
  p_list_text_02=> 'reportIcon',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

