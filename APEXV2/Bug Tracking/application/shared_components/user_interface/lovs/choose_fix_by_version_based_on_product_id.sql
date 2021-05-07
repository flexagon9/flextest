prompt --application/shared_components/user_interface/lovs/choose_fix_by_version_based_on_product_id
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1414198702318847113)
,p_lov_name=>'CHOOSE FIX BY VERSION BASED ON PRODUCT ID'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select version_name, id',
'from eba_bt_version v',
'where :PRODUCT_ID = 0 or (product_id = :PRODUCT_ID and exists (select 1 from eba_bt_sw_defects x where x.fix_by_version_id = v.id))',
'order by 1'))
);
end;
/
