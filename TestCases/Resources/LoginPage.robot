*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           String
Library     Collections


*** Variables ***
${user_name}             rahulshettyacademy
${invalid_password}      123445
${valid_password}        learning
${url}                   https://rahulshettyacademy.com/loginpagePractise/
${browser_name}          Chrome
${Exec Path}  ../../Drivers/chromedriver.exe

*** Keywords ***
open the browser with the url
    Open Browser    ${url}  ${browser_name}   executable_path=${Exec Path}
    maximize browser window
    set selenium speed    0.5 seconds
Close Browser session
    Close Browser

Fill the Login Details and Login Form
    Input Text          id:username     rahulshettyacademy
    Input Password      id:password     learning
    Click Element       css:input[value='user']
    Wait Until Element Is Visible       css:.modal-body
    Click Button        id:okayBtn
    Wait Until Element Is Not Visible   css:.modal-body
    Select From List By Value       css:select.form-control       teach
    Select Checkbox     terms
    Checkbox Should Be Selected     terms


Select the link of Child window
    click element       css:.blinkingText
    Sleep               5

Verify the user is Switched to Child window
    switch window       NEW
    Element Text Should Be       css:h1     DOCUMENTS REQUEST


Grab the Email id in the Child Window
    ${text}=    get text    css:.red
    @{words}=   Split String    ${text}     at
    #0 ->Please email u
    #1-> mentor@rahulshettyacademy.com with below template to receive response
    ${text_split}=      Get From List       ${words}    1
    log     ${text_split}
     @{words_2}=   Split String    ${text_split}
     #0->mentor@rahulshettyacademy.com
     ${email}=      Get From List    ${words_2}    0
     Set Global Variable         ${email}


Switch to Parent window and enter the Email
    switch window       MAIN
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text          id:username     ${email}
    sleep    5
