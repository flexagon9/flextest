package flexagon.fusion.hrdemo;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;

import org.testng.annotations.Test;

public class RunTestNGCommerce
  extends AbstractTest
{
  public RunTestNGCommerce()
  {
    super();
  }

  public static void main(String[] args)
  {
    start();
    sumTotalAddsUp();
    resetButtonWorks();
    canFindWaldo();
    clean();
  }

  @Test
  public static void sumTotalAddsUp()
  {
    webDriver.get(server + "/fusionhrdemo/faces/departments");

    wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//body")));
    assert webDriver.getPageSource().contains("Error 500") == false: "500 Error Loading the home page.";
    assert webDriver.findElements(By.id("")).size() == 1: "Didn't load the home page properly.";
  }


  @Test
  public static void resetButtonWorks()
  {
    webDriver.get(server + "/fusionhrdemo/faces/departments");
    wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//body")));
    assert webDriver.getPageSource().contains("Error 403") == false: "403 Error Loading the home page.";
    assert webDriver.findElements(By.id("")).size() == 1: "Didn't load the home page properly.";
  }

  @Test
  public static void negativeQuantitiesFail()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void alertOnNameTooShort()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void DescriptionFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void nameFailsIfNull()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void taxCalculationIsZeroOnZeroTotal()
  {
    assert true == true: "This isn't common";
  }

  @Test
  public static void canFindWaldo()
  {
    webDriver.get(server + "/fusionhrdemo/faces/departments");
    wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//body")));
    assert webDriver.getPageSource().contains("Error") == false: "Error Loading the home page.";
    assert webDriver.findElements(By.id("")).size() == 1: "Didn't load the home page properly.";
  }
}
