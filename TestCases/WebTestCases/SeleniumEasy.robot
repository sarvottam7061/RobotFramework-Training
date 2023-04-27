*** Settings ***
Library    SeleniumLibrary
Documentation    Testing Addition of two numbers

*** Variables ***
${Browser}    Chrome
${URL}    https://www.demo.seleniumeasy.com/test/basic-first-form-demo.html
${executable_path}    ../../Drivers/chromedriver.exe
${popupclose}    xpath://*[@id="at-cv-lightbox-button-holder"]/a[2]
${assertion}    id:displayvalue



*** Test Cases ***
Testing Input field and button
#    [Tags]    REGRESSION
    OPEN BROWSER   ${URL}   ${Browser}       executable_path=${executable_path}
    maximize browser window
    set selenium implicit wait    5 seconds
    wait until page contains element    ${popupclose}
    click element    ${popupclose}
    input text    id:sum1    5
    input text    id:sum2    6
    click button    xpath://button[text()='Get Total']
    element text should be    ${assertion}    11