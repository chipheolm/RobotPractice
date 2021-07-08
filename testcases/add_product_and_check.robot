*** Setting ***
Resource    ${CURDIR}/../keywords/web/web_resources_import.robot 
#Suite Teardown    Close All Browsers

*** Variables ***
${type1}    44 - 55
${type2}    32 - 43
${search_field}    TV

*** Test Cases ***
Add products then checking shopping cart
    [Tags]    web    search TV
    Open browser to page    ${pb_url}
    ${product_1}    common_keywords.Search and add product to cart    ${search_field}    ${type1}
    ${product_2}    common_keywords.Search and add product to cart    ${search_field}    ${type2}
    common_keywords.Click to shopping cart
    ${result1}      cart_page.Check product is existed on cart    ${product_1}
    ${result2}      cart_page.Check product is existed on cart    ${product_2}
    Compare and assert final result     ${result1}    ${result2}