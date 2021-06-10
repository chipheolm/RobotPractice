*** Settings ***
Resource    ${CURDIR}/../locator/common_page.robot

*** Variables ***
${GLOBALTIMEOUT}     ${30}

*** Keywords ***
Open browser to home page
    Open browser to page    ${pb_url}/${language}          
#   Run Keyword And Ignore Error    Close pop up
#    Wait Until Page Is Completely Loaded

Open browser to page
    [Arguments]    ${url}    ${speed}=0.1 
    ${options}=     Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()     sys
    Call Method     ${options}     add_argument     --disable-infobars
    SeleniumLibrary.Create WebDriver     Chrome      chrome_options=${options}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed     ${speed}
    SeleniumLibrary.Go To     ${url}

Search desired product by name
    [Arguments]    ${name}
    Open browser to home page
    SeleniumLibrary.Input text    ${dictCommonPage.search_input_box}    ${name}
    SeleniumLibrary.Click button    ${dictCommonPage.search_button}
    Verify Web Element Is Visible     ${dictCommonPage.search_result_text}

Input data and verify text for web element
    [Arguments]     ${locator}      ${expect_text}
    SeleniumLibrary.Input Text     ${locator}    ${expect_text}
    ${real_text}=    SeleniumLibrary.Get Value    ${locator}
    Should Be Equal    '${real_text}'    '${expect_text}'

Go to page with url
    [Arguments]    ${path}
    SeleniumLibrary.Go To    ${cds_url}/${language}/${path}
    Wait Until Page Is Completely Loaded

Close pop up 
    SeleniumLibrary.Wait Until Page Contains Element    xpath=//*[@id="btn-popup-close"]
    SeleniumLibrary.Click Element    xpath=//*[@id="btn-popup-close"]

Wait Until Page Is Completely Loaded
    Sleep 5s

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
    ${section}     Set Variable     ${10}
    ${page_height}    SeleniumLibrary.Get Element Size     ${dictCommonPage.entire_page}
    ${page_height}    Set Variable    ${page_height}[1]
    ${scroll_length}    Evaluate     '${page_height}/${section}'
    FOR    ${index}  IN RANGE  ${section}
        SeleniumLibrary.Execute Javascript     window.scrollTo(0,${${page_height}-${${scroll_length}*${index}}})
        ${status}    Run Keyword And Return Status     SeleniumLibrary.Wait Until Element Is Visible     ${locator}     timeout=10
        Return From Keyword If     '${status}' == '${true}'
    END
        Fail     This element cannot be found in this page.