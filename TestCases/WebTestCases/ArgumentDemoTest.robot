*** Settings ***
Documentation    To validate Scenarios of the WebShop Shoppping Portal
Library    SeleniumLibrary
Resource      ../../TestCases/Resources/Resourse.robot
Test Setup    Open the browser and navigate to webshop url
Test Teardown        Close Browser

*** Variables ***
${Pass expected}  Welcome to our store
${Fail expected}  Login was unsuccessful. Please correct the errors and try again.
${Error expected}   Login was unsuccessful. Please correct the errors and try again.
${Success Login Message}  xpath://div[@class='topic-html-content-title']
${Error Login Message}    xpath://span[text()='Login was unsuccessful. Please correct the errors and try again.']

*** Test Cases ***
Validate Successful Registration
    [Tags]    sanity
    [Documentation]    This Test is to Validate Successful Registration of the Webshop Portal
    Click on register to open the registration link
    Select the gender either amle or female
    Enter your firstname, lastname, emailid in textbox
    Enter your password and confirm password
    Now Click on register button to submit the form
    This will wait for successful registration and close the browser

Validate Successful Login
    [Documentation]    This Test is to Validate Successful Login of the Webshop Portal
    [Tags]   smoke
    Click on login to open the login link
    Enter your emailid and password in textbox  ${Login Id}  ${Valid Password}
    Now click on LogIn button to login
    This will wait for successful login and close the browser    ${Success Login Message}  ${Pass expected}
Failed Invalid Login
    [Documentation]    This Test is to Validate Successful Login of the Webshop Portal
    [Tags]   smoke
    Click on login to open the login link
    Enter your emailid and password in textbox  ${Login Id}   ${Invalid Password}
    Now click on LogIn button to login
    This will wait for successful login and close the browser  ${Error Login Message}
Validate Invalid Login
    [Documentation]    This Test is to Validate Successful Login of the Webshop Portal
    [Tags]   smoke
    Click on login to open the login link
    Enter your emailid and password in textbox  ${Login Id}   ${Invalid Password}
    Now click on LogIn button to login
    This will wait for successful login and close the browser  ${Error Login Message}  ${Fail expected}





*** Keywords ***

Enter your password and confirm password
    Input Password  id:Password  ${Valid Password}
    Input Password  id:ConfirmPassword  ${Valid Password}


Enter your emailid and password in textbox
    [Arguments]    ${username}  ${password}
    Input Text    id:Email  ${username}
    Input Password    id:Password   ${password}



This will wait for successful login and close the browser
    [Arguments]    ${Login message}  ${expected}
    Wait Until Element Is Visible    ${Login message}
    Element Text Should Be  ${Login message}    ${expected}




