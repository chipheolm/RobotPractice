*** Settings ***
Resource    ${CURDIR}/../../resources/imports.robot

*** Keywords ***
Add multi products to cart by API
    [Documentation]    API add multi products to cart
    [Arguments]    ${user_token}    ${list_skus}    ${quantities}    ${store}=${EMPTY}
    FOR     ${index}     IN RANGE    len(${list_skus})
        Add product to cart by API    ${user_token}    ${list_skus}[${index}]    ${quantities}[${index}]    ${store}
    END    

Add product to cart by API
    [Documentation]    API add product to cart
    [Arguments]    ${user_token}    ${sku}    ${quantity}    ${store}=${EMPTY}
    &{header}=    Create Dictionary
    ...    Authorization=Bearer ${user_token}
    ...    Content-Type=application/json
    ${body}=    Get body part to add product by API    ${user_token}    ${sku}    ${quantity}    ${store}
    ${end_point}=   Set Variable    ${api_root}${store}/V1/carts/mine/items
    ${response}=    REST.Post    endpoint=${end_point}    headers=&{header}    body=${body}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]    ${response}

Get body part to add product by API
    [Documentation]    Set up body of API to add product to cart
    [Arguments]    ${user_token}    ${sku}    ${quantity}    ${store}=${EMPTY}
    ${quote_id}=    Post customer cart    ${user_token}    ${store}
    ${body_request}=    JSONLibrary.Load JSON From File    ${CURDIR}\\payload\\add_to_cart.json
    ${body_request}=    JSONLibrary.Update Value To Json    ${body_request}    $..sku    ${sku}
    ${body_request}=    JSONLibrary.Update Value To Json    ${body_request}    $..qty    ${quantity}
    ${body_request}=    JSONLibrary.Update Value To Json    ${body_request}    $..quote_id    ${quote_id}
    ${body}=    Evaluate    json.dumps($body_request)    json
    [Return]    ${body}    

Get user login token by API
    [Documentation]    API get customer log in token
    [Arguments]    ${username}    ${password}
    &{header}=    Create Dictionary    Accept=application/json    Content-Type=application/json
    &{body}=    Create Dictionary    username=${username}    password=${password}
    ${end_point}=   Set Variable    ${api_root}V1/integration/customer/token
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=&{body}
    REST.Integer    response status    200
    ${user_token}=    REST.Output    response body
    [Return]    ${user_token}

Post customer cart
    [Documentation]    Declare project variable ${api_root}.
    [Arguments]    ${user_token}    ${store}
    &{header}=    Create Dictionary
    ...    Authorization=Bearer ${user_token}
    ...    Content-Type=application/json
    ${end_point}=   Set Variable    ${api_root}${store}/V1/carts/mine
    ${response}=    REST.Post    endpoint=${end_point}    headers=&{header}
    REST.Integer    response status    200
    ${quote_id}=    REST.Output    response body
    [Return]    ${quote_id}        