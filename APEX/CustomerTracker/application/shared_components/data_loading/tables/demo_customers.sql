--application/shared_components/data loading/tables/demo_customers
 
begin
 
wwv_flow_api.create_load_table(
p_id                    =>987544352493695241+ wwv_flow_api.g_id_offset,
p_flow_id               => wwv_flow.g_flow_id,
p_name                  =>'Load Customers',
p_owner                 =>'#OWNER#',
p_table_name            =>'DEMO_CUSTOMERS',
p_unique_column_1       =>'CUST_FIRST_NAME',
p_is_uk1_case_sensitive =>'N',
p_unique_column_2       =>'CUST_LAST_NAME',
p_is_uk2_case_sensitive =>'N',
p_unique_column_3       =>'',
p_is_uk3_case_sensitive =>'N',
p_version_column_name   =>'',
p_column_names_lov_id   =>987579962367735980+ wwv_flow_api.g_id_offset,
p_wizard_page_ids       =>'',
p_comments              =>'');
 
wwv_flow_api.create_load_table_lookup(
p_id                          =>993264259809760141+ wwv_flow_api.g_id_offset,
p_flow_id                     => wwv_flow.g_flow_id,
p_load_table_id               =>987544352493695241+ wwv_flow_api.g_id_offset,
p_load_column_name            =>'CUST_STATE',
p_lookup_owner                =>'#OWNER#',
p_lookup_table_name           =>'DEMO_STATES',
p_key_column                  =>'ST',
p_display_column              =>'STATE_NAME',
p_alternative_key_column1     =>'',
p_alternative_display_column1 =>'',
p_alternative_key_column2     =>'',
p_alternative_display_column2 =>'',
p_where_clause                =>'',
p_insert_new_value            =>'N',
p_error_message               =>'');
 
wwv_flow_api.create_load_table_rule(
p_id                 =>987544653017695243+ wwv_flow_api.g_id_offset,
p_flow_id            => wwv_flow.g_flow_id,
p_load_table_id      =>987544352493695241+ wwv_flow_api.g_id_offset,
p_load_column_name   =>'TAGS',
p_rule_name          =>'Tags in Upper Case',
p_rule_type          =>'TO_UPPER_CASE',
p_rule_sequence      =>'10',
p_rule_expression1   =>'',
p_rule_expression2   =>'',
p_error_message      =>'');
 
null;
 
end;
/

