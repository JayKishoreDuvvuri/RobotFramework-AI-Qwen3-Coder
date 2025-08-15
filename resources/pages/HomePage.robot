*** Settings ***
Resource    init.robot

*** Variables ***
# Locators
${CAMERA_ITEM_ADD_TO_CART}   xpath=//button[@data-id='1']
${CART_COUNT}                xpath=(//span[@id='cartCount'])[1]

*** Keywords ***
# Actions
Navigate To Camera Item
    [Documentation]    Navigates to the camera item page and adds it to the cart.
    Click Element If Visible    ${CAMERA_ITEM_ADD_TO_CART}

Check the Cart Item Count
    [Documentation]    Checks if the cart item count is 1 after adding an item.
    ${cart_count}=    Get Text    ${CART_COUNT} 
    Should Be Equal As Integers    ${cart_count}    1

Click On Shopping Cart
    [Documentation]    Clicks on the shopping cart icon to view the cart.
    Wait Until Page Contains Element    ${CART_COUNT} 
    Should Not Be Empty    ${CART_COUNT}
    Click Element If Visible    ${CART_COUNT}

