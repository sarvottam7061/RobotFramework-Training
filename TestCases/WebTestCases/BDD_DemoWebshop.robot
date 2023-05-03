*** Settings ***
Documentation    To validate Scenarios of the WebShop Shoppping Portal
Library    SeleniumLibrary
Resource    ../../TestCases/Resources/Resourse.robot

*** Variables ***
${URL}  https://demowebshop.tricentis.com/
${Browser}  Chrome
${Exec Path}  ../../Drivers/chromedriver.exe
${Register Link}  xpath://a[text()='Register']
${expected}  Welcome to our store
${Success Login Message}  xpath://div[@class='topic-html-content-title']

*** Test Cases ***
Validate Successful Registration
    [Documentation]    This Test is to Validate Successful Registration of the Webshop Portal
    [Tags]    SMOKE
    Open the browser and navigate to webshop url
    Click on register to open the registration link
    Select the gender either male or female
    Enter your firstname, lastname, emailid in textbox
    Enter your password and confirm password
    Now Click on register button to submit the form
    This will wait for successful registration and close the browser

Validate Successful Login
    [Documentation]    This Test is to Validate Successful Login of the Webshop Portal
    [Tags]   REGRESSION
    Open the browser and navigate to webshop url
    Click on register to open the login link
    Enter your emailid and password in textbox
    Now click on LogIn button to login
    This will wait for successful login and close the browser

*** Keywords ***
#Open the browser and navigate to webshop url
#    Set Selenium Speed    0.5 seconds
#    Open Browser    ${URL}  ${Browser}  executable_path=${Exec Path}
Click on register to open the registration link
    Click Link  ${Register Link}
Select the gender either male or female
    Select Radio Button  Gender  M
Enter your firstname, lastname, emailid in textbox
    Input Text     id:FirstName  Michael
    Input Text     id:LastName  Jackson
    Input Text     id:Email  michaeljackson65649@test.com
Enter your password and confirm password
    Input Password  id:Password  demo@testing
    Input Password  id:ConfirmPassword  demo@testing
Now Click on register button to submit the form
    Click Button    id:register-button
This will wait for successful registration and close the browser
    Wait Until Element Is Visible    //div[@class='page registration-result-page']
    Click Button    xpath://input[@class='button-1 register-continue-button' ]
#    Sleep    3 seconds
    Close Browser
Click on register to open the login link
    Click Link  xpath://a[text()='Log in']
Enter your emailid and password in textbox
    Input Text    id:Email  michaeljackson5@test.com
    Input Password    id:Password  demo@testing
Now click on LogIn button to login
    Click Button    xpath://input[@class='button-1 login-button']
This will wait for successful login and close the browser
    Wait Until Element Is Visible    ${Success Login Message}
#    ${actual}=  Get Text    ${Success Login Message}
#    Should Be Equal As Strings  ${actual}  ${expected}
    Element Text Should Be  ${Success Login Message}    ${expected}
    Close Browser

