*** Settings ***
Resource    init.robot

*** Variables ***
# Locators - Using data-test-id if available, otherwise CSS/XPath
${LOGIN_TITLE}            xpath=(//span[contains(text(), 'Login')])[2]                   
${EMAIL_INPUT}            input#email
${PASSWORD_INPUT}         input#password
${LOGIN_BUTTON}           button#loginBtn
${MY_ACCOUNT_HEADER}      xpath=(//a[normalize-space()='Home'])[2]
${HOMEPAGE_URL}           https://shop.qaautomationlabs.com/shop.php
${ERROR_MESSAGE}          id=errorMsg 
${ERROR_MESSAGE_TEXT}     Please enter your email.

*** Keywords ***
# Actions
Navigate To Login Page
     Wait For Elements State    ${LOGIN_TITLE}   visible    timeout=1s     

Enter Email
    [Arguments]    ${email}
    Input Text Into Field    ${EMAIL_INPUT}    ${email}

Enter Password
    [Arguments]    ${password}
    Input Text Into Field    ${PASSWORD_INPUT}    ${password}

Click Login Button
    Click Element If Visible    ${LOGIN_BUTTON}

# Combined Action
Login With Credentials
    [Documentation]    Logs in with the provided email and password.
    [Arguments]    ${email}    ${password}
    Navigate To Login Page
    Enter Email    ${email}
    Enter Password    ${password}
    Click Login Button

# Assertions / Verifications
Verify Login Page loaded
    [Documentation]    Verifies that the login page is loaded by checking for key elements.
    Wait Until Page Contains Element    ${EMAIL_INPUT}
    Wait Until Page Contains Element    ${PASSWORD_INPUT}
    Wait Until Page Contains Element    ${LOGIN_BUTTON}

Verify Successful Login
    [Documentation]    Verifies that the user is redirected to the homepage after a successful login.
    Wait Until Page Contains Element    ${MY_ACCOUNT_HEADER}
    ${current_url} =  Get Url
    Should Contain    ${current_url}    ${HOMEPAGE_URL} 

Verify Login Error Message
    [Documentation]    Verifies that the error message is displayed when login fails.
    [Arguments]    ${expected_message}
    Wait Until Page Contains Element    ${ERROR_MESSAGE}
    ${actual_message}=    Get Text      ${ERROR_MESSAGE}
    Should Be Equal    ${actual_message.strip()}    ${expected_message}