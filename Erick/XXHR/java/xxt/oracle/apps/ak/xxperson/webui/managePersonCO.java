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
import java.io.Serializable;
import oracle.apps.fnd.framework.*;
import oracle.apps.fnd.framework.webui.*;
import oracle.apps.fnd.framework.OAException;

/**
 * Controller for ...
 */
public class managePersonCO extends OAControllerImpl
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
    String paramPersonAction=pageContext.getParameter("xxParamActionOnPerson");
    String paramPersonId=pageContext.getParameter("xxParamPersonId");
    OAApplicationModule personam = pageContext.getApplicationModule(webBean);
    Serializable personParamList[]= {paramPersonAction,paramPersonId};

    if ( paramPersonAction!=null && paramPersonAction.equals("createPerson"))
    {
      personam.invokeMethod("createPersonMethod", personParamList);
    }

    if ( paramPersonAction!=null && paramPersonAction.equals("updatePerson"))
    {
      personam.invokeMethod("updatePersonMethod", personParamList);
    }

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

    OAApplicationModule personam = pageContext.getApplicationModule(webBean);

    if ( pageContext.getParameter("savePerson") != null )
    {

      personam.invokeMethod("savePersonToDatabase") ;

      pageContext.setForwardURL(
      "OA.jsp?page=/oracle/apps/ak/xxperson/webui/xxPersonMainPG"
      , null //not needed as we are retaining menu context
      ,OAWebBeanConstants.KEEP_MENU_CONTEXT
      , null //not needed as we are retaining menu context
      ,null // no parameters are needed
      ,true //retain AM
      ,OAWebBeanConstants.ADD_BREAD_CRUMB_NO
      ,OAWebBeanConstants.IGNORE_MESSAGES);

    }
  }

}
