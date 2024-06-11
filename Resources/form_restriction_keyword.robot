*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Resource    common_keyword.robot
Library       day_month_year.py

*** Variables ***
@{entry_periods}    total_entries    day    week    month    year
${password_unlock}  Skeng123


*** Keywords ***
Go to form restriction
     Click Element    link:Form Restriction

Enable max number of entries checkbox
    Click Element    id:max-number-entries


Limits entries to a specified number
    Input Text    id:max-entry-number    1

Select total entries , per day, per week, per month, per year from dropdown and verify error message
  ${select_dropdown}=    Set Variable    id:everest-forms-panel-field-form_restriction-entry_period
    FOR    ${period}    IN    @{entry_periods}
        Select From List By Value    ${select_dropdown}    ${period}
        Save form and go to preview form
        Wait Until Page Contains    Maximum number of entries exceeded.
        Page Should Contain    Maximum number of entries exceeded.
        Switch to previous window
    END

Enable(Enable to hide the form with a password )checkbox
    Click Element    id:password-form

Type in the password needed to unlock the form
    Input Text    id:everest-forms-panel-field-form_restriction-password_form_password    ${password_unlock}

Page should contain message related to password protected
    Wait Until Page Contains    This form is password protected.
    Page Should Contain    This form is password protected.

Type the password you want to unlock the form and click on submit button
    Input Text    css:input[name='everest-forms[password_form_password]']   ${password_unlock}
    Click Element    xpath://button[@type='submit']

Enable (Enable this to deny submission if the submitted form is empty) checkbox
    Click Element    id:empty-submission

Enable required checkbox of email only
    Click Element    xpath://label[normalize-space()='Required']

Verify the error message related to submission of empty form
    Page Should Contain    Sorry, you cannot submit an empty form.

Enable(Enable this to deny submission if the submitted form is from a selected country) checkbox
    Click Element    id:country-restriction

Choose country which you want to restrict from dropdown
    Select From List By Label    id:everest-forms-panel-field-form_restriction-restricted_country   Nepal

Verify the error message related to restrict country
    Wait Until Page Contains    Sorry, this form cannot be submitted from your country.
    Page Should Contain    Sorry, this form cannot be submitted from your country.

Enable(Enable this to show the form to logged in users only) checkbox
    Click Element    id:logged-in-form

Copy shortcode
    Click Element    id:copy-shortcode

Go to dashboard>>pages
    Click Element    xpath://div[contains(text(),'Pages')]

Add new page
    Click Element    link:Add New

Give the title in the page
    Wait Until Page Contains    Add title
    Input Text    xpath://h1[@role='textbox']    user_restriction

Paste the form shortcode in the page
    Click Element    xpath://p[@aria-label='Add default block']
    Press Keys  ${None}     CTRL+v

Click on publish button multiple times
    Click Element    xpath://button[normalize-space()='Publish']
    Click Element    xpath://button[@class='components-button editor-post-publish-button editor-post-publish-button__button is-primary']

Click on view page
    Wait Until Element Is Visible    link:View Page
    Click Element    link:View Page

Verify the url of the page
    Wait Until Page Contains    user_restriction
    ${current_url}=    Get Location
    Should Be Equal    ${url}/user_restriction/  ${current_url}

Page should not contain message>>You must be logged in to submit the form.
    Page Should Not Contain    You must be logged in to submit the form.

Open url in private browser without logged in
    Open Browser    ${url}/user_restriction/  ${browser}     options=add_argument("-private")

Page should contain message>>You must be logged in to submit the form.
    Wait Until Page Contains    user_restriction
    Page Should Contain    You must be logged in to submit the form.

Go to dashboard>>pages the delete the page permanently you made earlier
    Login to Wordpress    ${wp_username}   ${wp_password}
    Click Element    xpath://div[contains(text(),'Pages')]
    Mouse Over    xpath://strong[contains(.,'user_restriction')]
    Click Element    link:Trash
    Click Element    xpath://li[@class='trash']
    Click Element    id:delete_all
    Page Should Contain    permanently deleted.

Enable(Enable this to display forms only on specified schedules) checkbox
     Click Element    id:form-scheduling

Select today's day
    ${day_name_locator}    Get Day Name Locator
    Select Checkbox    ${day_name_locator}

Select all days
    Wait Until Element Is Visible    id:everest-forms-panel-field-form_restriction-allday
    Select Checkbox    id:everest-forms-panel-field-form_restriction-allday

Unselect all days
    Wait Until Element Is Visible    id:everest-forms-panel-field-form_restriction-allday
    Unselect Checkbox    id:everest-forms-panel-field-form_restriction-allday

Verify the error message>>Form submission is not open yet
    Wait Until Page Contains    Form submission is not open yet.
    Page Should Contain    Form submission is not open yet.

Select tomorrow's day
    Wait Until Element Is Visible    id:everest-forms-panel-field-form_restriction-allday
    ${day_name_tomorrow_locator}    Get Day Name Tomorrow Locator
    Select Checkbox    ${day_name_tomorrow_locator}

Enable(Enable this to display forms only on specified date schedules) checkbox
    Click Element    id:date-scheduling

Select submission starts date from the calendar(2023/september/19)past date
    Click Element    id:everest-forms-panel-field-form_restriction-submission_date_start
    Select From List By Label    xpath:(//select[@class='flatpickr-monthDropdown-months'])[1]     September
    Input Text    xpath://input[@class='numInput cur-year']    2023
    Click Element    xpath:(//span[@aria-label='September 19, 2023'][normalize-space()='19'])[1]

Select submission ends date from the calendar(2025/september/17)future date
    Click Element    id:everest-forms-panel-field-form_restriction-submission_date_end
    Select From List By Label    xpath:(//select[@class='flatpickr-monthDropdown-months'])[2]     September
    Input Text    xpath:(//input[@aria-label='Year'])[2]    2025
    Click Element    xpath://span[@aria-label='September 17, 2025']

Select submission starts date from the calendar(2025/september/15)future date
    Click Element    id:everest-forms-panel-field-form_restriction-submission_date_start
    Select From List By Label    xpath:(//select[@class='flatpickr-monthDropdown-months'])[1]     September
    Input Text    xpath://input[@class='numInput cur-year']    2025
    Click Element    xpath:(//span[@aria-label='September 15, 2025'][normalize-space()='15'])[1]


Select submission end date from the calendar(2023/september/20)past date
    Click Element    id:everest-forms-panel-field-form_restriction-submission_date_end
    Select From List By Label    xpath:(//select[@class='flatpickr-monthDropdown-months'])[2]     September
    Input Text    xpath:(//input[@aria-label='Year'])[2]    2023
    Click Element    xpath:(//span[@aria-label='September 20, 2023'][normalize-space()='20'])[2]

Show the message>>Form submission is not open yet
    Wait Until Page Contains    Form submission is not open yet.
    Page Should Contain    Form submission is not open yet.

Show the message>>Form submission has been closed
    Wait Until Page Contains    Form submission has been closed.
    Page Should Contain    Form submission has been closed.

Enable time scheduling schedule
    Click Element    id:time-scheduling

Select submission starts time(7)
    Click Element    id:everest-forms-panel-field-form_restriction-submission_time_start
    Input Text    xpath:(//input[@aria-label='Hour'])[3]    7     True

Select submission ends time(20)
    Click Element    id:everest-forms-panel-field-form_restriction-submission_time_end
    Input Text    xpath:(//input[@aria-label='Hour'])[4]    20    True

Select submission starts time(1)
    Click Element    id:everest-forms-panel-field-form_restriction-submission_time_start
    Input Text    xpath:(//input[@aria-label='Hour'])[3]    1     True

Select submission ends time(6)
    Click Element    id:everest-forms-panel-field-form_restriction-submission_time_end
    Input Text    xpath:(//input[@aria-label='Hour'])[4]    6    True

Select submission starts time(21)
    Click Element    id:everest-forms-panel-field-form_restriction-submission_time_start
    Input Text    xpath:(//input[@aria-label='Hour'])[3]    21     True

Select submission ends time(23)
    Click Element    id:everest-forms-panel-field-form_restriction-submission_time_end
    Input Text    xpath:(//input[@aria-label='Hour'])[4]    23    True