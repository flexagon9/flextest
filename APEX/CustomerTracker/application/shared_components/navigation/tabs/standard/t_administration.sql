--application/shared_components/navigation/tabs/standard/t_administration
wwv_flow_api.create_tab (
  p_id=> 994153347957345841 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 15,
  p_tab_name=> 'T_ADMINISTRATION',
  p_tab_text => 'Administration',
  p_tab_step => 33,
  p_tab_also_current_for_pages => '34,18,35,38,39,40',
  p_tab_parent_tabset=>'TS1',
  p_tab_plsql_condition=>'33,34,18,35,38,39,40',
  p_display_condition_type=> 'CURRENT_PAGE_IN_CONDITION',
  p_tab_comment  => '');
 
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
