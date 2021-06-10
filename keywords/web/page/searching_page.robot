*** Setting ***
Resource    ${CURDIR}/../web_import.robot
Resource    ${CURDIR}/../locator/searching_page.robot

*** Variables ***


***Keyword***

Search products with name and property
    [Arguments]    ${name}    ${property}
    common_keywords.Search desired product by name    ${name}
    Select filter follow option    ${property}

Select filter follow option
    [Arguments]    ${option}
    ${screen_size_filter}    String.Format String    ${dictSearchingPage.screen_size_opt}    titile_name=${screen_size_title}
    common_keywords.Scroll Down And Wait To Get Available Element    ${screen_size_filter}
    Sleep     15S
    ${opt_locator}    String.Format String    ${dictSearchingPage.opt_size_option}    size_inch=${option}
    common_keywords.Select Checkbox Element    ${opt_locator}
    


Verify number of available product
    [Arguments]    ${option}
    ${locator}    String.Format String    ${dictSearchingPage.opt_number_product}    size_inch=${size}
    $text_value    SeleniumLibrary.Get Text    ${locator} 


Verify option for select size is Visible
    [Arguments]    ${size}
    ${locator}    String.Format String    ${dictSearchingPage.lbl_size_option}    size_inch=${size}
    common_keywords.Verify Web Element Is Visible    ${locator}
    
