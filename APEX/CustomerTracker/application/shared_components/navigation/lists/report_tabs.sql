--application/shared_components/navigation/lists/report_tabs
 
begin
 
wwv_flow_api.create_list (
  p_id=> 7552483605995432369 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Report Tabs',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 7552493703964460211 + wwv_flow_api.g_id_offset,
  p_list_id=> 7552483605995432369 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Customer Orders',
  p_list_item_link_target=> 'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Stacked bar chart of customer orders by Month',
  p_list_text_02=> 'chartIcon',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '17',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 7552493399808458980 + wwv_flow_api.g_id_offset,
  p_list_id=> 7552483605995432369 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Sales by Category',
  p_list_item_link_target=> 'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Pie chart of sales for each category',
  p_list_text_02=> 'chartIcon',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '16',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 4168870718251167193 + wwv_flow_api.g_id_offset,
  p_list_id=> 7552483605995432369 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Sales by Product',
  p_list_item_link_target=> 'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:RP:::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Bar chart of sales for each product',
  p_list_text_02=> 'chartIcon',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '27',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 7552484513960434664 + wwv_flow_api.g_id_offset,
  p_list_id=> 7552483605995432369 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Sales by Category / Month',
  p_list_item_link_target=> 'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'Vertical bar chart of sales by month',
  p_list_text_02=> 'chartIcon',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '5',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 4170129326382180860 + wwv_flow_api.g_id_offset,
  p_list_id=> 7552483605995432369 + wwv_flow_api.g_id_offset,
  p_list_item_type=> '',
  p_list_item_status=> '',
  p_item_displayed=> '',
  p_list_item_display_sequence=>50,
  p_list_item_link_text=> 'Sales by State',
  p_list_item_link_target=> 'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::::',
  p_list_text_01=> 'CSS chart of sales by State',
  p_list_text_02=> 'chartIcon',
  p_list_item_current_type=> '',
  p_list_item_current_for_pages=> '31',
  p_list_item_owner=> '');
 
null;
 
end;
/

