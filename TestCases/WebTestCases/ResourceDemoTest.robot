*** Settings ***
Documentation    To validate Scenarios of the WebShop Shoppping Portal
Library    SeleniumLibrary
Resource      ../../TestCases/Resources/Resourse.robot

Test Setup    Open the browser and navigate to webshop url
Test Teardown        Close Browser

*** Variables ***
${expected}  Welcome to our store
${Success Login Message}  xpath://div[@class='topic-html-content-title']
${Valid Password}  demo@testing
${Invalid Password}  demo#test
${Login Id}  michaeljackson5@test.com
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
    Enter your emailid and valid password in textbox
    Now click on LogIn button to login
    This will wait for successful login and close the browser
Validate Invalid Login
    [Documentation]    This Test is to Validate Successful Login of the Webshop Portal
    [Tags]   smoke
    Click on login to open the login link
    Enter your emailid and invalid password in textbox
    Now click on LogIn button to login
    This will wait for successful login and close the browser





*** Keywords ***

Enter your password and confirm password
    Input Password  id:Password  ${Valid Password}
    Input Password  id:ConfirmPassword  ${Valid Password}
Enter your emailid and valid password in textbox
    Input Text    id:Email  ${Login Id}
    Input Password    id:Password   ${Valid Password}
Enter your emailid and invalid password in textbox
    Input Text    id:Email  ${Login Id}
    Input Password    id:Password  ${Invalid Password}
This will wait for successful login and close the browser
    Wait Until Element Is Visible    ${Success Login Message}
#    ${actual}=  Get Text    ${Success Login Message}
#    Should Be Equal As Strings  ${actual}  ${expected}
    Element Text Should Be  ${Success Login Message}    ${expected}




