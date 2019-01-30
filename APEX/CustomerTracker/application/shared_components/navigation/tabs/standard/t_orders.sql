--application/shared_components/navigation/tabs/standard/t_orders
wwv_flow_api.create_tab (
  p_id=> 7523990798233128294 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 4,
  p_tab_name=> 'T_ORDERS',
  p_tab_text => 'Orders',
  p_tab_step => 4,
  p_tab_also_current_for_pages => '11,12,14,29,14,10,10',
  p_tab_parent_tabset=>'TS1',
  p_tab_comment  => '');
 
