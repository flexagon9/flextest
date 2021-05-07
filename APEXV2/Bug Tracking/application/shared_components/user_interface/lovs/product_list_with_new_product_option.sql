prompt --application/shared_components/user_interface/lovs/product_list_with_new_product_option
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5497217863997387574)
,p_lov_name=>'PRODUCT LIST - WITH NEW PRODUCT OPTION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'union all',
'select ''- New Product -'' d,',
'          0 r',
'from dual',
'order by 1'))
);
end;
/
