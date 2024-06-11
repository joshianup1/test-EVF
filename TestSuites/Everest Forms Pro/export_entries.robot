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
Validate Export Entries
    Add new form     Export Entries
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Save form and go to preview form
    Fill the form with random data
    Form submit and Successfull message after filling the form
    Switch to previous window
    Go to tools
    Go to Export
    Choose a form you want to include to export entries
    Choose a form field you want to include
    Choose a additional informations you want to include
    Select date range which include month, year and day
    Export all the format(csv,json,ods,xlsx) and verify the format



