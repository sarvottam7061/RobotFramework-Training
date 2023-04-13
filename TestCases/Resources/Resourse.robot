*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              imported selenium library

Library    SeleniumLibrary

*** Variables ***
${Register Link}  xpath://a[text()='Register']
${Login Link}     xpath://a[text()='Log in']
${URL}  https://demowebshop.tricentis.com/
${Browser}  Chrome
${Exec Path}  ../../Drivers/chromedriver.exe
${Email id}  michaeljackson14@test.com
${Valid Password}  demo@testing
${Invalid Password}  demo#test
${Login Id}  michaeljackson5@test.com

*** Keywords ***
Open the browser and navigate to webshop url
    Set Selenium Speed    0.5 seconds
    Open Browser    ${URL}  ${Browser}  executable_path=${Exec Path}
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
Now click on LogIn button to login
    Click Button    xpath://input[@class='button-1 login-button']
