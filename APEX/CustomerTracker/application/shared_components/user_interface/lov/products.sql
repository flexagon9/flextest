--application/shared_components/user_interface/lov/products
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 7526200092291983398 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'PRODUCTS',
  p_lov_query=> 'select product_name d, product_id r from demo_product_info'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

