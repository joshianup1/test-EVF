*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers


*** Test Cases ***
Validate redirect to custom page after form submission
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Select custom page
    Save form and go to preview form
    Fill the form with random data
    Submit the form
    Verify whether page is redirect to custom page or not


Validate redirect to External URL after form submission
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Select External URL and Input the URL
    Save form and go to preview form
    Fill the form with random data
    Submit the form
    Verify whether page is redirect to external url or not


