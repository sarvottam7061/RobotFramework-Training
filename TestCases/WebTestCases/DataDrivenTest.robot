*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library           String
Library     DataDriver      file=../../TestCases/Resources/data.xlsx    sheet_name=Sheet1
Test Setup      Open the browser and navigate to webshop url
Test Teardown   Close Browser session
Resource    ../../TestCases/Resources/Resourse.robot
Test Template    Validate Invalid Login

*** Variables ***
${default_user}    michaeljackson100@test.com
${default_pass}    demo@test



*** Test Cases ***
Login with user ${username} and password ${password}     ${default_user}    ${default_pass}



*** Keywords ***
Validate Invalid Login
    [Documentation]    This Test is to Validate Successful Login of the Webshop Portal
    [Tags]    REGRESSION
    [Arguments]    ${username}    ${password}
    Click on login to open the login link
    Enter your emailid and password in textbox  ${username}   ${password}
    Now click on LogIn button to login
    This will wait for successful login and close the browser  ${Error Login Message}  ${Fail expected}

Validate Successful Login
    [Documentation]    This Test is to Validate Successful Login of the Webshop Portal
    [Tags]    REGRESSION
    [Arguments]    ${username}    ${password}
    Click on login to open the login link
    Enter your emailid and password in textbox  ${username}   ${password}
    Now click on LogIn button to login
    This will wait for successful login and close the browser    ${Success Login Message}  ${Pass expected}