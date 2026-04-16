*** Settings ***
Library     SeleniumLibrary
Library    ../Resources/LoadDotenvVariables.py
Variables       ../PageObjects/LoginPageLocators.py


*** Variables ***
${URL}    https://example.com
${BROWSER}    chrome
${USERNAME}    your_username
${PASSWORD}    your_password
${page_title}    Example Domain


*** Keywords ***
Open My Browser
    [Arguments]    ${URL}  ${BROWSER}
    open browser    ${URL}  ${BROWSER}
    Maximize Browser Window

Enter Username
    [Arguments]     ${USERNAME}
    input text      ${txt_loginUserName}    ${USERNAME}

Enter Password
    [Arguments]     ${PASSWORD}
    input text      ${txt_loginPassword}    ${PASSWORD}

Click Login Button
    click button    ${btn_login}

Wait For Overlay To Disappear
    Wait Until Page Does Not Contain Element    ${overlay}      timeout=15s

Verify Successfull Login
    [Arguments]     ${page_title}
    Wait For Overlay To Disappear
    Title Should Be     ${page_title}

Close My Browser
    close all browsers

Load .env Variables
    ${dotenv}=    Evaluate    __import__('Resources.LoadDotenvVariables').LoadDotenvVariables()
    ${None}=    Evaluate    ${dotenv}.set_env_variables_as_robot_variables()
