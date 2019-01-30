--application/shared_components/logic/application_processes/trim_all_page_items
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'    for c1 in (select item_name'||unistr('\000a')||
'               from apex_application_page_items'||unistr('\000a')||
'               where application_id = :APP_ID'||unistr('\000a')||
'                   and page_id = :APP_PAGE_ID'||unistr('\000a')||
'                   and display_as_code in (''NATIVE_TEXT_FIELD'','||unistr('\000a')||
'                                           ''NATIVE_TEXTAREA'','||unistr('\000a')||
'                                           ''NATIVE_NUMBER_FIELD'') ) loop'||unistr('\000a')||
'        apex_util.set_s';

p:=p||'ession_state( c1.item_name,'||unistr('\000a')||
'            regexp_replace(apex_util.get_session_state( c1.item_name ),'||unistr('\000a')||
'                ''^[[:space:]]*(.*?)[[:space:]]*$'', ''\1'''||unistr('\000a')||
'            )'||unistr('\000a')||
'        );'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 972301120189018875 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_SUBMIT_BEFORE_COMPUTATION',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Trim All Page Items',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

prompt  ...application items
--
