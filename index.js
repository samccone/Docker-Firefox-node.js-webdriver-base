var webdriver = require("selenium-webdriver");
    SeleniumServer = require('selenium-webdriver/remote').SeleniumServer;

var server = new SeleniumServer("/usr/local/bin/selenium.jar", {
  port: 4444
});

server.start();

var driver = new webdriver.Builder().
                 usingServer(server.address()).
                 withCapabilities(webdriver.Capabilities.firefox()).
                 build();

driver.get('http://www.google.com');
driver.findElement(webdriver.By.name('q')).sendKeys('webdriver');
driver.findElement(webdriver.By.name('btnG')).click();
driver.wait(function() {
 return driver.getTitle().then(function(title) {
   return title === 'webdriver - Google Search';
 });
}, 1000);

driver.quit();