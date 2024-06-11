*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Library     FakerLibrary


*** Keywords ***
Go to Email
    Click Element    ${email_settings}

Enter the recipient's(admin) email address to receive form entry notifications
    Clear Element Text    ${email_smart_tag}
    ${first_name}   FakerLibrary.first_name
    ${admin_email}=              Set Variable     ${first_name}@mailinator.com
    Input Text    ${recipient_email_admin}    ${admin_email}
    Set Test Variable    ${admin_email}

Add new email
    Click Element    ${add_new_email_button}
    Input Text       ${input_title}      User Notification
    Click Element    ${click_ok_button}

Enter the recipient's(user) email address to receive form entry notifications
    Wait Until Element Is Visible    ${admin_email_smart_tag}
    Clear Element Text      ${admin_email_smart_tag}
    Click Element    ${click_smart_tag_dropdown}
    Mouse Over    ${select_email_smart_tag}
    Click Element    ${select_email_smart_tag}