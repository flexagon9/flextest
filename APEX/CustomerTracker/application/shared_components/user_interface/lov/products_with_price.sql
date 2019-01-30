--application/shared_components/user_interface/lov/products_with_price
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 7549064320962061040 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'PRODUCTS WITH PRICE',
  p_lov_query=> 'select apex_escape.html(product_name) || '' [$'' || list_price || '']'' d, product_id r from demo_product_info'||unistr('\000a')||
'where product_avail = ''Y'''||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

