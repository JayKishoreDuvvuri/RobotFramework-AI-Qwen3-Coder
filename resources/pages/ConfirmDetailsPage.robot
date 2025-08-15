*** Settings ***
Resource    init.robot
Library    Collections

*** Variables ***
# Locators
${CONFIRM_DETAILS_HEADER}        xpath=(//span[normalize-space()='Confirm Details'])[1]
${ORDER_TOTAL_HEADER}            xpath=(//span[normalize-space()='Order Total'])[1]
${ORDER_TOTAL}                   xpath=(//td[@class='align-middle'][contains(text(),'₹3999')])[1]
${PLACE_ORDER_BUTTON}            xpath=(//a[normalize-space()='Place Order'])[1]


*** Keywords ***
# Actions
Check Confirm Details Page Loaded
    [Documentation]    Checks if the Confirm Details page is loaded by verifying the presence of key elements.
     Wait Until Page Contains Element    ${CONFIRM_DETAILS_HEADER}  
     Wait Until Page Contains Element    ${ORDER_TOTAL_HEADER}     


Assert Order Total And Place Order
    [Documentation]    Asserts the order total and clicks the place order button.
    Wait Until Page Contains Element    ${ORDER_TOTAL}           
    Click Element If Visible            ${PLACE_ORDER_BUTTON}     