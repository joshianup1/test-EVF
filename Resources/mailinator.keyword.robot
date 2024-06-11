*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Resource    common_keyword.robot

*** Variables ***
${mailinator_url}   https://www.mailinator.com/


*** Keywords ***
Open mailinator and verify the email
    [Arguments]     ${verify_email}
    Go To    ${mailinator_url}
    Input Text    ${input_mailinator_email}    ${verify_email}
    Click Element    ${mailinator_go_button}
    Wait Until Element Is Visible    ${entry_form}
    Click Element    ${entry_form}

Verify all the form fields that is in email
    Select Frame    id:html_msg_body
    Wait Until Page Contains    Last Name
    @{form_fields}    Create List    ${form_lastname}    ${form_firstname}    ${form_email}    ${form_number}    ${form_Paragraph_text}    ${form_url}  Second Choice   Third Choice   2023-02-21   Option 2
    FOR    ${field}    IN    @{form_fields}
        Page Should Contain    ${field}
    END