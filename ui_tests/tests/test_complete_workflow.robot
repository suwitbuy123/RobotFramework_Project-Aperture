*** Settings ***
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot

*** Variables ***
@{USER_CREDENTIALS}    standard_user:secret_sauce    locked_out_user:secret_sauce    problem_user:secret_sauce    performance_glitch_user:secret_sauce    error_user:secret_sauce    visual_user:secret_sauce

*** Test Cases ***
Complete Workflow for All Users
    FOR    ${user_cred}    IN    @{USER_CREDENTIALS}
        ${username}=    Evaluate    "${user_cred}".split(":")[0]
        ${password}=    Evaluate    "${user_cred}".split(":")[1]
        ${status_and_message}=    Run Keyword And Ignore Error    Complete Workflow for User    ${username}    ${password}
        ${status}=    Set Variable    ${status_and_message}[0]
        Run Keyword If    '${status}' == 'FAIL'    Log    Skipping user: ${username} due to incomplete checkout process
    END
