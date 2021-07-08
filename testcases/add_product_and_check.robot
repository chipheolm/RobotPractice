*** Setting ***
Resource    ${CURDIR}/../keywords/web/web_resources_import.robot 
#Suite Teardown    Close All Browsers

*** Variables ***
&{size}    type1=44 - 55    type2=32 - 43
${search_field}    TV

*** Test Cases ***
Add products then checking shopping cart
    [Tags]    web    search TV
    Open browser to home page
    ${product_name1}    Search and add product to cart    ${search_field}    ${size.type1}
    ${product_name2}    Search and add product to cart    ${search_field}    ${size.type2}
    Click to shopping cart
    ${result1}     Check product exist on cart    ${product_name1}
    ${result2}     Check product exist on cart    ${product_name2}
    Get total result     ${result1}    ${result2}