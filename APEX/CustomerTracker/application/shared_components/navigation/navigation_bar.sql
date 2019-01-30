--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id => 1725023604033704734 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 10,
  p_icon_image => '',
  p_icon_subtext=> 'Mobile',
  p_icon_target=> 'f?p=&APP_ID.:HOME_JQM_SMARTPHONE:&SESSION.::&DEBUG.::::',
  p_icon_image_alt=> 'Mobile',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> '',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 7567378671618307856 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 20,
  p_icon_image => '',
  p_icon_subtext=> 'Feedback',
  p_icon_target=> 'javascript:popupURL(''f?p=&APP_ID.:102:&SESSION.:::102:P102_APPLICATION_ID,P102_PAGE_ID:&APP_ID.,&APP_PAGE_ID.'');',
  p_icon_image_alt=> '',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'Y',
  p_icon_bar_disp_cond=> 'ENABLE_FEEDBACK',
  p_icon_bar_disp_cond_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_icon_bar_flow_cond_instr=> 'YES',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 4171950738921974833 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 30,
  p_icon_image => '',
  p_icon_subtext=> 'Administration',
  p_icon_target=> 'f?p=&APP_ID.:admin:&SESSION.::&DEBUG.::::',
  p_icon_image_alt=> '',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> '',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 4171950142253966424 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 40,
  p_icon_image => '',
  p_icon_subtext=> 'Help',
  p_icon_target=> 'f?p=&APP_ID.:help:&SESSION.::&DEBUG.::::',
  p_icon_image_alt=> '',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> '',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 7523991008123128295 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 50,
  p_icon_image => '',
  p_icon_subtext=> 'Logout',
  p_icon_target=> '&LOGOUT_URL.',
  p_icon_image_alt=> 'Logout',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> '',
  p_begins_on_new_line=> '',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
