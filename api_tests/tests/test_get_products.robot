*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot


*** Test Cases ***
Get All Products
    Get Products

Get Products Sorted By Ascending
    Get Products    asc
