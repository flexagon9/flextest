--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s:=s||'drop sequence DEMO_CUST_SEQ;'||unistr('\000a')||
'drop sequence DEMO_ORDER_ITEMS_SEQ;'||unistr('\000a')||
'drop sequence DEMO_ORD_SEQ;'||unistr('\000a')||
'drop sequence DEMO_PROD_SEQ;'||unistr('\000a')||
''||unistr('\000a')||
'drop table demo_tags cascade constraints;'||unistr('\000a')||
'drop table demo_tags_type_sum cascade constraints;'||unistr('\000a')||
'drop table demo_tags_sum cascade constraints;'||unistr('\000a')||
'drop table demo_order_items cascade constraints;'||unistr('\000a')||
'drop table demo_product_info cascade constraints;'||unistr('\000a')||
'drop table demo_states cascade constrai';

s:=s||'nts;'||unistr('\000a')||
'drop table demo_orders cascade constraints;'||unistr('\000a')||
'drop table demo_customers cascade constraints;'||unistr('\000a')||
'drop table demo_constraint_lookup cascade constraints;'||unistr('\000a')||
''||unistr('\000a')||
'drop package sample_pkg;'||unistr('\000a')||
'drop package sample_data_pkg;'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_install (
  p_id => 7230579179012541227 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_get_version_sql_query => 'SELECT OBJECT_NAME FROM USER_OBJECTS WHERE OBJECT_NAME = ''DEMO_CUSTOMERS''',
  p_deinstall_script_clob => s,
  p_deinstall_message=> '');
end;
 
 
end;
/

