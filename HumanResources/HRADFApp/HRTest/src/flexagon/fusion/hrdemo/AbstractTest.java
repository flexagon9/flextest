package flexagon.fusion.hrdemo;
//abc
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.WebDriverWait;

import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;

public class AbstractTest
{
  static WebDriver webDriver;
  static Actions action;
  static WebDriverWait wait;
  static String server;

  public AbstractTest()
  {
    super();
  }


  @BeforeTest
  public static void start()
  {
    //server = "http://129.152.148.153"; //test JCS - flexagon21 - this was a trial that we don't have anymore.

    //server = "http://129.144.25.56:7003"; //old iaas - wlsld55
    server = "http://129.152.142.52:7001"; // flexagon21 iaas - wlsld55

    //server = "http://devlnx13.flexagon:7003";//test local from local (this doesn't exist.)
    System.out.println("Testing on server " + server);
    java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(Level.SEVERE);
    webDriver = new HtmlUnitDriver(true);
    //webDriver = new PhantomJSDriver(phantomSettings);
    webDriver.manage().timeouts().implicitlyWait(15, TimeUnit.SECONDS);
    action = new Actions(webDriver);
    wait = new WebDriverWait(webDriver, 10);
  }

  @AfterTest
  public static void clean()
  {
    webDriver.close();
  }
}
