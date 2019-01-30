--application/shared_components/navigation/lists/admin_reports
 
begin
 
wwv_flow_api.create_list (
  p_id=> 994151967736344085 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Admin Reports',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 994152148993344085 + wwv_flow_api.g_id_offset,
  p_list_id=> 994151967736344085 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Top Users',
  p_list_item_link_target=> 'f?p=&APP_ID.:38:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Report user activity for this application',
  p_list_text_02=> 'reportIcon',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '1',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 994152457570344086 + wwv_flow_api.g_id_offset,
  p_list_id=> 994151967736344085 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Page Views',
  p_list_item_link_target=> 'f?p=&APP_ID.:39:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Report page view for this application',
  p_list_text_02=> 'reportIcon',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '1',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 994152749108344086 + wwv_flow_api.g_id_offset,
  p_list_id=> 994151967736344085 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Activity Calendar',
  p_list_item_link_target=> 'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:40:::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'View page views by user in a monthly calendar',
  p_list_text_02=> 'calendarIcon',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '1',
  p_list_item_owner=> '');
 
null;
 
end;
/

