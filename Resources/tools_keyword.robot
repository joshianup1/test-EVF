*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py


*** Variables ***
@{log_files}    form-save-    form-submission-    log-

*** Keywords ***
Go to tools
     Click Element    ${click_tools}

Go to Logs
    Click Element     ${click_logs}

Select Log File By Index
    [Arguments]    ${index}
    ${log_file}    Set Variable    ${log_files}[${index}]
    Select From List By Index    log_file    ${index}

View Log Files and verify logs
    FOR    ${index}    IN RANGE    0    3
       Select Log File By Index    ${index}
       Click Element    ${click_view_button}
       Page Should Contain    ${log_files}[${index}]
    END

In dashboard logs icon should not be there
    Page Should Not Contain Element     ${click_logs}


Go to Export
  Click Element    ${click_export}

Select form you want to export from dropdown
    Wait Until Element Is Visible    ${input_everest_form}
    Input Text    ${input_everest_form}    Export Everest Form
    Press Keys      ${export_top_form}     ENTER

Click export button
    Click Element    ${export_button}

Go to Import
    Click Element    ${click_import}

Choose file to import
    Choose File    ${import_everest_form}    C:\\Users\\THEMEGRILL\\PycharmProjects\\EverestFormAutomation\\evf-export-forms-2023-08-08_11 47 23.json

Click import form button
    Click Element    ${import_button}

Success message after importing the form
    Wait Until Page Contains   Imported Successfully.
    Page Should Contain    Imported Successfully.

Choose a form you want to include to export entries
    Wait Until Element Is Visible    ${select_form_dropdown_icon}
    Click Element   ${select_form_dropdown_icon}
    Press Keys      ${None}     ENTER

Choose a form field you want to include
    Wait Until Element Is Visible    ${select_field_dropdown_icon}
    Click Element    ${select_field_dropdown_icon}
    Click Element    ${select_field_select_all_button}

Choose a additional informations you want to include
    Wait Until Element Is Visible    ${select_additional_information_icon}
    Click Element    ${select_additional_information_icon}
    Click Element    ${select_additional_information_all_button}

Select date range which include month, year and day
    Click Element    ${date_range_id}
    Select From List By Label    ${select_month_dropdown}      January
    Input Text    ${enter_year}    2023   TRUE
    Wait Until Element Is Visible    ${select_day}
    Click Element    ${select_day}
    Input Text    ${enter_another_year}    2024   TRUE
    Wait Until Element Is Visible    ${select_another_day}
    Click Element    ${select_another_day}

Export all the format(csv,json,ods,xlsx) and verify the format
    @{export_formats}    Create List    csv    json    ods    xlsx
    FOR    ${format}    IN    @{export_formats}
        Select From List By Value    ${export_formats_dropdown}    ${format}
        Click Element    ${export_entries_button}
    END
