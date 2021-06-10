*** Setting ***
Resource    ${CURDIR}/../web_resources_import.robot
Resource    ${CURDIR}/../locator/shopping_cart_page.robot

*** Keywords ***
Check product exist on cart
    [Arguments]    ${product_name}    ${sku}    ${quantity}
    ${name_locator}    String.Format String    ${dictShoppingCartPage.product_name}    sku=${sku}
    ${quantity_locator}    String.Format String    ${dictShoppingCartPage.product_quantity}    prd_name=${product_name}
    ${result1}    common_keywords.Get text and compare value    ${name_locator}    ${product_name}
    ${result2}    common_keywords.Get text and compare value    ${quantity_locator}    ${quantity}
    BuiltIn.Run Keyword If    ${result1}&&${result2}==${true}
    ...    BuiltIn.Log    Product name and it's quantity are right, you can pass to payment step to finish this order.
    ...    BuiltIn.Return From Keyword    ${true}
    ...    ELSE    
    ...    BuiltIn.Log    Product name and it's quantity are wrong, please carefully check before make payment for this order!!!
    ...    BuiltIn.Return From Keyword    ${false}
