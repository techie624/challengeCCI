const webdriver = require('selenium-webdriver'),
    By = webdriver.By,
    until = webdriver.until;

var assert = require('assert');

const driver = new webdriver.Builder()
    .forBrowser('chrome')
    .build();
driver.get('http://localhost').then(function(){


  driver.findElement(webdriver.By.id('button')).then(function(elem){
    elem.click()
  }).then(function(){
    driver.findElement(webdriver.By.id('text')).getText().then(function(text){
      console.log(text)
    })
  })
})