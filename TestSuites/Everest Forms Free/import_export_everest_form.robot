*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/tools_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers



*** Test Cases ***
Validate Export Everest Forms with Settings
    Add new form     Export Everest Form
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Save form and go to preview form
    Fill the form with random data
    Form submit and Successfull message after filling the form
    Switch to previous window
    Go to tools
    Go to Export
    Select form you want to export from dropdown
    Click export button
    Log    Form has been Export

Validate Import Everest Forms
    Go to wordpress dashboard>>Everest forms
    Go to tools
    Go to Import
    Choose file to import
    Click import form button
    Success message after importing the form
