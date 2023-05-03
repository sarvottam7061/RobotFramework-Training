*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              imported selenium library

Library    SeleniumLibrary

*** Variables ***
${Register Link}  xpath://a[text()='Register']
${Login Link}     xpath://a[text()='Log in']
${URL}  https://demowebshop.tricentis.com/
${Browser}  Chrome
#${Exec Path}    ../../Drivers/chromedriver.exe
#${Exec Path}    ../../Drivers/msedgedriver.exe
${Email id}  michaeljackson9800@test.com
${Valid Password}  demo@testing
${Invalid Password}  demo#test
${Login Id}  michaeljackson5@test.com

${Pass expected}  Welcome to our store
${Fail expected}  Login was unsuccessful. Please correct the errors and try again.
${Error expected}   Login was unsuccessful. Please correct the errors and try again.
${Success Login Message}  xpath://div[@class='topic-html-content-title']
${Error Login Message}    xpath://span[text()='Login was unsuccessful. Please correct the errors and try again.']
*** Keywords ***
Open the browser and navigate to webshop url
#    Set Selenium Speed    0.5 seconds
#    Open Browser    ${URL}  ${Browser}  executable_path=${Exec Path}
    Open Browser    ${URL}  ${Browser}
    maximize browser window
Close Browser session
    Close Browser
Click on register to open the registration link
    Click Link  ${Register Link}
Select the gender either amle or female
    Select Radio Button  Gender  M
Enter your firstname, lastname, emailid in textbox
    Input Text     id:FirstName  Michael
    Input Text     id:LastName  Jackson
    Input Text     id:Email  ${Email id}
Now Click on register button to submit the form
    Click Button    id:register-button
This will wait for successful registration and close the browser
    Wait Until Element Is Visible    //div[@class='page registration-result-page']
    Click Button    xpath://input[@class='button-1 register-continue-button' ]
#    Sleep    3 seconds
Click on login to open the login link
    Click Link   ${Login Link}
Enter your emailid and password in textbox
    [Arguments]    ${username}    ${password}
    Input Text    id:Email  ${username}
    Input Password    id:Password  ${password}
Now click on LogIn button to login
    Click Button    xpath://input[@class='button-1 login-button']

This will wait for successful login and close the browser
    [Arguments]    ${Login message}  ${expected}
    Wait Until Element Is Visible    ${Login message}
    Element Text Should Be  ${Login message}    ${expected}

