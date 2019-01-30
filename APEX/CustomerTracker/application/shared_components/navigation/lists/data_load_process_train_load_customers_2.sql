--application/shared_components/navigation/lists/data_load_process_train_load_customers
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1739039391950354925 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Data Load Process Train - Load Customers',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 1739039709744354926 + wwv_flow_api.g_id_offset,
  p_list_id=> 1739039391950354925 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Data Load Source',
  p_list_item_link_target=> 'f?p=&APP_ID.:21:&SESSION.::&DEBUG.',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1739039989209354926 + wwv_flow_api.g_id_offset,
  p_list_id=> 1739039391950354925 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Data / Table Mapping',
  p_list_item_link_target=> 'f?p=&APP_ID.:22:&SESSION.::&DEBUG.',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1739040295992354926 + wwv_flow_api.g_id_offset,
  p_list_id=> 1739039391950354925 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Data Validation',
  p_list_item_link_target=> 'f?p=&APP_ID.:23:&SESSION.::&DEBUG.',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1739040499461354926 + wwv_flow_api.g_id_offset,
  p_list_id=> 1739039391950354925 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Data Load Results',
  p_list_item_link_target=> 'f?p=&APP_ID.:24:&SESSION.::&DEBUG.',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

