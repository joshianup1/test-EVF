*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Library     FakerLibrary
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers

*** Test Cases ***
Validating Form Submission While Enabling Ajax Form Submission
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Enable ajax form submission
    Save form and go to preview form
    Fill the form with random data
    Form submit and Successfull message after filling the form


Validating Form Submission While Disabling Ajax Form Submission
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Save form and go to preview form
    Fill the form with random data
    Form submit and Successfull message after filling the form


