*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/entries_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers


*** Test Cases ***
Validating entries after disabling storing entry information
    Add new form    Disable entry
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Disable storing entry information
    Save form and go to preview form
    Fill the form with random data
    Form submit and Successfull message after filling the form
    Switch to previous window
    Click Entries
    Verify that page should not contain lastname
    Go to Entries from all forms
    Verify that Form entries should not be present in dashboard

Validating entries after enabling storing entry information
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Save form and go to preview form
    Fill the form with random data
    Form submit and Successfull message after filling the form
    Switch to previous window
    Click Entries
    Verify that page should contain lastname
    Go to Entries from all forms
    View Entries
    Verify all the form fields that is in entries



