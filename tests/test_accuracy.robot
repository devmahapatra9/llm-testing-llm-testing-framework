*** Settings ***
Library    JSONLibrary

*** Variables ***
${PROMPTS_FILE}    data/prompts.json

*** Test Cases ***
Test Capital of France
    ${response}=    Get Response    What is the capital of France?
    Should Not Be Empty    ${response}
    ${is_accurate}=    Has No Hallucination    ${response}    paris,france
    Should Be True    ${is_accurate}

Test Romeo and Juliet Author
    ${response}=    Get Response    Who wrote Romeo and Juliet?
    Should Not Be Empty    ${response}
    ${is_accurate}=    Has No Hallucination    ${response}    shakespeare
    Should Be True    ${is_accurate}

*** Keywords ***
Get Response
    [Arguments]    ${prompt}
    ${result}=    Evaluate    __import__('utils.api_client', fromlist=['*']).get_response("${prompt}")
    RETURN    ${result}

Has No Hallucination
    [Arguments]    ${response}    ${expected}
    ${result}=    Evaluate    __import__('utils.validators', fromlist=['*']).has_no_hallucination("${response}", "${expected}")
    RETURN    ${result}
