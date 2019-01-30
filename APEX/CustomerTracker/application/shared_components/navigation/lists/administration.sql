--application/shared_components/navigation/lists/administration
 
begin
 
wwv_flow_api.create_list (
  p_id=> 7524442313226231365 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Administration',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 7525589495916170701 + wwv_flow_api.g_id_offset,
  p_list_id=> 7524442313226231365 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Manage Sample Data',
  p_list_item_link_target=> 'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP:::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Re-create or remove sample data delivered with this application',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '33',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 994151558968325573 + wwv_flow_api.g_id_offset,
  p_list_id=> 7524442313226231365 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Manage States',
  p_list_item_link_target=> 'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Manage state codes and names',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 994175962893536439 + wwv_flow_api.g_id_offset,
  p_list_id=> 7524442313226231365 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Feedback',
  p_list_item_link_target=> 'f?p=&APP_ID.:18:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Enable or disable Feedback for the application',
  p_list_text_02=> 'switchIcon',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

