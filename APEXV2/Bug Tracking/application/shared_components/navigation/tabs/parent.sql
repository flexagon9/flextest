prompt --application/shared_components/navigation/tabs/parent
begin
wwv_flow_api.create_toplevel_tab(
 p_id=>wwv_flow_api.id(10536430298459749609)
,p_tab_set=>'TS1'
,p_tab_sequence=>10
,p_tab_name=>'T_HOME'
,p_tab_text=>'Home'
,p_tab_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_current_on_tabset=>'T_HOME'
);
end;
/
