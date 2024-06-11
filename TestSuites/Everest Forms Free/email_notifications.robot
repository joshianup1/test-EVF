*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/individual_form_settings_email_keyword.robot
Resource    ../../Resources/mailinator.keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers


*** Test Cases ***
Validating Admin Notification
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Go to Email
    Enter the recipient's(admin) email address to receive form entry notifications
    Save form and go to preview form
    Fill the form with random data
    Form submit and Successfull message after filling the form
    Open mailinator and verify the email     ${admin_email}
    Verify all the form fields that is in email

Validating User Notification
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Go to Email
    Add new email
    Enter the recipient's(user) email address to receive form entry notifications
    Save form and go to preview form
    Fill the form with random data
    Form submit and Successfull message after filling the form
    Open mailinator and verify the email    ${form_email}
    Verify all the form fields that is in email

