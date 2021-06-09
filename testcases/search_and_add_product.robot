*** Setting ***
Resource    ${CURDIR}/../keywords/web/web_import.robot 
Suite Teardown    Close All Browsers

*** Variables ***
 

*** Test Cases ***
User check search product and add it to cart
    [Tags]    web    search TV
    Open browser to home page