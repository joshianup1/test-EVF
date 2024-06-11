*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Resource    ../../Resources/field_options_keyword.robot
Resource    ../../Resources/form_restriction_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers


*** Test Cases ***
Validating Entry Limitation (Limits entries to a specified number)
    Add new form    Contact us
    Drag and Drop Some Fields
    Click individual form settings
    Go to form restriction
    Save form and go to preview form
    Generate fake data to fill the form
    Fill some of the form fields    ${form_Paragraph_text}    ${form_email}      ${form_number}
    Form submit and Successfull message after filling the form
    Switch to previous window
    Enable max number of entries checkbox
    Limits entries to a specified number
    Select total entries , per day, per week, per month, per year from dropdown and verify error message

Validating Password Restriction (Enable this to hide the form with a password)
    Add new form    Contact us
    Drag and Drop Some Fields
    Click individual form settings
    Go to form restriction
    Enable(Enable to hide the form with a password )checkbox
    Type in the password needed to unlock the form
    Save form and go to preview form
    Page should contain message related to password protected
    Type the password you want to unlock the form and click on submit button
    Generate fake data to fill the form
    Fill some of the form fields    ${form_Paragraph_text}    ${form_email}      ${form_number}
    Form submit and Successfull message after filling the form

Validating Form Submission (Enable this to deny submission if the submitted form is empty)
    Add new form    Contact us
    Drag and Drop Some Fields
    Go to Email Field
    Enable required checkbox of email only
    Click individual form settings
    Go to form restriction
    Enable (Enable this to deny submission if the submitted form is empty) checkbox
    Save form and go to preview form
    wait until page contain preview text
    Submit the form
    Verify the error message related to submission of empty form

Validating Form Restriction by country (Enable this to deny submission if the submitted form is from a selected country)
    Add new form    Contact us
    Drag and Drop Some Fields
    Click individual form settings
    Go to form restriction
    Enable(Enable this to deny submission if the submitted form is from a selected country) checkbox
    Choose country which you want to restrict from dropdown
    Save form and go to preview form
    Verify the error message related to restrict country
    
Validating User Restriction (Enable this to show the form to logged in users only)
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Go to form restriction
    Enable(Enable this to show the form to logged in users only) checkbox
    Save the form
    Copy shortcode
    Go to dashboard>>pages
    Add new page
    Give the title in the page
    Paste the form shortcode in the page
    Click on publish button multiple times
    Click on view page
    Verify the url of the page
    All the fields should be in the form
    Page should not contain message>>You must be logged in to submit the form.
    Open url in private browser without logged in
    Page should contain message>>You must be logged in to submit the form.
    All the fields should not be in the form
    Go to dashboard>>pages the delete the page permanently you made earlier

Validating Form Scheduling for day(Enable this to display forms only on specified schedules(specified day))
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Go to form restriction
    Enable(Enable this to display forms only on specified schedules) checkbox
    Select today's day
    Save form and go to preview form
    Wait until page contain preview text
    All the fields should be in the form
    Switch to previous window
    Select all days
    Save form and go to preview form
    Wait until page contain preview text
    All the fields should be in the form
    Switch to previous window
    Unselect all days
    Save form and go to preview form
    Verify the error message>>Form submission is not open yet
    All the fields should not be in the form
    Switch to previous window
    Select tomorrow's day
    Save form and go to preview form
    Verify the error message>>Form submission is not open yet
    All the fields should not be in the form

Validating Form Scheduling for date(Enable this to display forms only on specified date schedules)
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Generate dynamic locator
    Click individual form settings
    Go to form restriction
    Enable(Enable this to display forms only on specified schedules) checkbox
    Enable(Enable this to display forms only on specified date schedules) checkbox
    Select all days
    Select submission starts date from the calendar(2023/september/19)past date
    Select submission ends date from the calendar(2025/september/17)future date
    Save form and go to preview form
    Wait until page contain preview text
    All the fields should be in the form
    Switch to previous window
    Select submission starts date from the calendar(2025/september/15)future date
    Save form and go to preview form
    Show the message>>Form submission is not open yet
    All the fields should not be in the form
    Switch to previous window
    Select submission starts date from the calendar(2023/september/19)past date
    Select submission end date from the calendar(2023/september/20)past date
    Save form and go to preview form
#    Show the message>>Form submission has been closed
    Show the message>>Form submission is not open yet
    All the fields should not be in the form


Validating Time Scheduling for time(Enable this to display forms only on specified time schedules)
    Add new form    Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Click individual form settings
    Go to form restriction
    Enable(Enable this to display forms only on specified schedules) checkbox
    Select all days
    Enable time scheduling schedule
    Select submission starts time(7)
    Select submission ends time(20)
    Save form and go to preview form
    Wait until page contain preview text
    All the fields should be in the form
    Switch to previous window
    Select submission starts time(1)
    Select submission ends time(6)
    Save form and go to preview form
    #   Show the message>>Form submission has been closed
    Show the message>>Form submission is not open yet
    Switch to previous window
    Select submission starts time(21)
    Select submission ends time(23)
    Save form and go to preview form
    Show the message>>Form submission is not open yet










