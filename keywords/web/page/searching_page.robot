*** Setting ***
Resource    ${CURDIR}/../web_resources_import.robot
Resource    ${CURDIR}/../locator/searching_page.robot

*** Variables ***


***Keyword***

Search products with name and specificcation
    [Arguments]    ${name}    ${specificcation}
    common_keywords.Search desired product by name    ${name}
    Select filter follow option    ${specificcation}
    BuiltIn.Sleep     2S


Select filter follow option
    [Arguments]    ${size}
    ${screen_size_filter}    String.Format String    ${dictSearchingPage.screen_size_opt}    titile_name=${screen_size_title}
    ${opt_locator}    String.Format String    ${dictSearchingPage.opt_size_option}    size_inch=${size}
    common_keywords.Scroll To Element    ${screen_size_filter}
    ${result}    Verify number of available product    ${size}
    BuiltIn.Run Keyword If     
    ...    ${result}==${true}
    ...    common_keywords.Click Element    ${opt_locator}
    ...    ELSE    
    ...    BuiltIn.Fail    Products as filted not available!     


Verify number of available product
    [Arguments]    ${size}
    ${locator}    String.Format String    ${dictSearchingPage.opt_number_product}    size_inch=${size}
    ${text_value}    common_keywords.Get Text Element    ${locator}
    ${text_value}    String.Remove String    ${text_value}    (    )
    ${number_value}    BuiltIn.Convert To Number    ${text_value}
    BuiltIn.Return From Keyword If    ${number_value} > 0    ${true}


Click qualified product with SKU
    [Arguments]    ${sku}
    ${prd_locator}    String.Format String    ${dictSearchingPage.target_product}    sku=${sku}
    ${prd_name_locator}    String.Format String    ${dictSearchingPage.target_product_name}    sku=${sku}
    ${name}    common_keywords.Get Text Element    ${prd_name_locator}
    common_keywords.Scroll Down And Wait To Get Available Element    ${prd_locator}
    Sleep    2S
    common_keywords.Click Element    ${prd_name_locator}
    BuiltIn.Return From Keyword    ${name}




    
