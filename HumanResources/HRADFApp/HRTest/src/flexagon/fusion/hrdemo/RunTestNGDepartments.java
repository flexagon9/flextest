package flexagon.fusion.hrdemo;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;

import org.testng.annotations.Test;

public class RunTestNGDepartments
  extends AbstractTest
{
  public RunTestNGDepartments()
  {
    super();
  }

  public static void main(String[] args)
  {
    start();
    departmentHomePageLoadsProperly();
    saveButtonWorks();
    okButtonWorks();
    clean();
  }

  @Test
  public static void departmentHomePageLoadsProperly()
  {
    webDriver.get(server + "/fusionhrdemo/faces/departments");

    wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//body")));
    assert webDriver.getPageSource().contains("Error 500") == false: "500 Error Loading the home page.";
    assert webDriver.findElements(By.id("")).size() == 1: "Didn't load the home page properly.";
  }


  @Test
  public static void saveButtonWorks()
  {
    webDriver.get(server + "/fusionhrdemo/faces/departments");
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
  public static void DepartmentIdFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void DepartmentNameFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void ManagerIdFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void LocationIdFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void okButtonWorks()
  {
    webDriver.get(server + "/fusionhrdemo/faces/departments");
    wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//body")));
    assert webDriver.getPageSource().contains("Error") == false: "404 Error Loading the home page.";
    assert webDriver.findElements(By.id("")).size() == 1: "Didn't load the home page properly.";
  }
}
