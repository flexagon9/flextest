--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
wwv_flow_api.create_page_group(
  p_id=>1732188011359373082 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'Desktop',
  p_group_desc=>'');
 
wwv_flow_api.create_page_group(
  p_id=>1732188113783373791 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'Mobile',
  p_group_desc=>'');
 
null;
 
end;
/

 
