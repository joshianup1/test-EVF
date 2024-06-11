*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/field_options_keyword.robot
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers

*** Test Cases ***
Validating as unique in email field
    Add new form    Unique Email
    Drag and Drop Some Fields
    Go to Email Field
    Enable validate as unique checkbox
    Save form and go to preview form
    Generate fake data to fill the form
    Fill some of the form fields    ${form_Paragraph_text}    ${form_email}      ${form_number}
    Form submit and Successfull message after filling the form
    Go Back
    Fill some of the form fields    ${form_Paragraph_text}    ${form_email}      ${form_number}
    Submit the form
    Verify the error message related to form
    Verify the error message related to unique email

Validating as unique in firstname field
    Add new form    Unique First name
    Drag and Drop firstname field
    Go to firstname field
    Enable validate as unique checkbox
    Save form and go to preview form
    Wait Until Page Contains    Preview
    Input the firstname
    Form submit and Successfull message after filling the form
    Go Back
    Input the firstname
    Submit the form
    Verify the error message related to form
    Verify the error message related to unique firstname

