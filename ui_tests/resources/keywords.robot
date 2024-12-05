*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords.robot

*** Keywords ***

Open Browser and Navigate to Sauce Demo
    Open Browser    ${BASE_URL}    chrome

Log In
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains    Products    timeout=15s


Add Products to Cart
    [Arguments]    @{products}
    FOR    ${product}    IN    @{products}
        Click Element    xpath=//div[text()='${product}']/ancestor::div[@class='inventory_item']//button
    END

Validate Cart Items
    [Arguments]    @{expected_items}
    Click Element    ${CART_ICON}
    Wait Until Element Is Visible    ${CART_ITEMS}    timeout=5s
    ${cart_items}=    Get WebElements    ${CART_ITEMS}
    ${cart_count}=    Get Length    ${cart_items}
    ${expected_count}=    Evaluate    len(${expected_items})
    Run Keyword And Capture Error Screenshot    Should Be Equal As Numbers    ${cart_count}    ${expected_count}
    FOR    ${item}    IN    @{expected_items}
        ${item_in_cart}=    Get Text    xpath=//div[@class='inventory_item_name' and text()='${item}']
        Run Keyword And Capture Error Screenshot    Should Be Equal As Strings    ${item}    ${item_in_cart}
    END

Run Keyword And Capture Error Screenshot
    [Arguments]    ${keyword}    @{args}
    ${result}=    Run Keyword And Ignore Error    ${keyword}    @{args}
    Run Keyword If    '${result[0]}' == 'FAIL'    Capture Page Screenshot
    Run Keyword If    '${result[0]}' == 'FAIL'    Fail    ${result[1]}

Verify Cart Items
    [Arguments]    @{expected_items}
    Click Element    ${CART_ICON}
    ${cart_items}=    Get WebElements    ${CART_ITEMS}
    ${cart_count}=    Get Length    ${cart_items}
    ${expected_count}=    Evaluate    len(${expected_items})
    Should Be Equal As Numbers    ${cart_count}    ${expected_count}
    FOR    ${item}    IN    @{expected_items}
        ${item_in_cart}=    Get Text    xpath=//div[text()='${item}']
        Should Be Equal As Strings    ${item}    ${item_in_cart}
    END


Checkout
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Click Button    ${CHECKOUT_BUTTON}
    Input Text    ${FIRST_NAME}    ${first_name}
    Input Text    ${LAST_NAME}    ${last_name}
    Input Text    ${POSTAL_CODE}    ${postal_code}
    Click Button    ${FINISH_BUTTON}
    Wait Until Page Contains Element    ${ORDER_CONFIRMATION}


Log In And Handle Error
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}
    Run Keyword And Ignore Error    Wait Until Page Contains Element    xpath://h3[@data-test="error"]    timeout=5s
    ${error}=    Run Keyword And Return Status    Page Should Contain Element    xpath://h3[@data-test="error"]
    Run Keyword If    '${error}' == 'True'    Capture Page Screenshot
    Run Keyword If    '${error}' == 'True'    Page Should Contain    Epic sadface: Sorry, this user has been locked out.
    Run Keyword If    '${error}' == 'True'    Fail    User locked out
    Wait Until Page Contains    Products    timeout=15s


Proceed to Checkout
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}    timeout=10s
    Click Button    ${CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${FIRST_NAME_FIELD}    timeout=10s
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}
    Input Text    ${POSTAL_CODE_FIELD}    ${postal_code}
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}    timeout=10s
    Click Button    ${CONTINUE_BUTTON}







Add All Products to Cart
    ${buttons}=    Get WebElements    ${ADD_TO_CART_BUTTON}
    FOR    ${button}    IN    @{buttons}
        Click Element    ${button}
        Sleep    1s    # เพิ่มเวลาเผื่อสำหรับคลิกปุ่ม
    END



Verify Checkout Complete
    Click Button    ${FINISH_BUTTON}
    Wait Until Page Contains Element    ${ORDER_CONFIRMATION}

Complete Workflow for User
    [Arguments]    ${username}    ${password}
    Open Browser and Navigate to Sauce Demo
    Log In And Handle Error    ${username}    ${password}
    Run Keyword And Ignore Error    Add All Products to Cart
    Run Keyword And Ignore Error    Validate Cart Items    Sauce Labs Backpack    Sauce Labs Bolt T-Shirt    Sauce Labs Onesie    Sauce Labs Bike Light    Test.allTheThings() T-Shirt (Red)
    ${checkout_status}=    Run Keyword And Ignore Error    Proceed to Checkout    John    Doe    12345
    Run Keyword If    '${checkout_status[0]}' == 'FAIL'    Fail    Checkout failed for user ${username}
    Run Keyword And Ignore Error    Verify Checkout Complete
    Close Browser






