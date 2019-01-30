--application/shared_components/navigation/tabs/standard/t_home
wwv_flow_api.create_tab (
  p_id=> 7523990524155128289 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 1,
  p_tab_name=> 'T_HOME',
  p_tab_text => 'Home',
  p_tab_step => 1,
  p_tab_also_current_for_pages => '9,15,30',
  p_tab_parent_tabset=>'TS1',
  p_tab_comment  => '');
 
