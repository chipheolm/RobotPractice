*** Settings ***
Resource    ${CURDIR}/../locator/common_page.robot

*** Variables ***
${GLOBALTIMEOUT}     ${15}

*** Keywords ***
Open browser to home page
    Open browser to page    ${pb_url}/${language}

Open browser to page
    [Arguments]    ${url}    ${speed}=0.1 
    ${options}=     Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()     sys
    ${exclude}=    Create Dictionary    "fasp"=True
    ${prefs}=    Create Dictionary    protocol_handler.excluded_schemes=${exclude}
    Call Method     ${options}    add_argument     --disable-infobars
    Call Method     ${options}    add_experimental_option    prefs    ${prefs}
    SeleniumLibrary.Create WebDriver     Chrome      chrome_options=${options}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed     ${speed}
    SeleniumLibrary.Go To     ${url}

Search desired product by name
    [Arguments]    ${name}
    SeleniumLibrary.Input text    ${dictCommonPage.search_input_box}    ${name}
    common_keywords.Click Element    ${dictCommonPage.search_button}
    ${expected_text}    String.Format String    ${result_text}    text=${name}
    ${result}    Get text and compare value     ${dictCommonPage.search_result_text}     ${expected_text}
    BuiltIn.Run Keyword If
    ...    ${result} == ${true}
    ...    BuiltIn.Log    Success to search products by text name
    ...    ELSE    
    ...    BuiltIn.Fail    Fail to search products by text name

Get text and compare value
    [Arguments]    ${locator}    ${text_value}
    ${text}    Get Text Element    ${locator}
    BuiltIn.Return From Keyword If
    ...    '${text}' == '${text_value}'    ${true}

Get text and search value
    [Arguments]    ${locator}    ${text_value}
    ${text}    Get Text Element    ${locator}
    ${status}    BuiltIn.Run Keyword And Return Status
    ...    BuiltIn.Should Contain    ${text}    ${text_value}
    BuiltIn.Return From Keyword     ${status}

Input data and verify text for web element
    [Arguments]     ${locator}      ${expect_text}
    SeleniumLibrary.Input Text     ${locator}    ${expect_text}
    ${real_text}=    SeleniumLibrary.Get Value    ${locator}
    Should Be Equal    '${real_text}'    '${expect_text}'

Go to page with url
    [Arguments]    ${path}
    SeleniumLibrary.Go To    ${cds_url}/${language}/${path}
    Wait Until Page Is Completely Loaded

Get total result 
    [Arguments]    ${rs1}    ${rs2}
    Run Keyword If     ${rs1}==${true} and ${rs2}==${true}   BuiltIn.Log    Pass. Test case finish with no issue.
    ...    ELSE    BuiltIn.Fail    Fail. Some product not available on shopping cart!

Close pop up 
    SeleniumLibrary.Wait Until Page Contains Element    xpath=//*[@id="btn-popup-close"]
    SeleniumLibrary.Click Element    xpath=//*[@id="btn-popup-close"]

Wait Until Page Loader Is Not Visible
    Seleniumlibrary.Wait Until Page Does Not Contain Element    ${dictCommonPage}[page_loader]    timeout=${GLOBALTIMEOUT}
    Wait Until Page Is Completely Loaded        

Verify Web Element Is Visible
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}    timeout=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${GLOBALTIMEOUT}

Click Element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    SeleniumLibrary.Click Element  ${locator}

Get Text Element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    ${text}    SeleniumLibrary.Get Text  ${locator}
    BuiltIn.Return From Keyword    ${text}

Select Checkbox Element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    SeleniumLibrary.Select checkbox  ${locator}

Scroll And Click Element
    [Arguments]    ${locator}
    Scroll To Element    ${locator}
    common_keywords.Click Element    ${locator}

Scroll To Element
    [Arguments]    ${locator}
    SeleniumLibrary.Scroll Element Into View    ${locator}

Select from drop down by label
    [Arguments]     ${locator}     ${label}
    common_keywords.Verify Web Element Is Visible   ${locator}
    Wait Until Keyword Succeeds    3x    5s    SeleniumLibrary.Select From List By Label   ${locator}    ${label}  

Scroll Down And Wait To Get Available Element
    [Arguments]    ${locator}
    ${section}     Set Variable     ${11}
    ${page_height}    SeleniumLibrary.Get Element Size     ${dictCommonPage.entire_page}
    ${page_height}    Set Variable    ${page_height}[1]
    ${scroll_length}    Evaluate     '${page_height}/${section}'
    FOR    ${index}  IN RANGE  ${section}
        SeleniumLibrary.Execute Javascript     window.scrollTo(0,${${scroll_length}*${index}})
        ${status}    Run Keyword And Return Status     SeleniumLibrary.Wait Until Element Is Visible     ${locator}     timeout=10
        BuiltIn.Return From Keyword If     '${status}' == '${true}'
    END
        BuiltIn.Fail     msg=Not found element in this page.

Check quantity and click to shopping cart
    ${text}    Get Text Element    ${dictCommonPage.shopping_cart_number}
    Log     Number of product right now in shopping cart is ${text}
    Click Element    ${dictCommonPage.shopping_cart_icon}