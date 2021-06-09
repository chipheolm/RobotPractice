*** Settings ***
Resource    ${CURDIR}/../locator/common_page.robot

*** Variables ***
${GLOBALTIMEOUT}     ${15}

*** Keywords ***
Open browser to home page
    Open browser to page    ${cds_url}          
    Run Keyword And Ignore Error    Close pop up
    Wait Until Page Is Completely Loaded

Open browser to page
    [Arguments]    ${url}    ${speed}=0.1 
    ${options}=     Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()     sys
    Call Method     ${options}     add_argument     --disable-infobars
    SeleniumLibrary.Create WebDriver     Chrome      chrome_options=${options}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed     ${speed}
    SeleniumLibrary.Go To     ${url}

Log in, add product to cart and navigate to check out page
    [Arguments]    ${email}    ${password}    ${store}    ${quantities}    ${skus}
    ${user_token}=    Get user login token by API    ${email}    ${password}
    Run Keyword And Ignore Error    Delete customer cart by API    ${user_token}    ${store}
    Add multi products to cart by API    ${user_token}    ${skus}    ${quantities}    ${store}        
    Log in and navigate to check out page with member    ${email}    ${password}

Log in and navigate to check out page with member
    [Arguments]    ${email}    ${password}
    Open browser to home page
    Go to page with url    register   
    register_page.Login Account At Register Page    ${email}    ${password}
    Go to page with url    checkout   

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
    Wait For Testability Ready

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