prompt --application/shared_components/user_interface/lovs/urgencylist
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9940849096399336671)
,p_lov_name=>'URGENCYLIST'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select URGENCY_NAME d, ',
'         id  r',
'from   eba_bt_urgency ',
'where upper(IS_ACTIVE) = ''Y''',
'order by 1',
''))
);
end;
/
