*** Settings ***

Library    ../../TestCases/CustomLibrary/customShop.py

*** Test Cases ***
Validate custom keyword using python
    [Tags]        SMOKE
    hello_world
    Hello World


