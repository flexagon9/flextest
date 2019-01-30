--application/shared_components/navigation/lists/footer_controls
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1730409303406978234 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Footer Controls',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 1730409513549978234 + wwv_flow_api.g_id_offset,
  p_list_id=> 1730409303406978234 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Full Site',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'star',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '1',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1730409800919978236 + wwv_flow_api.g_id_offset,
  p_list_id=> 1730409303406978234 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Logout',
  p_list_item_link_target=> '&LOGOUT_URL.',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'delete',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '1',
  p_list_item_owner=> '');
 
null;
 
end;
/

