***Settings***
Library     SeleniumLibrary
Library     String
Test Setup          Open guru99
Test Teardown       Delete customer
Suite Teardown      Close Browser

***Variables***
${customer_id_path}     xpath://td[text()='Customer ID']/following-sibling::td
${add_new_customer}     xpath://a[contains(text(),'New Customer')]

***Keywords***
Open guru99
    open browser    http://demo.guru99.com/V4/  chrome
    Maximize Browser Window
    
Login guru99
    [Arguments]     ${user_name}   ${pass_word}
    Input Text       xpath=//input[@name='uid']        ${user_name}
    Input Password   xpath=//input[@name='password']       ${pass_word}
    Click button     xpath=//input[@type='submit']
    Sleep      2s

Add new customer form
    [Arguments]      ${name1}    ${dob}    ${addr}     ${city}  ${state}  ${pinno}  ${telephoneno}  ${emailid}  ${password1}
    Wait Until Element Is Visible       ${add_new_customer}
    Click Link                          ${add_new_customer}
    Wait Until Element Is Visible   xpath=//tbody//input[@name='name']
    Input Text       xpath=//input[@name='name']            ${name1}
    Input Text       xpath=//input[@name='dob']             ${dob}
    Input text       xpath=//textarea[@name='addr']         ${addr}
    Input Text       xpath=//input[@name='city']            ${city}
    Input Text       xpath=//input[@name='state']           ${state}      
    Input Text       xpath=//input[@name='pinno']           ${pinno}   
    Input Text       xpath=//input[@name='telephoneno']     ${telephoneno}  
    Input Text       xpath=//input[@name='emailid']         ${emailid}  
    Input Password   xpath=//input[@name='password']        ${password1}
    Click button     xpath=//input[@name='sub']

Verify result message
    ${expected_text}     Set Variable     Customer Registered Successfully!!!
    ${actual_message}    Get text   xpath=//table/tbody//td/p
    Log     ${actual_message}
    Should Be Equal As Strings      ${actual_message}     ${expected_text}
    

Delete customer
    Sleep       3s
    Wait Until Element Is Visible      ${customer_id_path}
    ${customer_id}      Get text       ${customer_id_path}
    Click Link          Delete Customer
    Input Text          xpath=//input[@name='cusid']         ${customer_id}
    Click Element       xpath=//input[@type='submit']
    Handle Alert	    ACCEPT	    30s
    ${message} =	    Handle Alert	ACCEPT
    ${expected_text}    Set Variable    Customer deleted Successfully
    Should Be Equal As Strings      ${message}      ${expected_text}

***Test Cases***
Test case 1: Login guru99
    Login guru99      mngr376457     uvUsytu
    Add new customer form     ABC    05/13/1995  18Floor Handico    Ha noi	Me tri	123456	0976721230	tmnjm@abc.com	abc123123
    Verify result message
    
    


    
    
    
    


