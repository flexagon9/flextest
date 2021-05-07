prompt --application/shared_components/user_interface/lovs/bugs_with_bug_number
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4206201031445639091)
,p_lov_name=>'BUGS WITH BUG NUMBER'
,p_lov_query=>'select bug_number||''. ''||subject d , id from EBA_BT_SW_DEFECTS where id = :P62_ID'
);
end;
/
