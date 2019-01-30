--application/shared_components/navigation/lists/order_wizard
 
begin
 
wwv_flow_api.create_list (
  p_id=> 7541222817657715722 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Order Wizard',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 7541223223544717392 + wwv_flow_api.g_id_offset,
  p_list_id=> 7541222817657715722 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Identify Customer',
  p_list_item_link_target=> '',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '11',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 7541232596364747358 + wwv_flow_api.g_id_offset,
  p_list_id=> 7541222817657715722 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Select Items',
  p_list_item_link_target=> '',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '12',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 7549127418826656506 + wwv_flow_api.g_id_offset,
  p_list_id=> 7541222817657715722 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Order Summary',
  p_list_item_link_target=> '',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '14',
  p_list_item_owner=> '');
 
null;
 
end;
/

