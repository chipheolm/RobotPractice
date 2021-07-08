*** Setting ***
Resource    ${CURDIR}/../web_resources_import.robot

*** Variables ***
${product_name}    css:[class='CartItems__CartItemsContainer-jDoZuM gtvBSj'] [data-product-name = '{prd_name}'] [class='MultipleLineClamp__ProductCutoffDot-jCGKBO fMOIos']
${product_quantity}    css:[class='CartItems__CartItemsContainer-jDoZuM gtvBSj'] [data-product-name = '{prd_name}'] [class='Form__FormInput-vd2hnz-0 fQuEjW']

*** Keywords ***
Check product exist on cart
    [Arguments]    ${product_name}
    ${name_locator}    String.Format String    ${product_name}    prd_name=${product_name}
    ${quantity_locator}    String.Format String    ${product_quantity}    prd_name=${product_name}
    ${result}    common_keywords.Get text and search value    ${name_locator}    ${product_name}
    ${bool}    Run Keyword If     ${result}==${true}   Set Variable    ${true}
    ...    ELSE    Set Variable    ${false}
    [Return]    ${bool}       