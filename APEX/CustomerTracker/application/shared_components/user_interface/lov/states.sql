--application/shared_components/user_interface/lov/states
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 7525467593193946752 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'STATES',
  p_lov_query=> 'select initcap(state_name) display_value, st return_value from   demo_states'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

