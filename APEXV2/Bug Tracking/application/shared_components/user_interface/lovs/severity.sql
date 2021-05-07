prompt --application/shared_components/user_interface/lovs/severity
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5505091288993552049)
,p_lov_name=>'SEVERITY'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select severity_name d, id r',
'from   EBA_BT_SEVERITY',
'order by nvl(sequence_number,99), severity_name'))
);
end;
/
