*** Settings ***
Resource    init.robot
Library     Collections

*** Variables ***
# Locators
${THANKS_HEADER}                  xpath=(//span[normalize-space()='Thanks'])[2]
${THANK_YOU_MESSAGE}              xpath=//h1[contains(text(),'🎉 Thank You for Your Order!')]
${ORDER_SUCCESSFULL_MESSAGE}      xpath=//p[normalize-space()='Your order has been placed successfully.']
${SHOP_AGAIN_BUTTON}              xpath=(//a[normalize-space()='Shop Again'])[1]


*** Keywords ***
# Actions
Check Thanks Page Loaded
    [Documentation]    Checks if the Thanks page is loaded by verifying the presence of key elements.
    Wait For Elements State    ${THANKS_HEADER}                 visible    timeout=1s
    Wait For Elements State    ${THANK_YOU_MESSAGE}             visible    timeout=1s
    Wait For Elements State    ${ORDER_SUCCESSFULL_MESSAGE}     visible    timeout=1s
    Wait For Elements State    ${SHOP_AGAIN_BUTTON}             enabled    timeout=1s

Click Shop Again Button
    [Documentation]    Clicks the "Shop Again" button to return to the homepage.
    Click Element If Visible    ${SHOP_AGAIN_BUTTON}