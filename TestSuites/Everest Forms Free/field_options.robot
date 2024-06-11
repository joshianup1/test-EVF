*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/fields_keyword.robot
Resource    ../../Resources/common_keyword.robot
Resource    ../../Resources/individual_form_settings_general_keyword.robot
Resource    ../../Resources/field_options_keyword.robot
Test Setup      Login to Wordpress    ${wp_username}   ${wp_password}
Test Teardown   Close All Browsers


*** Test Cases ***
Validating Field Options>>Change label
    Add new form   Contact us
    Drag and Drop General Fields
    Drag and Drop Advanced fields
    Change label of fields
    Save form and go to preview form
    Verify whether label is changed or not

#Validating Field Options>>Required
#    Add new form   Contact us
#    Drag and Drop General Fields
#    Drag and Drop Advanced fields
#    Generate dynamic locator
#    @{locators_list}=  Get Webelements  ${locators_edit_form}
#    FOR   ${locator}   IN   @{locators_list}
#        Click Element    ${locator}
#        ${unique}=   Get Element Attribute    //div[@class='everest-forms-field-option-row everest-forms-field-option-row-required ']    id
#        log     ${unique}
#    END
