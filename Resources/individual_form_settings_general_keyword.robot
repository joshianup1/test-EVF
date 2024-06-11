*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Library     FakerLibrary
Variables    credentials.py

*** Variables ***
${externalURl}      https://docs.everestforms.net/

*** Keywords ***

Click individual form settings
    Click Element   ${individual_form_settings}


Enable ajax form submission
    Select Checkbox     ${ajax_checkbox}

Disable storing entry information
    Select Checkbox    ${form_entries_checkbox}

Select custom page
    Select From List By Index    ${redirect_dropdown}    1

Select External URL and Input the URL
    Select From List By Index    ${redirect_dropdown}      2
    Wait Until Element Is Visible    ${input_external_url}
    Input Text    ${input_external_url}   ${externalURl}

Unselect Enable entries dashboard analytics checkbox
    Unselect Checkbox    ${dashboard_analytics_checkbox}

Select Enable entries dashboard analytics checkbox
    Select Checkbox   ${dashboard_analytics_checkbox}

Dashboard analytics should disable
    Page Should Not Contain Element    ${dashboard_analytics_html_element}
    Page Should Not Contain     Total Submission

Dashboard analytics should enable
    Page Should Contain Element    ${dashboard_analytics_html_element}
    Wait Until Page Contains    Total Submission
    Page Should Contain     Total Submission

Verify whether page is redirect to custom page or not
    ${current_url}=    Get Location
    Should Be Equal    ${url}/sample-page/  ${current_url}

Verify whether page is redirect to external url or not
    ${current_url}=    Get Location
    Should Be Equal    ${externalURl}  ${current_url}