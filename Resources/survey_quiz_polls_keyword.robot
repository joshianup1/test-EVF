*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
# Library     FakerLibrary
Variables    credentials.py
Resource    fields_keyword.robot



*** Keywords ***


New Form Fill Up
    Click Element    ${everest_form_hover}
    Click Element    (//a[contains(text(),'Add New')])[4]
    Click Element    ${start_from_scratch}
    Sleep    5
    Input Text      //a[@class='current']     Demo Form
    Click Element    //button[normalize-space()='Continue']


Enable Single row
    Wait Until Element Is Visible    ${grid}
    Mouse Over    ${grid}
    Wait Until Element Is Visible    ${edit}
    Click Element    ${edit}
    Wait Until Element Is Visible    ${single_col}
    Click Element    ${single_col}

Hide General Advance and Payment Fields
    Wait Until Page Contains Element    ${general_field}
    Click Element    ${general_field}
    Wait Until Page Contains Element    ${advance_field}
    Click Element    ${advance_field}
    Wait Until Page Contains Element    ${payment_field}
    Click Element    ${payment_field}


Drag Drop All Survey Fields
   Enable Single row
   Hide General Advance and Payment Fields
   FOR    ${i}  IN   @{survey_fields}
        Mouse Over   ${i}
        Scroll Element Into View    ${i}
        Drag And Drop    ${i}    ${target_survey}
   END


# Verify that all field exist on front end


fill out survey form at frontend
    Wait Until Page Contains Element    ${select_yes_no}
    Click Element     ${select_yes_no}
    Click Element    //tbody/tr[1]/td[2]
    Execute JavaScript    window.scrollTo(0, 200)
    Click Element    ${select_likert_opt1}  #Likert_QN.1
    Click Element    ${select_likert_opt2}
    Click Element    ${select_likert_opt3}
    Click Element    ${select_star_rating}

Verify all the form fields that is in entries
    @{form_fields}    Create List    ${form_lastname}    ${form_firstname}    ${form_email}    ${form_number}    ${form_Paragraph_text}    ${form_url}  Second Choice   Third Choice   2023-02-21   Option 2
    FOR    ${field}    IN    @{form_fields}
        Page Should Contain    ${field}
    END

View and Verify Survey Entries Inside Dashboard
    Click Element    ${view_entry}
    Page Should Contain     xyz

Drag and Drop all Quiz Fields   #For Quiz
    Enable Single row
    FOR    ${i}    IN    @{all_quiz_fields}
        #Mouse Over    ${i}
        #Scroll Element Into View    ${i}
        Drag And Drop    ${i}    ${target_survey}
        Sleep    5
#        Wait Until Element Is Visible    ${grid}
    END

Validating Form Fields at Frontend
     FOR    ${field}    IN    @{all_quiz_fields}
         Wait Until Element Is Visible    ${field}
         Element Should Be Visible    ${field}
     END


Fill out all question Fields
    Wait Until Element Is Visible    ${select_from_dropdown}
    Select From List By Label        ${select_from_dropdown}   Option 3
    Wait Until Element Is Visible    ${select_from_multiple}
    Click Element    ${select_from_multiple}







