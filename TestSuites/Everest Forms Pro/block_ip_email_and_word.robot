*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/individual_form_settings_security_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers


*** Test Cases ***
Validating IP Block feature
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Go to anti-spam and security
    Enter the ip which you want to block
    Save form and go to preview form
    Fill the form with random data
    Submit the form
    Verify the error message related to ip

Validating Email Black List
    Add new form    Contact us
    Drag and Drop Some Fields
    Click individual form settings
    Go to anti-spam and security
    Generate fake data to fill the form
    Enter the email which you want to block
    Save form and go to preview form
    Fill some of the form fields    ${form_Paragraph_text}    ${form_email}      ${form_number}
    Submit the form
    Verify the error message related to form
    Verify the error message related to blacklist email

Validating Blacklisted Words
    Add new form    Contact us
    Drag and Drop Some Fields
    Click individual form settings
    Go to anti-spam and security
    Generate fake data to fill the form
    Enter the words you want to block
    Save form and go to preview form
    Fill some of the form fields    ${form_Paragraph_text}    ${form_email}      ${form_number}
    Submit the form
    Verify the error message related to form
    Verify the error message related to blacklist words