*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Library     FakerLibrary

*** Variables ***
@{name of fields}   First Name  Last Name  Dropdown  Date / Time
...                 Paragraph Text  Number  Email  Checkboxes
...                 Single Line Text  Multiple Choice  Website / URL



*** Keywords ***
Drag and Drop General Fields
    Wait Until Element Is Visible    ${grid}
    Mouse Over    ${grid}
    Wait Until Element Is Visible    ${edit}
    Click Element    ${edit}
    Click Element    ${single_col}
    FOR    ${i}  IN   @{fields}
        Mouse Over   ${i}
        Scroll Element Into View    ${i}
        Drag And Drop    ${i}    ${target}
    END

Generate dynamic locator
    ${for_value_firstname}=   SeleniumLibrary.Get Element Attribute  xpath=//div[@data-field-type='first-name']   data-field-id
    log   ${for_value_firstname}
    ${first_name_dynamic_locator}  Set Variable  //input[@name='everest_forms[form_fields][${for_value_firstname}]']
    Set Test Variable    ${first_name_dynamic_locator}
    ${for_value_lastname}=  SeleniumLibrary.Get Element Attribute  xpath=//div[@data-field-type='last-name']   data-field-id
    log   ${for_value_lastname}
    ${last_name_dynamic_locator}  Set Variable  //input[@name='everest_forms[form_fields][${for_value_lastname}]']
    Set Test Variable    ${last_name_dynamic_locator}
    ${for_value_single_line_text}=   SeleniumLibrary.Get Element Attribute  xpath=//div[@data-field-type='text']   data-field-id
    log   ${for_value_single_line_text}
    ${single_line_text_dynamic_locator}  Set Variable  //input[@name='everest_forms[form_fields][${for_value_single_line_text}]']
    Set Test Variable    ${single_line_text_dynamic_locator}


Drag and Drop Advanced fields
    Wait Until Element Is Visible    ${general_field_dropdown}
    Click Element    ${general_field_dropdown}
    Mouse Over    ${date_time}
    Drag And Drop    ${date_time}    ${target}
    Mouse Over    ${website_url}
    Drag And Drop    ${website_url}  ${target}
    Sleep    2


All the fields should be in the form
    FOR    ${i}   IN  @{name of fields}
        Wait Until Page Contains    ${i}
        Page Should Contain  ${i}
        Log   ${i} is in form
    END

All the fields should not be in the form
    FOR    ${i}   IN  @{name of fields}
        Page Should Not Contain  ${i}
        Log   ${i} is in form
    END

Drag and Drop Some Fields
    Wait Until Element Is Visible    ${grid}
    Mouse Over    ${grid}
    Wait Until Element Is Visible    ${edit}
    Click Element    ${edit}
    Click Element    ${single_col}
    FOR    ${i}  IN   @{four_fields}
        Mouse Over   ${i}
        Scroll Element Into View    ${i}
        Drag And Drop    ${i}    ${target}
    END