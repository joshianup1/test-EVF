*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py


*** Variables ***
${unique_first_name}    Bishal
@{name of fields}   First Name  Last Name  Dropdown  Date / Time
...                 Paragraph Text  Number  Email  Checkboxes
...                 Single Line Text  Multiple Choice  Website / URL
${count1}   ${1}

*** Keywords ***
Go to Email Field
     Click Element    ${click_email}

Enable validate as unique checkbox
    Click Element    ${validate_as_unique_checkbox}

Verify the error message related to unique email
    Page Should Contain    Email already exists.

Drag and Drop firstname field
    Wait Until Element Is Visible    ${grid}
    Mouse Over    ${grid}
    Wait Until Element Is Visible    ${edit}
    Click Element    ${edit}
    Click Element    ${single_col}
    Mouse Over   ${first_name}
    Drag And Drop    ${first_name}    ${target}


Go to firstname field
    Wait Until Element Is Visible    ${click_firstname}
    Click Element    ${click_firstname}

Input the firstname
    Input Text    ${first_name_field_individual}    ${unique_first_name}


Verify the error message related to unique firstname
    Page Should Contain    This field value needs to be unique.

Go to Advanced Options
    Click Element    ${advanced_options}

Select the allowed domain dropdown and enter allowed domain in the input field
    Input Text    ${allowed_domain}    gmail.com

Select the denied domain dropdown and enter denied domain in the input field
    Select From List By Label    ${select_denied_domain}    Denied Domains
    Input Text    ${denied_domain}    mailinator.com

Verify the error message related to restricted domain
    Page Should Contain    The domain "mailinator.com" is restricted, please use another email.


Change label of fields
    @{locators_list}=  Get Webelements  ${locators_edit_form}
    FOR   ${locator}   IN   @{locators_list}
        ${name}=  Get Text    ${locator}
        ${name}=  Evaluate  "${name}".replace('*', '')
        Click Element    ${locator}
        Input Text  css:input[value='${name}']  Label${count1}    True
        Log To Console    ${name}
        ${count1}=  Evaluate    ${count1}+${1}
    END

Verify whether label is changed or not
    Wait Until Page Contains    Preview
    FOR    ${counter}    IN RANGE    ${1}    ${12}
        Page Should Contain    Label${counter}
    END