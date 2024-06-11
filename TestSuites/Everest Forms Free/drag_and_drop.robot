*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Resource    ../../Resources/field_options_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers


*** Test Cases ***
Validating Form Builder Drag and Drop Feature
    Add new form   Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Save form and go to preview form
    All the fields should be in the form

