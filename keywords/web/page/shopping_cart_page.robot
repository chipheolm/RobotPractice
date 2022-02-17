*** Setting ***
Resource    ${CURDIR}/../web_resources_import.robot
Resource    ${CURDIR}/../locator/shopping_cart_page.robot

*** Keywords ***
Check product exist on cart
    [Arguments]    ${product_name}
    ${name_locator}    String.Format String    ${dictShoppingCartPage.product_name}    prd_name=${product_name}
    ${quantity_locator}    String.Format String    ${dictShoppingCartPage.product_quantity}    prd_name=${product_name}
    ${result}    common_keywords.Get text and search value    ${name_locator}    ${product_name}
    ${bool}    Run Keyword If     ${result}==${true}   Set Variable    ${true}
    ...    ELSE    Set Variable    ${false}
    [Return]    ${bool}       