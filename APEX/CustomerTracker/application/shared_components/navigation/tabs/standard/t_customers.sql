--application/shared_components/navigation/tabs/standard/t_customers
wwv_flow_api.create_tab (
  p_id=> 7523990604991128293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 2,
  p_tab_name=> 'T_CUSTOMERS',
  p_tab_text => 'Customers',
  p_tab_step => 2,
  p_tab_also_current_for_pages => '7,21,22,23,24',
  p_tab_parent_tabset=>'TS1',
  p_tab_comment  => '');
 
