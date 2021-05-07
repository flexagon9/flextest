prompt --application/shared_components/navigation/lists/products_nav_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(71624332676408263)
,p_name=>'Products Nav Bar'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT null, ',
'       PRODUCT_NAME label, ',
'       null target, ',
'       ''YES'' is_current, ',
'       null image, ',
'       null image_attrib, ',
'       PRODUCT_NAME image_alt',
'FROM  eba_bt_product ',
'WHERE upper(IS_ACTIVE) = ''Y'' ',
'ORDER BY 1'))
,p_list_status=>'PUBLIC'
);
end;
/
