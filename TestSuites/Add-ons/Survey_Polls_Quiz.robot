*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/survey_quiz_polls_keyword.robot
Resource    ../../Resources/entries_keyword.robot
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers   #auto_close = ${False}



*** Variables ***
${SCROLL_LIMIT}    300  # Adjust the scroll limit as per your requirement
*** Keywords ***
Set Scroll Limit
    [Arguments]    ${scroll_limit}
    Execute JavaScript    window.scrollTo(0, ${scroll_limit})



*** Test Cases ***
Verifying Survey Fields Functionality
    Add new form    Demo 1
    #Enable Single row
    Drag Drop All Survey Fields
    Save form and go to preview form
    fill out survey form at frontend
    Form submit and Successfull message after filling the form
    Switch to previous window
    Go to Entries from all forms
    View and Verify Survey Entries Inside Dashboard

#Verifying Quiz Functionality
 #   Add new form    Quiz Master
Verifying Quiz Fields Functionality
    Add new form    Quiz Master
    Drag and Drop all Quiz Fields
    Save form and go to preview form
    Validating Form Fields at Frontend
    Fill out all question Fields











