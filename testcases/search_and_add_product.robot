*** Setting ***
Resource    ${CURDIR}/../keywords/web/web_resources_import.robot 
Suite Teardown    Close All Browsers

*** Variables ***
&{size}    type1=44 - 55    type2=32 - 43
${search_field}    TV
${result1}    ${true}
${result2}    ${false}

*** Keywords ***
Search and add product to cart if qualified
    [Arguments]    ${search_field}    ${size}
    Search products with name and specificcation    ${search_field}    ${size}
    ${sku}    Get sku of product can add to cart    ${search_field}    ${size}
    ${text}    Click qualified product with SKU    ${sku}
    Check product name and add to cart     ${text}
    [Return]    ${text}

*** Test Cases ***
Check added products are existed on shopping cart
    [Tags]    web    search TV
    Open browser to home page
    ${product_name1}    Search and add product to cart if qualified    ${search_field}    ${size.type1}
    ${product_name2}    Search and add product to cart if qualified    ${search_field}    ${size.type2}
    Check quantity and click to shopping cart
    ${result1}     Check product exist on cart    ${product_name1}
    ${result2}     Check product exist on cart    ${product_name2}
    Get total result     ${result1}    ${result2}