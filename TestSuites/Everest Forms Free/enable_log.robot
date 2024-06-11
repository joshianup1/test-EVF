*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/global_settings_keyword.robot
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/tools_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Library     FakerLibrary
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers

*** Test Cases ***
Validating the working of enable log
    Go to wordpress dashboard>>Everest forms
    Click on global settings
    Enable log checkbox
    Save the settings and verify
    Add new form   Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Save form and go to preview form
    Fill the form with random data
    Form submit and Successfull message after filling the form
    Switch to previous window
    Go to tools
    Go to Logs
    View Log Files and verify logs


Validating the working of disable log
    Go to wordpress dashboard>>Everest forms
    Click on global settings
    Disable log checkbox
    Save the settings and verify
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Save form and go to preview form
    Fill the form with random data
    Form submit and Successfull message after filling the form
    Switch to previous window
    Go to tools
    In dashboard logs icon should not be there
