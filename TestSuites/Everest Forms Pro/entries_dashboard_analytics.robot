*** Settings ***
Library     SeleniumLibrary
Library    Screenshot
Library      AutoRecorder  mode=suite
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/entries_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers


*** Test Cases ***
Validating disable entries dashboard analytics
    Add new form    Contact us
    Drag and Drop Some Fields
    Click individual form settings
    Unselect Enable entries dashboard analytics checkbox
    Save form and go to preview form
    Generate fake data to fill the form
    Fill some of the form fields    ${form_Paragraph_text}    ${form_email}      ${form_number}
    Form submit and Successfull message after filling the form
    Switch to previous window
    Click Entries
    Dashboard analytics should disable

Validating enable entries dashboard analytics
    Add new form    Contact us
    Drag and Drop Some Fields
    Click individual form settings
    Select Enable entries dashboard analytics checkbox
    Save form and go to preview form
    Generate fake data to fill the form
    Fill some of the form fields    ${form_Paragraph_text}    ${form_email}      ${form_number}
    Form submit and Successfull message after filling the form
    Switch to previous window
    Click Entries
    Dashboard analytics should enable


