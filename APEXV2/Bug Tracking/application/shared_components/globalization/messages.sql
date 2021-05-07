prompt --application/shared_components/globalization/messages
begin
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2368098428373812832)
,p_name=>'1_DAY_LEFT'
,p_message_text=>'1 Day Left'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4453785536799935556)
,p_name=>'ABOUT_THIS_APPLICATION'
,p_message_text=>'About this Application'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2575418150943259150)
,p_name=>'ABOUT_TO_CREATE'
,p_message_text=>'Please confirm adding the following %0 <strong>%1</strong> user(s) to your access control list.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2620008730476508249)
,p_name=>'ABOUT_TO_CREATE_WITH_INVALIDS'
,p_message_text=>'Please confirm adding the following %0 <strong>%1</strong> user(s) to your access control list. Note that %2 string(s) were invalid usernames.'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4386900955023944696)
,p_name=>'ACCESS_CONTROL_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>When Access Control is enabled, Administrators have the ability to restrict access to certain application features, for authenticated users. Bug Tracker supports the following 3 access levels; Reader, Contributor and Administrator.  <strong>Reader'
||'s</strong> have read-only access and can also view reports.',
'  <strong>Contributors</strong> can create, edit, delete and view reports.  <strong>Administrators</strong>, in addition to Contributor''s capability, can also perform Bug Tracker administration, including configuration of access control, exporting, a'
||'nd installing or uninstalling sample data.</p> ',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1421387544816137320)
,p_name=>'ACCESS_CONTROL_IS_DISABLED'
,p_message_text=>'Access control is disabled for this application.  Please enable before using in a production capacity.'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4380132536638086411)
,p_name=>'ACL_CONFIGURATION_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><strong>Enabling Access Control</strong> allows the application and its features to be controlled by the <strong>Access Control List</strong>, as defined by the application administrator. This application has 3 access levels available that can be '
||'granted to a user; Administrator, Contributor and Reader. Please see the Manage Access Control List page for further details on what each level provides.</p>',
'',
'<p>In addition, if you want to make every authenticated user a ''Reader'' of your application, you can select Reader access for any authenticated user from the Access Control Scope configuration option. Similarly, selecting Contributor access for any a'
||'uthenticated user will provide contributor access to any user who can authenticate into your application.</p>',
'',
'<br>',
'<p><b>Disabling Access Control</b> means that access to the application and all of its features including Administration are open to any user who can authenticate to the application.</p>',
'<br>',
'<p>Note: Irrespective of whether Access Control is enabled or disabled, a user still has to authenticate successfully into the application.</p>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2719847430687814187)
,p_name=>'ACL_DISABLED'
,p_message_text=>'<p>All users are currently <strong>Administrators</strong>. Please enable Access Control to restrict user access to this application.</p>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2719847235000812157)
,p_name=>'ACL_ENABLED'
,p_message_text=>'<p>Only users defined in the Access Control List have access to this application.</p>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2719847038235810701)
,p_name=>'ACL_PUBLIC_CONTRIBUTE'
,p_message_text=>'<p>All authenticated users have <strong>Reader</strong> and <strong>Contributor</strong> access.</p><p>Administrators are restricted by the Access Control List.</p>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2719846841901808944)
,p_name=>'ACL_PUBLIC_READONLY'
,p_message_text=>'<p>All authenticated users have <strong>Reader</strong> access.</p><p>Contributors and Administrators are restricted by the Access Control List.</p>'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4453784828834933267)
,p_name=>'ADDITIONAL_INFORMATION'
,p_message_text=>'Additional Information'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4401457038562749762)
,p_name=>'ADMINISTRATION'
,p_message_text=>'Administration'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2575418645120261915)
,p_name=>'ALREADY_IN_ACL'
,p_message_text=>'User is already in Access Control List'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2719846647293806530)
,p_name=>'ANY_AUTHENTICATED_USER'
,p_message_text=>'Any Authenticated User'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(6366571679567630388)
,p_name=>'APP_NOT_ASSIGNED_TEXT'
,p_message_language=>'en-us'
,p_message_text=>'Not Assigned'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2720298655688168996)
,p_name=>'AUTHENTICATION_REQUIRED_PAGES'
,p_message_text=>'Login Required Pages'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2575419632396267819)
,p_name=>'BAU_EMAIL_INSTRUCTIONS'
,p_message_text=>'Enter or copy and paste email addresses separated by commas, semicolons, or new lines. Note that if you copy and paste email addresses from email messages, extraneous text will be filtered out. All email users provided will be added as the selected r'
||'ole. Existing or duplicate email addresses will be ignored.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2575419829593269056)
,p_name=>'BAU_STRING_INSTRUCTIONS'
,p_message_text=>'Enter or copy and paste usernames separated by commas, semicolons, or whitespace. All usernames provided will be added as the selected role. Existing or duplicate usernames will be ignored.'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(6323654603948388381)
,p_name=>'CHANGE_LOG_MESSAGE'
,p_message_language=>'en-us'
,p_message_text=>'Cannot Update or Delete the System generated change log information.'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2368100242810821357)
,p_name=>'DAYS_LEFT'
,p_message_text=>'%0 days left'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2368099950142817946)
,p_name=>'DAYS_OVERDUE'
,p_message_text=>'%0 days overdue'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2575418841885263342)
,p_name=>'DUPLICATE_USER'
,p_message_text=>'Duplicate user in list'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2700690033879452328)
,p_name=>'EMAIL_USERNAME_FORMAT_MSG'
,p_message_text=>'This application is currently using an <strong>email address</strong> username format (e.g. xyz@xyz.com). <a href="f?p=%0:%1:%2:">Change Username Format</a>'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4453785031258933944)
,p_name=>'FEATURES'
,p_message_text=>'Features'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4453785234375934807)
,p_name=>'GETTING_STARTED'
,p_message_text=>'Getting Started'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(3673991837042164943)
,p_name=>'HELP'
,p_message_text=>'Help'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2624255139693470745)
,p_name=>'HELP_ABOUT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="aboutApp">',
'<h2>About this Application</h2>',
'<p>',
'	The Bug Tracker application is an easy-to-use Web-accessible method to enter and track bugs against various projects.',
'</p>',
'<p>',
'	You can enter bugs along with a variety of information, including associated project, severity, status and who the bug has been assigned to, along with a number of attributes about the problem. You can easily view when a bug was created and last upd'
||'ated, along with a free form description of the bug.',
'</p>',
'<p>',
'	You can customize the values for standard attributes, insuring that your Bug Tracker application will fit your particular needs. An administrator can specify products and their versions, categories, and codes for status, priority and severity.',
'</p>',
'<p>',
'	Bug Tracker gives all users an easy way to view bugs, based on a variety of selection filters.',
'</p>',
'</div>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2624255557796477547)
,p_name=>'HELP_FEATURES'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Features</h2>',
'<ul>',
'	<li>Track and Analyze Software Bugs</li>',
'	<li>Flexible and changeable status codes</li>',
'	<li>Robust Reporting</li>',
'	<li>Link, Note, and File Attachments</li>',
'	<li>Mobile Interface</li>',
'	<li>Flexible Access Control (reader, contributor, administrator model)</li>',
'	<li>Timezone Support</li>',
'</ul>',
'</div>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2624255331713474465)
,p_name=>'HELP_GETTING_STARTED'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Getting Started</h2>',
'<p>',
'	1. Creating a product',
'</p>',
'<ul>',
'	<li>Click on gear (Adminstration) icon</li>',
'	<li>Click on Products, then click on Create Product</li>',
'	<li>Enter a product name and click on Create Product</li>',
'	<li>In the menu on the right side, click on Product Versions</li>',
'	<li>Click on Create Product Version</li>',
'	<li>Enter the version information for the product you just created</li>',
'</ul>',
'<br/>',
'<p>',
'	2. Create a bug',
'</p>',
'<ul>',
'	<li>Return to the Home page of the application</li>',
'	<li>Click on the Bugs tab</li>',
'	<li>Click on the Create Bug button </li>',
'	<li>Create a bug for your product, including the version where the bug was found and the version when the bug should be fixed</li>',
'</ul>',
'</div>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2624254653279464467)
,p_name=>'HELP_SIDEBAR'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h1 class="appNameHeader">',
'    <img src="%0f_spacer.gif" class="appIcon %1" alt="" />',
'    %2',
'</h1>',
'<ul class="vapList">',
'    <li>',
'        <span class="vLabel">App Version</span>',
'        <span class="vValue">%3</span>',
'    </li>',
'    <li>',
'        <span class="vLabel">Pages</span>',
'        <span class="vValue">%4</span>',
'    </li>',
'    <li>',
'        <span class="vLabel">Vendor</span>',
'        <span class="vValue">%5 </span>',
'    </li>',
'</ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2624254948319466683)
,p_name=>'HELP_SUPPORT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Additional Information</h2>',
'<p>If you have questions, ask them on the <a href="%0" target="_blank">%1</a>.',
'</p>',
'</div>'))
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2575418447924260592)
,p_name=>'INVALID_USERS_NOT_CREATED'
,p_message_text=>'Note that %0 string(s) were invalid usernames.'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10394560783728427328)
,p_name=>'MESSAGE_101'
,p_message_language=>'en-us'
,p_message_text=>'Click for Popup'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10412922903534288149)
,p_name=>'MESSAGE_102'
,p_message_language=>'en-us'
,p_message_text=>'Assigned to user'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10412924780116290765)
,p_name=>'MESSAGE_103'
,p_message_language=>'en-us'
,p_message_text=>'Assigned to group '
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10418121608635463085)
,p_name=>'MESSAGE_104'
,p_message_language=>'en-us'
,p_message_text=>'Cleared Assigned to Information.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10446234095178470761)
,p_name=>'MESSAGE_105'
,p_message_language=>'en-us'
,p_message_text=>'Bug #%0 is assigned to your login (%1) with priority %2.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10446246282196504885)
,p_name=>'MESSAGE_106'
,p_message_language=>'en-us'
,p_message_text=>'Bug #%0'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10446251398387528477)
,p_name=>'MESSAGE_107'
,p_message_language=>'en-us'
,p_message_text=>'Bug #%0 which is assigned to you (%1) has been moved to higher priority %2 from %3.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10446252204620530223)
,p_name=>'MESSAGE_108'
,p_message_language=>'en-us'
,p_message_text=>'Bug #%0 which is assigned to you (%1) has been moved to lower priority %2 from %3.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10506324399291279510)
,p_name=>'MESSAGE_109'
,p_message_language=>'en-us'
,p_message_text=>'Fixed issue in version #[%0] build #[%1].'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10536408190532700002)
,p_name=>'MESSAGE_110'
,p_message_language=>'en-us'
,p_message_text=>'Issue failed testing, need to be reworked.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10546350296877027971)
,p_name=>'MESSAGE_111'
,p_message_language=>'en-us'
,p_message_text=>'Bug is Closed.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10546353608305031234)
,p_name=>'MESSAGE_112'
,p_message_language=>'en-us'
,p_message_text=>'Bug is Reopened.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10600524783840912354)
,p_name=>'MESSAGE_113'
,p_message_language=>'en-us'
,p_message_text=>'The status of the bug %0 is changed to %1. {Business rule}'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10600638189615055954)
,p_name=>'MESSAGE_114'
,p_message_language=>'en-us'
,p_message_text=>'Status of the bug #%0 changed from %1 to %2.{Business rule}'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10600684890748113110)
,p_name=>'MESSAGE_115'
,p_message_language=>'en-us'
,p_message_text=>'Bug #%0 is assigned to your login (%1) with priority %2.{Business Rule}'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10603207708426687287)
,p_name=>'MESSAGE_116'
,p_message_language=>'en-us'
,p_message_text=>'Bug #%0 status changed.(Business Rule)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10603545782547436776)
,p_name=>'MESSAGE_117'
,p_message_language=>'en-us'
,p_message_text=>'Sent Email Notification on Status Change. {Business Rule}'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10603659595724592028)
,p_name=>'MESSAGE_118'
,p_message_language=>'en-us'
,p_message_text=>'Changed status from %0 to %1. {Business Rule}'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10603754995611733871)
,p_name=>'MESSAGE_119'
,p_message_language=>'en-us'
,p_message_text=>'Assigned to user. {Business Rule}'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10603757508425737594)
,p_name=>'MESSAGE_120'
,p_message_language=>'en-us'
,p_message_text=>'Assigned to Group. {Business Rule}'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10849944704352147252)
,p_name=>'MESSAGE_121'
,p_message_language=>'en-us'
,p_message_text=>'Your password has been reset and the new password is %0.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10849955976956186573)
,p_name=>'MESSAGE_122'
,p_message_language=>'en-us'
,p_message_text=>'Your Account Information'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(9599312550671855155)
,p_name=>'MESSAGE_123'
,p_message_language=>'en-us'
,p_message_text=>'Product'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(9599312958983857542)
,p_name=>'MESSAGE_124'
,p_message_language=>'en-us'
,p_message_text=>'Total'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(9599871454637774380)
,p_name=>'MESSAGE_125'
,p_message_language=>'en-us'
,p_message_text=>'Version'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(9599885054562868986)
,p_name=>'MESSAGE_126'
,p_message_language=>'en-us'
,p_message_text=>'Category'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(8048288415560778478)
,p_name=>'MESSAGE_127'
,p_message_language=>'en-us'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Dear %0 ',
'Following is the Username and Password for your account at Bug Tracker.',
'',
'Your Username:%1',
'Password:%2',
'',
'Thank You',
'Bug Tracker',
'- Administrator.'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(8048297101539812332)
,p_name=>'MESSAGE_128'
,p_message_language=>'en-us'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Dear %0  ',
'Your password is reset. ',
'Your Username:%1 ',
'Password:%2 ',
'',
'Thank You ',
'Bug Tracker ',
'- Administrator.'))
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2575419237141265540)
,p_name=>'MISSING_AT_SIGN'
,p_message_text=>'Missing @ sign'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2575419435200266526)
,p_name=>'MISSING_DOT'
,p_message_text=>'Missing dot'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4401456540162740785)
,p_name=>'MOBILE'
,p_message_text=>'Mobile'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2427963142644642878)
,p_name=>'N_DAY'
,p_message_text=>'%0 day'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2427963341350643566)
,p_name=>'N_DAYS'
,p_message_text=>'%0 days'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2427962746094641286)
,p_name=>'N_HOUR'
,p_message_text=>'%0 hour'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2427962944585641995)
,p_name=>'N_HOURS'
,p_message_text=>'%0 hours'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2427962548251640325)
,p_name=>'N_MINUTES'
,p_message_text=>'%0 minutes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2439926249304650437)
,p_name=>'N_MONTHS'
,p_message_text=>'%0 months'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2427963539840644198)
,p_name=>'N_WEEK'
,p_message_text=>'%0 week'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2427963738546644778)
,p_name=>'N_WEEKS'
,p_message_text=>'%0 weeks'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2427963957512651231)
,p_name=>'N_YEAR'
,p_message_text=>'%0 year'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2720299049434171971)
,p_name=>'PAGES_WITH_CUSTOM_AUTH'
,p_message_text=>'Authorization Protected'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2720298852884170376)
,p_name=>'PUBLIC_PAGES'
,p_message_text=>'Public Pages'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2700689837761450459)
,p_name=>'STRING_USERNAME_FORMAT_MSG'
,p_message_text=>'This application is currently using a <strong>non-email address</strong> username format (e.g. JOHNDOE). <a href="f?p=%0:%1:%2:">Change Username Format</a>'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2368099556612814905)
,p_name=>'TODAY'
,p_message_text=>'Today'
);
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(2575419039729264404)
,p_name=>'USERNAME_TOO_LONG'
,p_message_text=>'Username too long'
);
null;
end;
/
