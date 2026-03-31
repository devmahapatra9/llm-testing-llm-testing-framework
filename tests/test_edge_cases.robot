*** Settings ***
Library    OperatingSystem

*** Test Cases ***
Test Empty Prompt
    ${response}=    Get Response    ${EMPTY}
    ${is_not_empty}=    Is Not Empty    ${response}
    Should Be True    ${is_not_empty}

Test Ambiguous Prompt
    ${response}=    Get Response    Tell me something
    Should Not Be Empty    ${response}

Test Unexpected Input
    ${response}=    Get Response    @#$%^&*()
    Should Not Be Empty    ${response}

*** Keywords ***
Get Response
    [Arguments]    ${prompt}
    ${result}=    Evaluate    __import__('utils.api_client', fromlist=['*']).get_response("${prompt}")
    RETURN    ${result}

Is Not Empty
    [Arguments]    ${response}
    ${result}=    Evaluate    __import__('utils.validators', fromlist=['*']).is_not_empty("${response}")
    RETURN    ${result}
