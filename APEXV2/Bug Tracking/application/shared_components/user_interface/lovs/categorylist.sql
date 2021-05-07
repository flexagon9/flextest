prompt --application/shared_components/user_interface/lovs/categorylist
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9940853386271352623)
,p_lov_name=>'CATEGORYLIST'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select category_name d, id r',
'from   eba_bt_category c',
'where PARENT_ID is null and ',
'       upper(IS_ACTIVE) = ''Y'' and',
'       (:PRODUCT_ID = 0 or exists (select 1 from eba_bt_sw_defects d where d.category_id = c.id))',
'order by 1 '))
);
end;
/
