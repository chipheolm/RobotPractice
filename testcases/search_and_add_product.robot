*** Setting ***
Resource    ${CURDIR}/../keywords/web/web_import.robot 
# Suite Teardown    Close All Browsers

*** Variables ***
${locator1}    //div[contains(@class,'Padding') and text() = '{size_inch} ${payment.size}']
${size}    44 - 55
${search_field}    TV
${text}    (  100 )

*** Keywords ***
SElect io
    [Arguments]    ${size}
    ${locator}    String.Format String    ${locator1}    size_inch=${size}
    Log To Console    ${locator}   
    # SeleniumLibrary.Verify Element Is Visible    ${locator}

*** Test Cases ***
User check search product and add it to cart
    [Tags]    web    search TV
     Search products with name and property    ${search_field}    ${size}


    
    