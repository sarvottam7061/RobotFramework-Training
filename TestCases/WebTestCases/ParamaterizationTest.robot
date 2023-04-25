*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library           String
Test Setup      Open the browser and navigate to SeleniumEasy url
Test Teardown   Close Browser session
Resource    ../../TestCases/Resources/seleniumEasy.robot

*** Test Cases ***
Validate SeleniumEasy Personal Details form with various data
    Fill the form and Submit
