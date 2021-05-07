prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.03.31'
,p_release=>'19.1.0.00.15'
,p_default_workspace_id=>1250430451235357
,p_default_application_id=>101
,p_default_owner=>'NICE'
);
end;
/
 
prompt APPLICATION 101 - Sample Projects
--
-- Application Export:
--   Application:     101
--   Name:            Sample Projects
--   Exported By:     NICE
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     248362027330078
--

-- Application Statistics:
--   Pages:                     42
--     Items:                  135
--     Computations:             3
--     Validations:             12
--     Processes:               51
--     Regions:                120
--     Buttons:                 85
--     Dynamic Actions:         49
--   Shared Components:
--     Logic:
--       Items:                  1
--     Navigation:
--       Lists:                  7
--       Breadcrumbs:            1
--         Entries:             28
--     Security:
--       Authentication:         1
--       Authorization:          1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              16
--         Label:                7
--         List:                12
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:              10
--       LOVs:                   9
--       Shortcuts:              2
--       Plug-ins:               2
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Excluded

