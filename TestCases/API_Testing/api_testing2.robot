*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BaseUrl}    https://reqres.in
${Dictionary}
${user_id}
*** Test Cases ***
Creating dictionaries
    &{Dictionary}    CREATE DICTIONARY    first_name=michael    last_name=jackson    email=michaeljackson24@test.com    job=singer
    log    ${Dictionary}
    dictionary should contain value   ${Dictionary}   jackson
    dictionary should contain key  ${Dictionary}    first_name
    set global variable    ${Dictionary}
    log    ${Dictionary}[job]
Adding user by using POST Api call
    ${response}    POST      ${BaseUrl}/api/users    json=${Dictionary}
    log   ${response.json()}
    ${user_id}    get from dictionary    ${response.json()}    id
    set global variable    ${user_id}
    log    ${user_id}
    log    ${response.json()}[createdAt]
    status should be    201    ${response}
Getting User by using GET Api call
    [Tags]        API
    ${response}=   GET     ${base_url}/api/users/    params=${user_id}      expected_status=200
    log    ${response.json()}
Deleting User by using DELETE Api call
    [Tags]        API
    ${response}    DELETE    ${BaseUrl}/api/users/${user_id}    expected_status=204
    log    ${response}
    status should be       204     ${response}
