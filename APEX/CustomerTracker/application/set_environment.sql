--application/set_environment
prompt  APPLICATION 107 - Sample Database Application
--
-- Application Export:
--   Application:     107
--   Name:            Sample Database Application
--   Date and Time:   09:56 Sunday November 11, 2018
--   Exported By:     FLD
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.2.5.00.08
--   Instance ID:     69409115742119
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
-- Application Statistics:
--   Pages:                     58
--     Items:                  165
--     Computations:             7
--     Validations:             31
--     Processes:               53
--     Regions:                127
--     Buttons:                106
--     Dynamic Actions:          8
--   Shared Components:
--     Logic:
--       Items:                  4
--       Processes:              1
--       Build Options:          1
--       Data Loading:           1
--     Navigation:
--       Parent Tabs:            1
--       Tab Sets:               1
--         Tabs:                 6
--       Lists:                 11
--       Breadcrumbs:            1
--         Entries:             33
--       NavBar Entries:         5
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 3
--       Templates:
--         Page:                21
--         Region:              52
--         Label:               13
--         List:                22
--         Popup LOV:            3
--         Calendar:             3
--         Breadcrumb:           2
--         Button:              13
--         Report:              13
--       LOVs:                  12
--       Shortcuts:              2
--       Plug-ins:               5
--     Globalization:
--       Messages:               4
--     Reports:
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,100000));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,107);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

