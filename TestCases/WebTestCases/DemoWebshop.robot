*** Settings ***
Documentation    To validate Scenarios of the WebShop Shoppping Portal
Library    SeleniumLibrary
Resource    ../../TestCases/Resources/Resourse.robot

*** Variables ***
${URL}  https://demowebshop.tricentis.com/
${Browser}  Chrome
${Exec Path}  ../../Drivers/chromedriver.exe
*** Test Cases ***
Validate Successful Registration
    [Documentation]    This Test is to Validate Successful Registration of the Webshop Portal
#    Set Selenium Speed    0.5 seconds
    [Tags]    REGRESSION
    Open the browser and navigate to webshop url
    Click Link  xpath://a[text()='Register']
    Select Radio Button  Gender  M
    Input Text     FirstName  Michael
    Input Text     id:LastName  Jackson
    Input Text     id:Email  michaeljackson6899@test.com
    Input Password  id:Password  demo@testing
    Input Password  id:ConfirmPassword  demo@testing
    Click Button    id:register-button
    Wait Until Element Is Visible    //div[@class='page registration-result-page']
    Click Button    xpath://input[@class='button-1 register-continue-button' ]
#    Sleep    3 seconds
    Close Browser

Validate Successful Login
    [Documentation]    This Test is to Validate Successful Login of the Webshop Portal
    [Tags]    SMOKE
    Open the browser and navigate to webshop url
    Click Link   xpath://a[text()='Log in']
    Input Text    id:Email  michaeljackson8@test.com
    Input Password    id:Password  demo@testing
    Click Button    xpath://input[@class='button-1 login-button']
    Wait Until Element Is Visible    xpath://div[@class='topic-html-content-title']
    ${actual}=  Get Text    xpath://div[@class='topic-html-content-title']
    Should Be Equal As Strings  ${actual}  Welcome to our store
    Close Browser



