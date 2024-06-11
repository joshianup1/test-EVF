*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Test Cases ***
Wait For Some Time
    [Documentation]    This test case waits for a specified time.
    Sleep    2s    # Wait for 2 seconds

Another Example
    [Documentation]    Another test case using Sleep.
    Sleep    1m    # Wait for 1 minute
