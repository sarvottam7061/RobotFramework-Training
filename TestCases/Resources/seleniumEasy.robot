*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              imported selenium library

Library    SeleniumLibrary

*** Variables ***

${URL}  http://demo.seleniumeasy.com/input-form-demo.html
${Browser}  Chrome
${Exec Path}  ../../Drivers/chromedriver.exe


*** Keywords ***
Open the browser and navigate to SeleniumEasy url
    Set Selenium Speed    0.5 seconds
    Open Browser    ${URL}  ${Browser}  executable_path=${Exec Path}
    maximize browser window

Close Browser session
    Close Browser
Fill the form and Submit
    input text    name:first_name    Priyanka
    input text    name:last_name    Singh
    input text    name:email         priyankasingh@test.com
    input text    name:phone      9865430732
    input text    name:address    Los Angeles
    input text    name:city        California
    select from list by label    name:state    California
    input text    name:zip    4638
    input text    name:website    Testingtraining.com
    input text    name:comment  xfoscglsgclGLvzkvkcvalsvlgllaslvxlcvlavlal
    click button    xpath://*[@class="btn btn-default"]

