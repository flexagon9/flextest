--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 7524248809482709913 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Main Menu');
 
wwv_flow_api.create_menu_option (
  p_id=>993463657937860282 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524252604764718025 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Administration',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:33:&SESSION.',
  p_page_id=>33,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>993482569669882181 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>993463657937860282 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Sample Data',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:34:&SESSION.',
  p_page_id=>34,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>994146872015304541 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>993463657937860282 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Manage States',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:::',
  p_page_id=>35,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>994177144764562445 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>993463657937860282 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Top Users',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:38:&SESSION.',
  p_page_id=>38,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>994181444315611482 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>993463657937860282 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Page Views',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:39:&SESSION.',
  p_page_id=>39,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>994185660135622469 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>993463657937860282 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Activity Calendar',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:40:&SESSION.',
  p_page_id=>40,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>1739041205165354928 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524308101779076671 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Upload Data',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:::',
  p_page_id=>21,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>1739049192981354947 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524308101779076671 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Load Customer',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:::',
  p_page_id=>22,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>1739051190534354949 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524308101779076671 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Load Customer',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:::',
  p_page_id=>23,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>1739057902597354960 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524308101779076671 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Load Customer',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::',
  p_page_id=>24,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>4168835840438614936 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524252604764718025 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Help',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:15:&SESSION.',
  p_page_id=>15,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_menu_option (
  p_id=>4168840337256722159 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>993463657937860282 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Preferences',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::',
  p_page_id=>18,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>4168866216426088947 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524252604764718025 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Reports',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:26:&SESSION.',
  p_page_id=>26,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>4168870542226164791 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>4168866216426088947 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Sales by Product',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:27:&SESSION.',
  p_page_id=>27,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>4168891919287871234 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>4168866216426088947 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Tags',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:28:&SESSION.',
  p_page_id=>28,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>4169749321000485938 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524252604764718025 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Search Results',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:30:&SESSION.',
  p_page_id=>30,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>4170127239186166624 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>4168866216426088947 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Sales by State',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:31:&SESSION.',
  p_page_id=>31,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7524252604764718025 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Home',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_page_id=>1,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7524308101779076671 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524252604764718025 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Customers',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::',
  p_page_id=>2,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7524312921650091876 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524308101779076671 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Customer Details',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::',
  p_page_id=>7,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7524634304398966911 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524252604764718025 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Products',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::',
  p_page_id=>3,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7524634610631968741 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524634304398966911 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Product Details',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::',
  p_page_id=>6,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_menu_option (
  p_id=>7524752792493304053 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524252604764718025 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Orders',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::',
  p_page_id=>4,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7525360991950182488 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524752792493304053 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Order Details',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::',
  p_page_id=>29,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7541216814231667395 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524752792493304053 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Enter New Order',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::',
  p_page_id=>11,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7541281410319883851 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524752792493304053 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Enter New Order',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::',
  p_page_id=>12,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7549303695595173216 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524752792493304053 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Order Summary',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::',
  p_page_id=>14,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7552595811263689420 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>4168866216426088947 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Sales by Category / Month',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::',
  p_page_id=>5,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7552598804468696907 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>4168866216426088947 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Sales by Category',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::',
  p_page_id=>16,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7552630205694810840 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>4168866216426088947 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Customer Orders',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:::',
  p_page_id=>17,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7567330495515641704 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>4168866216426088947 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Customer Map',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::',
  p_page_id=>13,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7567338668827769991 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>4168866216426088947 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Product Order Tree',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::',
  p_page_id=>19,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>7829743183190622615 + wwv_flow_api.g_id_offset,
  p_menu_id=>7524248809482709913 + wwv_flow_api.g_id_offset,
  p_parent_id=>7524252604764718025 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Orders',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::',
  p_page_id=>10,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

prompt  ...page templates for application: 107
--
