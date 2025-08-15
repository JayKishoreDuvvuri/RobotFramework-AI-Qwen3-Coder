*** Settings ***
Library       Browser 
Library       String

*** Variables ***
${BASE_URL}    https://shop.qaautomationlabs.com

*** Keywords ***
Open Shop Application
    New Browser    browser=chromium    headless=False
    New Context    viewport={'width': 1320, 'height': 780}
    New Page    ${BASE_URL}

Close All Shop Browsers
    Close Browser

Get Page Title
    ${title}=    Get Title
    [Return]    ${title}

Wait Until Page Contains Element
    [Arguments]    ${locator}    ${timeout}=5s
    Wait For Elements State    ${locator}    visible    timeout=${timeout}

Click Element If Visible
    [Arguments]    ${locator}
    Wait Until Page Contains Element   ${locator}
    Click    ${locator}

Input Text Into Field
    [Arguments]    ${locator}    ${text}
    Wait Until Page Contains Element    ${locator}
    Fill Text    ${locator}    ${text}