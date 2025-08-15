*** Settings ***
Resource    ../resources/pages/LoginPage.robot
Resource    ../resources/pages/HomePage.robot
Resource    ../resources/pages/CartPage.robot
Resource    ../resources/pages/CheckoutPage.robot
Resource    ../resources/pages/ConfirmDetailsPage.robot
Resource    ../resources/pages/ThanksPage.robot
Test Setup       Open Shop Application
Test Teardown    Close All Shop Browsers

*** Test Cases ***
TC001 - Successful Login With Valid Credentials
    [Documentation]    Test that a user can log in successfully with valid credentials.
    [Tags]    Smoke    Login
    LoginPage.Login With Credentials    demo@demo.com    demo
    LoginPage.Verify Successful Login
    ${title}=    Get Page Title
    Should Contain    ${title}    SHOP | QA AUTOMATIONLAB

TC002 - Failed Login With Invalid Credentials
    [Documentation]    Test that login fails with an appropriate message for invalid credentials.
    [Tags]    Login    Negative
    LoginPage.Navigate To Login Page
    LoginPage.Enter Email    invalid@example.com
    LoginPage.Enter Password    wrongpassword
    LoginPage.Click Login Button
    LoginPage.Verify Login Error Message    Invalid email or password!  

# Test Cases for E2E Shopping Application
TC003 - E2E TEST - Complete Checkout Workflow
    [Documentation]    E2E test that completes checkout workflow.
    [Tags]    Navigation    Smoke
    LoginPage.Login With Credentials    demo@demo.com    demo
    LoginPage.Verify Successful Login
    ${title}=    Get Page Title
    Should Contain    ${title}    SHOP | QA AUTOMATIONLAB
    HomePage.Navigate To Camera Item
    HomePage.Check the Cart Item Count
    HomePage.Click On Shopping Cart
    ${title}=    Get Page Title
    Should Contain    ${title}    CART | QA AUTOMATIONLAB
    CartPage.Click on Checkout Button
    ${title}=    Get Page Title
    Should Contain    ${title}    CHECKOUT | QA AUTOMATIONLAB
    CheckoutPage.Check Checkout Page Loaded
    CheckoutPage.Fill Billing Address    
    CheckoutPage.Proceed To Payment
    ${title}=    Get Page Title
    Should Contain    ${title}    CONFIRM | QA AUTOMATIONLAB
    ConfirmDetailsPage.Check Confirm Details Page Loaded
    ConfirmDetailsPage.Assert Order Total And Place Order
    ${title}=    Get Page Title
    Should Contain    ${title}    THANKS | QA AUTOMATIONLAB
    ThanksPage.Check Thanks Page Loaded
    ThanksPage.Click Shop Again Button
    ${current_url}=  Get Url
    Should Contain    ${current_url}    shop.php
    