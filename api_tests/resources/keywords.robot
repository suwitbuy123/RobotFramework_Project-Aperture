*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Get Products
    [Arguments]    ${sort}=None
    Create Session    alias    ${BASE_URL}   
    ${endpoint}=    Set Variable    ${PRODUCT_ENDPOINT}
    ${response}=    GET On Session    alias    ${endpoint}    params=sort=${sort}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}

Create Product
    [Arguments]    ${product_data}
    Create Session    alias    ${BASE_URL}    verify=False
    ${endpoint}=    Set Variable    ${PRODUCT_ENDPOINT}
    ${response}=    POST On Session    alias    ${endpoint}    json=${product_data}
    Should Be True    ${response.status_code} == 200 or ${response.status_code} == 201
    Log    Product created successfully: ${response.json()}

Update Product
    [Arguments]    ${product_id}    ${product_data}
    Create Session    alias    ${BASE_URL}    verify=False
    ${endpoint}=    Set Variable    ${PRODUCT_ENDPOINT}/${product_id}
    ${response}=    PUT On Session    alias    ${endpoint}    json=${product_data}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}

Delete Product
    [Arguments]    ${product_id}
    Create Session    alias    ${BASE_URL}    verify=False
    ${endpoint}=    Set Variable    ${PRODUCT_ENDPOINT}/${product_id}
    ${response}=    DELETE On Session    alias    ${endpoint}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    Product with ID ${product_id} deleted successfully.


Get Categories
    Create Session    alias    ${BASE_URL}    verify=False
    ${endpoint}=    Set Variable    ${CATEGORY_ENDPOINT}
    ${response}=    GET On Session    alias    ${endpoint}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}




