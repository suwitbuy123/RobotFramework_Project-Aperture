*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot

*** Test Cases ***
Update Existing Product
    ${product_id}=    Set Variable    1
    ${updated_data}=    Create Dictionary    title=Updated Product    price=12.99    description=Updated description    category=updated-category
    Update Product    ${product_id}    ${updated_data}

