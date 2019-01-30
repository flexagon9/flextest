--application/shared_components/user_interface/lov/lov_dataload_load_customers
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 987579962367735980 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_DATALOAD_LOAD CUSTOMERS',
  p_lov_query=> '.'||to_char(987579962367735980 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987580657604735981 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>10,
  p_lov_disp_value=>'Customer Identifier',
  p_lov_return_value=>'CUSTOMER_ID',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987581557784735981 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>20,
  p_lov_disp_value=>'First Name',
  p_lov_return_value=>'CUST_FIRST_NAME',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987581858822735981 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>30,
  p_lov_disp_value=>'Last Name',
  p_lov_return_value=>'CUST_LAST_NAME',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987582754031735981 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>40,
  p_lov_disp_value=>'Street Address',
  p_lov_return_value=>'CUST_STREET_ADDRESS1',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987583044179735982 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>50,
  p_lov_disp_value=>'Street Address Line 2',
  p_lov_return_value=>'CUST_STREET_ADDRESS2',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987580948186735981 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>60,
  p_lov_disp_value=>'City',
  p_lov_return_value=>'CUST_CITY',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987582461671735981 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>70,
  p_lov_disp_value=>'State',
  p_lov_return_value=>'CUST_STATE',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987582158266735981 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>80,
  p_lov_disp_value=>'Postal Code',
  p_lov_return_value=>'CUST_POSTAL_CODE',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987581276431735981 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>90,
  p_lov_disp_value=>'Email',
  p_lov_return_value=>'CUST_EMAIL',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987583352293735982 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>100,
  p_lov_disp_value=>'Phone Number',
  p_lov_return_value=>'PHONE_NUMBER1',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987583657874735983 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>110,
  p_lov_disp_value=>'Alternate Number',
  p_lov_return_value=>'PHONE_NUMBER2',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987584258847735983 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>120,
  p_lov_disp_value=>'URL',
  p_lov_return_value=>'URL',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987580346149735981 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>130,
  p_lov_disp_value=>'Credit Limit',
  p_lov_return_value=>'CREDIT_LIMIT',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>987583946612735983 + wwv_flow_api.g_id_offset,
  p_lov_id=>987579962367735980 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>140,
  p_lov_disp_value=>'Tags',
  p_lov_return_value=>'TAGS',
  p_lov_data_comment=> '');
 
null;
 
end;
/

