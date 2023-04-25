*** Settings ***
Documentation    To validate SAP Flori Test Scenarios
Resource    ../../TestCases/Resources/SAPFlori.robot

*** Test Cases ***
To Validate Stock - Single Material
    set selenium speed    2 seconds
    Open the chrome browser and navigate to SAP Flori URL
    Fill the username and password textbox with correct credential
    Click on Log On Button and verify that you successfully logged In
    Click on Search Icon and input Stock - Single Material in the search box and hit search button
    Enter the material TG11 in the search box of the new page and select TG11
    Check both Table vie and Chart view
    Click on Search Icon and input Transfer Stock - Cross-Plant in the search box and hit search button
    Enter the material TG11 in the Cross_Plant search box of the new page and select TG11
    Note down the stocks available now and Click on the icon from which you want to send stocks and then Click on the icon into which you want to receive stocks