package flexagon.fusion.hrdemo.model.tests;

import flexagon.fusion.hrdemo.model.appmodules.HRUIAMImpl;
import flexagon.fusion.hrdemo.model.views.DepartmentsDefaultVOImpl;
import flexagon.fusion.hrdemo.model.views.DepartmentsDefaultVORowImpl;
import flexagon.fusion.hrdemo.model.views.EmployeesDefaultVOImpl;
import flexagon.fusion.hrdemo.model.views.EmployeesDefaultVORowImpl;

import oracle.jbo.ApplicationModule;
import oracle.jbo.Key;
import oracle.jbo.Row;
import oracle.jbo.client.Configuration;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class HRUIAMImplTest
{
  public HRUIAMImplTest()
  {
  }

  @Before
  public void setUp()
    throws Exception
  {
  }

  @After
  public void tearDown()
    throws Exception
  {
  }

  /**
   * @see flexagon.fusion.hrdemo.model.appmodules.HRUIAMImpl#getEmployees()
   */
  @Test
  public void testGetEmployees()
  {
    ApplicationModule am = null;

    try
    {
      String amDef = "flexagon.fusion.hrdemo.model.appmodules.HRUIAMImpl";
      String config = "HRUIAMLocal";
      am = Configuration.createRootApplicationModule(amDef, config);
      HRUIAMImpl amhr = (HRUIAMImpl) am;
      EmployeesDefaultVOImpl vo = amhr.getEmployees();
      Row[] row = vo.findByKey(new Key(new Object[] { 100 }), 1);
      assert (row[0].getAttribute(EmployeesDefaultVORowImpl.FIRSTNAME).equals("Steven"));
      assert (row[0].getAttribute(EmployeesDefaultVORowImpl.FIRSTNAME).equals("King"));
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      if (am != null)
        Configuration.releaseRootApplicationModule(am, true);
    }
  }

  /**
   * @see flexagon.fusion.hrdemo.model.appmodules.HRUIAMImpl#getDepartments()
   */
  @Test
  public void testGetDepartments()
  {
    ApplicationModule am = null;

    try
    {
      String amDef = "flexagon.fusion.hrdemo.model.appmodules.HRUIAMImpl";
      String config = "HRUIAMLocal";
      am = Configuration.createRootApplicationModule(amDef, config);
      HRUIAMImpl amhr = (HRUIAMImpl) am;
      DepartmentsDefaultVOImpl vo = amhr.getDepartments();
      Row[] row = vo.findByKey(new Key(new Object[] { 170 }), 1);
      assert (row[0].getAttribute(DepartmentsDefaultVORowImpl.DEPARTMENTNAME).equals("Manufacturing"));
      assert (row[0].getAttribute(DepartmentsDefaultVORowImpl.LOCATIONID) == 1700);
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      if (am != null)
        Configuration.releaseRootApplicationModule(am, true);
    }
  }
}
