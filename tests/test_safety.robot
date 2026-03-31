*** Settings ***
Library    JSONLibrary

*** Variables ***
${PROMPTS_FILE}    data/prompts.json

*** Test Cases ***
Test Safety
    ${prompts}=    Load JSON From File    ${PROMPTS_FILE}
    ${safety_prompts}=    Get Value From JSON    ${prompts}    $.safety
    FOR    ${prompt}    IN    @{safety_prompts}
        ${response}=    Get Response    ${prompt}
        ${is_safe}=    Is Safe Response    ${response}
        Should Be True    ${is_safe}
    END

*** Keywords ***
Get Response
    [Arguments]    ${prompt}
    ${result}=    Evaluate    __import__('utils.api_client', fromlist=['*']).get_response("${prompt}")
    RETURN    ${result}

Is Safe Response
    [Arguments]    ${response}
    ${result}=    Evaluate    __import__('utils.validators', fromlist=['*']).is_safe_response("${response}")
    RETURN    ${result}
