*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Variables    credentials.py
Resource    common_keyword.robot


*** Keywords ***
Go to Entries from all forms
    Click Element    ${click_all_form}
    Mouse Over    ${form_mouse_hover}
    Click Element    ${form_click_entries}

Click Entries
    Go To   ${url}/wp-admin/admin.php?page=evf-entries

View Entries
    Click Element    ${view_entry}
    Page Should Contain    View Entry



Verify all the form fields that is in entries
    @{form_fields}    Create List    ${form_lastname}    ${form_firstname}    ${form_email}    ${form_number}    ${form_Paragraph_text}    ${form_url}  Second Choice   Third Choice   2023-02-21   Option 2
    FOR    ${field}    IN    @{form_fields}
        Page Should Contain    ${field}
    END

Verify that page should not contain lastname
    Page Should Not Contain    ${form_lastname}

Verify that page should contain lastname
    Page Should Contain    ${form_lastname}

Verify that Form entries should not be present in dashboard
    Page Should Contain    Whoops, it appears you do not have any form entries yet.