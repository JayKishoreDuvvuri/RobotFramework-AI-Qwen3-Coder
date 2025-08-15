*** Settings ***
Resource    init.robot

*** Variables ***
# Locators
${BILLING_ADDRESS_HEADER}        xpath=(//span[normalize-space()='Billing Address'])[1]
${ORDER_TOTAL_HEADER}            xpath=(//span[normalize-space()='Order Total'])[1]
${FIRST_NAME}                    input#firstname  
${LAST_NAME}                     input#lastname  
${EMAIL}                         input#email
${MOBILE_NUMBER}                 input#phone
${ADDRESS}                       id=address
${STATE}                         input#states
${CITY}                          input#city
${ZIP_CODE}                      input#pincode
${CONTINUE_BUTTON}               id=btn-continue

*** Keywords ***
# Actions
Check Checkout Page Loaded
    [Documentation]    Checks if the Checkout page is loaded by verifying the presence of key elements.
     Wait Until Page Contains Element    ${BILLING_ADDRESS_HEADER}  
     Wait Until Page Contains Element   ${ORDER_TOTAL_HEADER}    

Fill Billing Address
    [Documentation]    Fills the billing address form. Optional fields can be left empty. 
    Input Text Into Field       ${FIRST_NAME}         John
    Input Text Into Field       ${LAST_NAME}          Doe
    Input Text Into Field       ${EMAIL}              eztifjj@ygoi.com
    Input Text Into Field       ${MOBILE_NUMBER}      555-1234
    Input Text Into Field       ${ADDRESS}            123-Main-St
    Input Text Into Field       ${STATE}              California
    Input Text Into Field       ${CITY}               Los Angeles
    Input Text Into Field       ${ZIP_CODE}           90001

Proceed To Payment
    [Documentation]    Clicks the continue button to proceed to the payment page.
    Wait For Elements State    ${CONTINUE_BUTTON}   enabled    timeout=1s
    Click Element If Visible    ${CONTINUE_BUTTON}  