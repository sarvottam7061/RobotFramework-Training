*** Settings ***
Library     Collections
Library    RequestsLibrary

*** Variables ***
${name}    priya
@{names}    priya    rahul    rohan
${url}    https://reqres.in
${page}    page=3
*** Test Cases ***
Creating dictoranies
    [Tags]    test
    &{data}=    CREATE DICTIONARY    name=rahul     id=10    website=rahul@test.com
    log    ${data}
    DICTIONARY SHOULD CONTAIN KEY    ${data}   website
    log    ${data}[website]

Play around with Dictinoary
    [Tags]      API
    &{data}=    Create Dictionary      name=rahulshetty     course=robot       website=rahulshettyacademy.com
    log     ${data}
    Dictionary Should Contain Key     ${data}     name
    log     ${data}[name]
    ${url}=     Get From Dictionary     ${data}     website
    log   ${url}

Get api test call
    [Tags]    API
    ${get_reponse}    Get    ${url}/api/users/23  params=${page}   expected_status=200
    log    ${get_reponse.json()}