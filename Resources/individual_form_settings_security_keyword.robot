*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Resource   common_keyword.robot
Library    user_ip.py
Library     FakerLibrary

*** Keywords ***
Go to anti-spam and security
    Click Element    ${security_settings}

Enter the ip which you want to block
    ${get_user_ip}  Get Public Ip
    Input Text    ${blacklist_ip}    ${get_user_ip}
    Set Test Variable    ${get_user_ip}
    
Verify the error message related to ip
    Page Should Contain    The ip "${get_user_ip}" is blocked, please contact the administrator


Enter the email which you want to block
    Input Text    ${blacklist_email}   ${form_email}


Verify the error message related to blacklist email
    Page Should Contain    The email "${form_email}" is blocked, please use another email.

Enter the words you want to block
    Input Text   ${blacklist_words}   ${form_email}

Verify the error message related to blacklist words
    Page Should Contain    The word "${form_email}" is blacklist words, Please remove this word.