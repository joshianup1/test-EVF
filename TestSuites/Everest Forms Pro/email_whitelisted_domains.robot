*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Resource    ../../Resources/field_options_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers


*** Test Cases ***
Validating Allowed Domains
    Add new form    Contact Us
    Drag and Drop Some Fields
    Go to Email Field
    Go to Advanced Options
    Select the allowed domain dropdown and enter allowed domain in the input field
    Save form and go to preview form
    Generate fake data to fill the form
    Fill some of the form fields    ${form_Paragraph_text}    ${form_email}      ${form_number}
    Submit the form
    Verify the error message related to form
    Verify the error message related to restricted domain
    Go Back
    Fill some of the form fields    ${form_Paragraph_text}    ${form_firstname}@gmail.com      ${form_number}
    Form submit and Successfull message after filling the form


Validating Denied Domains
    Add new form    Contact Us
    Drag and Drop Some Fields
    Go to Email Field
    Go to Advanced Options
    Select the denied domain dropdown and enter denied domain in the input field
    Save form and go to preview form
    Generate fake data to fill the form
    Fill some of the form fields    ${form_Paragraph_text}    ${form_email}      ${form_number}
    Submit the form
    Verify the error message related to form
    Verify the error message related to restricted domain
    Go Back
    Fill some of the form fields    ${form_Paragraph_text}    ${form_firstname}@gmail.com      ${form_number}
    Form submit and Successfull message after filling the form