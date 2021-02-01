/*===========================================================================+
 |   Copyright (c) 2001, 2005 Oracle Corporation, Redwood Shores, CA, USA    |
 |                         All rights reserved.                              |
 +===========================================================================+
 |  HISTORY                                                                  |
 +===========================================================================*/
package xxt.oracle.apps.ak.xxperson.webui;

import oracle.apps.fnd.common.VersionInfo;
import oracle.apps.fnd.framework.webui.OAControllerImpl;
import oracle.apps.fnd.framework.webui.OAPageContext;
import oracle.apps.fnd.framework.webui.beans.OAWebBean;
import com.sun.java.util.collections.HashMap;
import oracle.apps.fnd.framework.webui.*;
import oracle.apps.fnd.framework.webui.beans.*;
import oracle.apps.fnd.framework.* ;
import java.io.Serializable;

/**
 * Controller for ...
 */
public class xxPersonMainCO extends OAControllerImpl
{
  public static final String RCS_ID="$Header$";
  public static final boolean RCS_ID_RECORDED =
        VersionInfo.recordClassVersion(RCS_ID, "%packagename%");

  /**
   * Layout and page setup logic for a region.
   * @param pageContext the current OA page context
   * @param webBean the web bean corresponding to the region
   */
  public void processRequest(OAPageContext pageContext, OAWebBean webBean)
  {
    super.processRequest(pageContext, webBean);
  }

  /**
   * Procedure to handle form submissions for form elements in
   * a region.
   * @param pageContext the current OA page context
   * @param webBean the web bean corresponding to the region
   */
  public void processFormRequest(OAPageContext pageContext, OAWebBean webBean)
  {
    super.processFormRequest(pageContext, webBean);
    String actionInMainPersonScreen = pageContext.getParameter(EVENT_PARAM) ;
    String paramPersonId = pageContext.getParameter("paramPersonId");


    if (actionInMainPersonScreen.equals("deletePerson"))
    {
    Serializable paramDelete[]={actionInMainPersonScreen,paramPersonId};
    OAApplicationModule am= pageContext.getApplicationModule(webBean);
    am.invokeMethod("deletePersonMethod", paramDelete) ;
    }

    if (actionInMainPersonScreen.equals("createPerson") || actionInMainPersonScreen.equals("updatePerson") )
    {
//Here we prepare the HashMap object, that cotains name of the parameter and the value of the parameters 
      HashMap phm = new HashMap() ;
      phm.put("xxParamPersonId",paramPersonId );
      phm.put("xxParamActionOnPerson",actionInMainPersonScreen);

      pageContext.setForwardURL(
      "OA.jsp?page=/xxt/oracle/apps/ak/xxperson/webui/managePersonPG"
      , null //not needed as we are retaining menu context
      ,OAWebBeanConstants.KEEP_MENU_CONTEXT
      ,null //not needed as we are retaining menu context
      ,phm //pass the hashMap that contains values for all of the parameters
      ,true //retain AM
      ,OAWebBeanConstants.ADD_BREAD_CRUMB_NO
      ,OAWebBeanConstants.IGNORE_MESSAGES);
    }



    
  }

}
