*** Settings ***
Library     Collections
Library    RequestsLibrary
Library    String

*** Variables ***
${BaseUrl}    https://reqres.in
&{Dictionary}
${user_id}

*** Test Cases ***
Creating Dictionaries
    [Tags]        API
    &{Dictionary}    create dictionary    first_name=michael    last_name=jackson    email=michaeljackson@test.com    job=singer
    log     ${Dictionary}
    set global variable   ${Dictionary}
    Dictionary Should Contain Key     ${Dictionary}    job
    log     ${Dictionary}[job]
    ${url}=     Get From Dictionary     ${Dictionary}    email
    log   ${url}

Adding User by using POST Api call
    [Tags]        API
    ${response}    POST    ${BaseUrl}/api/users    json=${Dictionary}    expected_status=201
    log      ${response.json()}
    Dictionary Should Contain Key     ${response.json()}     id
    ${user_id}=    Get From Dictionary     ${response.json()}    id
    Set Global Variable    ${user_id}
    log  ${user_id}
    log    ${response.json()}[createdAt]
    status should be       201     ${response}

Getting User by using GET Api call
    [Tags]        API
    ${response}=   GET     ${base_url}/api/users/    params=${user_id}      expected_status=200
    log    ${response.json()}
Deleting User by using DELETE Api call
    [Tags]        API
    ${response}    DELETE    ${BaseUrl}/api/users/${user_id}    expected_status=204
    log    ${response}
    status should be       204     ${response}
