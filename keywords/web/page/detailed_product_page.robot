*** Setting ***
Resource    ${CURDIR}/../web_resources_import.robot
Resource    ${CURDIR}/../locator/detailed_product_page.robot

*** Variables ***


***Keyword***
Check product name and add to cart 
    [Arguments]    ${product_name}
    ${result}    common_keywords.Get text and compare value    ${dictDetailedProductPage.product_name}    ${product_name}
    BuiltIn.Run Keyword If    ${result}==${true}
    ...    common_keywords.Click Element    ${dictDetailedProductPage.product_add_cart_btn}
    ...    ELSE    BuiltIn.Fail    Not same the expected product, refuse!