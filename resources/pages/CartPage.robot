*** Settings ***
Resource    init.robot

*** Variables ***
# Locators
${CART_PAGE_HEADER}              xpath=//h4[normalize-space()='Cart']
${CART_SUMMARY_HEADER}           xpath=(//span[@class='bg-secondary pr-3'])[1]
${PROCEED_TO_CHECKOUT_BUTTON}    id=checkoutBtn


*** Keywords ***
# Actions

Click on Checkout Button
    [Documentation]    Clicks the "Proceed to Checkout" button to navigate to the checkout page.
    Wait For Elements State    ${PROCEED_TO_CHECKOUT_BUTTON}   enabled    timeout=1s
    Wait Until Page Contains Element    ${CART_PAGE_HEADER}   
    Wait Until Page Contains Element   ${CART_SUMMARY_HEADER}  
    Click Element If Visible    ${PROCEED_TO_CHECKOUT_BUTTON}

