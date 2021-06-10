*** Setting ***
Resource    ${CURDIR}/../keywords/web/web_resources_import.robot 
# Suite Teardown    Close All Browsers

*** Variables ***
${size}    44 - 55
${search_field}    TV

*** Keywords ***

*** Test Cases ***
User check search product and add it to cart
    [Tags]    web    search TV
    Search products with name and specificcation    ${search_field}    ${size}
    ${text}    Click qualified product with SKU    264098
    Check product name and add to cart     ${text}
    BuiltIn.Sleep     2S
    Check quantity and click to shopping cart
    BuiltIn.Sleep     2S
    Check product exist on cart    ${text}    264098    1

    
    