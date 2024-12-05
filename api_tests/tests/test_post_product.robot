*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot

*** Test Cases ***
Create New Product
    ${product_data}=    Create Dictionary    title=Test Product    price=25.99    description=Sample description    category=electronics
    Create Product    ${product_data}

