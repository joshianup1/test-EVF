*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py


*** Keywords ***
Click on global settings
    Click Element    ${global_settings}

Enable log checkbox
    Select Checkbox    ${log_checkbox}

Disable log checkbox
    Unselect Checkbox    ${log_checkbox}

Save the settings and verify
    Click Element    ${save_settings}
    Page Should Contain   Your settings have been saved.




