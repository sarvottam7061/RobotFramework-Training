*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library           String
Test Setup      open the browser with the url
Test Teardown   Close Browser session
Resource    ../../TestCases/Resources/LoginPage.robot

*** Test Cases ***
Select the Form and navigate to Child window
    [Tags]    ui_control
    Fill the Login Details and Login Form

Validate Child window Functionality
    [Tags]      NEWFEATURE
    Select the link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email