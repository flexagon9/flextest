--application/shared_components/globalization/messages
prompt  ...text messages
--
prompt  ......Message administration
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Administration';

wwv_flow_api.create_message (
  p_id=>4168815219898486462 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'ADMINISTRATION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message help
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Help';

wwv_flow_api.create_message (
  p_id=>4168815422322487151 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'HELP',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message mobile
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Mobile';

wwv_flow_api.create_message (
  p_id=>4168830137616595621 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'MOBILE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message search_term_blurb
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Search customers, orders and product data';

wwv_flow_api.create_message (
  p_id=>4169742842483466114 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'SEARCH_TERM_BLURB',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

