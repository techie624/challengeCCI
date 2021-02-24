const webdriver = require('selenium-webdriver'),
    By = webdriver.By,
    until = webdriver.until;

const driver = new webdriver.Builder()
    .forBrowser('chrome')
    .build();
driver.get('http://localhost').then(function(){


driver.findElement(webdriver.By.id('button')).sendKeys('webdriver\n').then(function(elem){
  elem.click()
}).then(function(){
  driver.findElement(webdriver.By.id('text')).then(function(text){
    expect(false)
  })
})