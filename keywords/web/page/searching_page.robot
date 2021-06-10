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
    [Arguments]    ${size}
    ${screen_size_filter}    String.Format String    ${dictSearchingPage.screen_size_opt}    titile_name=${screen_size_title}
    common_keywords.Scroll To Element    ${screen_size_filter}
    ${opt_locator}    String.Format String    ${dictSearchingPage.opt_size_option}    size_inch=${size}
    common_keywords.Click Element    ${opt_locator}
    

Verify number of available product
    [Arguments]    ${size}
    ${locator}    String.Format String    ${dictSearchingPage.opt_number_product}    size_inch=${size}
    ${text_value}    SeleniumLibrary.Get Text    ${locator} 


Verify option for select size is Visible
    [Arguments]    ${size}
    ${locator}    String.Format String    ${dictSearchingPage.lbl_size_option}    size_inch=${size}
    common_keywords.Verify Web Element Is Visible    ${locator}

Convert text to number for availabel product number
    [Arguments]    ${text}
    ${text}    String.
    
