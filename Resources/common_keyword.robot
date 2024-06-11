*** Settings ***
Library     SeleniumLibrary
Library     Builtin
Variables   ../PageObjects/locators.py
Library     FakerLibrary
Variables    credentials.py
Resource    fields_keyword.robot

#*** Variables ***
#${DRAGGABLE_ELEMENT}    xpath=//button[@id='everest-forms-add-fields-radio']
#${DROPPABLE_ELEMENT}    xpath=//div[starts-with(@class,'evf-admin-grid evf-grid-1 ui-sortable')]

*** Keywords ***
Login to Wordpress
    [Arguments]    ${username}  ${password}
    Open Browser    ${url}/wp-admin  ${browser}
    Maximize Browser Window
    Input Text    ${username_id}    ${username}
    Input Text    ${password_id}    ${password}
    Click Button    ${submit_id}

Add new form
    [Arguments]     ${form_name}
    FOR  ${i}  IN   @{click_element}
        Click Element    ${i}
    END
    Wait Until Element Is Visible   ${form_name_text}
    Input Text  ${form_name_text1}   ${form_name}
    Wait Until Page Contains Element    ${continue_button}
    Click Element   ${continue_button}


Select the date/time
    Click Element   ${date_field_click}
    Select From List By Label    ${date_field_click_month}     February
    Input Text    ${input_year_2023}    2023
    Click Element    ${date_field_click_month_date_year}

Fill all the form fields
    [Arguments]     ${form_firstname}   ${form_email}    ${form_lastname}    ${form_url}  ${form_Paragraphtext}   ${form_number}
    Wait Until Page Contains    Preview
    Select From List By Label    ${dropdown_field}   Option 2
    Input Text    ${paragraph_text_field}    ${form_Paragraphtext}
    Input Text    ${number_field}    ${form_number}
    Input Text     ${email_field}   ${form_email}
    Select the date/time
    Select Checkbox    ${checkbox_field}
    Input Text    ${url_field}    ${form_url}
    ${for_value}=   Get Element Attribute  xpath=//input[@type='radio']   name
    Log     ${for_value}
    Select Radio Button   ${for_value}    Second Choice
    Input Text   ${last_name_dynamic_locator}   ${form_lastname}
    Input Text     ${first_name_dynamic_locator}    ${form_firstname}
    Input Text    ${single_line_text_dynamic_locator}  ${form_Paragraph_text}

Fill the form with random data
    ${form_firstname}   FakerLibrary.first_name
    ${form_email}=              Set Variable     ${form_firstname}@mailinator.com
    ${form_lastname} =  FakerLibrary.last_name
    ${form_url} =  FakerLibrary.url
    ${form_Paragraph_text} =  FakerLibrary.Sentence
    ${form_number} =  FakerLibrary.Numerify
    Fill all the form fields    ${form_firstname}   ${form_email}    ${form_lastname}    ${form_url}  ${form_Paragraphtext}   ${form_number}
    Set Test Variable    ${form_lastname}
    Set Test Variable    ${form_email}
    Set Test Variable    ${form_firstname}
    Set Test Variable    ${form_url}
    Set Test Variable    ${form_Paragraph_text}
    Set Test Variable    ${form_number}

Wait until page contain preview text
    Wait Until Page Contains    Preview

Form submit and Successfull message after filling the form
    Click Element    ${form_submission_button}
    Wait Until Page Contains    Thanks for contacting us! We will be in touch with you shortly
    Page Should Contain   Thanks for contacting us! We will be in touch with you shortly

Submit the form
    Click Element    ${form_submission_button}

Fill some of the form fields
    [Arguments]     ${form_Paragraphtext}   ${form_email}    ${form_number}
    Wait Until Page Contains    Preview
    Input Text    ${paragraph_text_field}    ${form_Paragraphtext}
    Input Text    ${email_field}   ${form_email}
    Input Text    ${number_field}    ${form_number}
    Select Checkbox    ${checkbox_field}

Verify the error message related to form
    Page Should Contain    Form has not been submitted, please see the errors below.

Generate fake data to fill the form
    ${form_firstname}   FakerLibrary.first_name
    ${form_Paragraph_text} =  FakerLibrary.Sentence
    ${form_email}=              Set Variable     ${form_firstname}@mailinator.com
    ${form_number} =  FakerLibrary.Numerify
    Set Test Variable    ${form_email}
    Set Test Variable    ${form_Paragraph_text}
    Set Test Variable    ${form_number}
    Set Test Variable    ${form_firstname}

Save form and go to preview form
    #Mouse Over    ${save_form}
    Click button    ${save_form}
    Click Element    ${preview_button}
    Switch Window   new

Save the form
    Mouse Over    ${save_form}
    Click button    ${save_form}

Switch to new window
    Switch Window   new

Switch to previous window
    Switch Window   main

Go to wordpress dashboard>>Everest forms
    Click Element    ${everest_form_hover}

Mouse Over Everest Forms
    Mouse Over  ${mouse_over_everest_forms}
    Sleep    5

Go to All Forms
    Click Element    ${everest_all_forms}


