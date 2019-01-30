--application/shared_components/navigation/lists/order_page
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1368350198762792452 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Order Page',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 1368350391939792453 + wwv_flow_api.g_id_offset,
  p_list_id=> 1368350198762792452 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Report',
  p_list_item_link_target=> 'f?p=&APP_ID.:4:&SESSION.:',
  p_list_text_01=> '',
  p_list_item_current_type=> '',
  p_list_item_current_for_pages=> '4',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1368350684802792454 + wwv_flow_api.g_id_offset,
  p_list_id=> 1368350198762792452 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Calendar',
  p_list_item_link_target=> 'f?p=&APP_ID.:10:&SESSION.:',
  p_list_text_01=> '',
  p_list_item_current_type=> '',
  p_list_item_current_for_pages=> '10',
  p_list_item_owner=> '');
 
null;
 
end;
/

