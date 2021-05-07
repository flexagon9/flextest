prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(1064003956671340391)
,p_computation_sequence=>60
,p_computation_item=>'PRODUCT_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select product_name',
'from EBA_BT_PRODUCT',
'where id = :PRODUCT_ID',
'union all',
'select ''All Product''',
'from dual',
'where nvl(:PRODUCT_ID,0) = 0 '))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(2517306145932809463)
,p_computation_sequence=>10
,p_computation_item=>'APPLICATION_TITLE'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_app_name varchar2(255);',
'begin',
'    select nvl(preference_value,:APP_NAME)',
'      into l_app_name',
'      from eba_bt_preferences',
'     where preference_name = ''APPLICATION_TITLE'';',
'    return l_app_name;',
'exception',
'    when others then',
'        return :APP_NAME;',
'end;'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(6366566396742550188)
,p_computation_sequence=>20
,p_computation_item=>'APP_NOT_ASSIGNED_TEXT'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'htmldb_lang.message(''APP_NOT_ASSIGNED_TEXT'');'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(6323656580577419522)
,p_computation_sequence=>30
,p_computation_item=>'CHANGE_LOG_MESSAGE'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'htmldb_lang.message(''CHANGE_LOG_MESSAGE'')'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(982310815819503982)
,p_computation_sequence=>40
,p_computation_item=>'CURRENT_USER_ID'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select id from eba_bt_users where upper(username) = upper(:APP_USER)'
,p_computation_error_message=>'User ID not found.'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(1409043494509720804)
,p_computation_sequence=>50
,p_computation_item=>'PRODUCT_ID'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'0'
);
end;
/
