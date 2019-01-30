--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

prompt  ...post import process
 
begin
 
wwv_flow_api.post_import_process(p_flow_id => wwv_flow.g_flow_id);
null;
 
end;
/

