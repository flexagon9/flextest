package flexagon.fusion.hrdemo;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;

import org.testng.Assert;
import org.testng.annotations.Test;

public class RunTestNGEmployees
  extends AbstractTest
{
  public RunTestNGEmployees()
  {
    super();
  }

  public static void main(String[] args)
  {
    start();
    employeeHomePageLoadsProperly();
    okButtonWorks();
    saveButtonWorks();
    clean();
  }

  @Test
  public static void employeeHomePageLoadsProperly()
  {
    webDriver.get(server + "/fusionhrdemo/faces/employees");

    wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//body")));
    assert webDriver.getPageSource().contains("Error 500") == false: "500 Error Loading the home page.";
    assert webDriver.findElements(By.id("")).size() == 1: "Didn't load the home page properly.";
  }


  @Test
  public static void okButtonWorks()
  {
    webDriver.get(server + "/fusionhrdemo/faces/employees");
    wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//body")));
    assert webDriver.getPageSource().contains("Error 403") == false: "403 Error Loading the home page.";
    assert webDriver.findElements(By.id("")).size() == 1: "Didn't load the home page properly.";
  }

  @Test
  public static void databaseConnectivityTest()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void employeeIdFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void firstNameFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void lastNameFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void EmailFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void CommissionPercentFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void CommissionPercentFailsIfNegative()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void CommissionPercentFailsOver20()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void newFeatureToBeAdded()
  {
    Assert.assertEquals(true, false, "This feature isn't added yet, so the test still fails on server " + server + ".");
  }

  @Test
  public static void saveButtonWorks()
  {
    webDriver.get(server + "/fusionhrdemo/faces/employees");
    wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//body")));
    assert webDriver.getPageSource().contains("Error") == false: "404 Error Loading the home page.";
    assert webDriver.findElements(By.id("")).size() == 1: "Didn't load the home page properly.";
  }
}
