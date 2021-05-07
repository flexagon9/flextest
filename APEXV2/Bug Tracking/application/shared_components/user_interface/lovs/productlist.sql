prompt --application/shared_components/user_interface/lovs/productlist
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9940844106872320796)
,p_lov_name=>'PRODUCTLIST'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRODUCT_NAME d, id r ',
'from   eba_bt_product where upper(IS_ACTIVE) = ''Y'' ',
'order by 1'))
);
end;
/
