*** Settings ***
Documentation    To validate SAP Flori Test Scenarios
Resource    ../../TestCases/Resources/SAPFlori.robot

*** Test Cases ***
To Validate Create Standard Order: Overview VA01
    set selenium speed    2 seconds
    Open the chrome browser and navigate to SAP Flori URL
    Fill the username and password textbox with correct credential
    Click on Log On Button and verify that you successfully logged In
    Click on Search Icon and input VA01 in the search box and hit search button
    Select the Create Standard Order VA01 from the list
    Navigate to the Selected option that will open in a new tab
    Fill the Create Sales Documents form
