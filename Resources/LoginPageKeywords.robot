*** Settings ***
Library     SeleniumLibrary
Variables       ../PageObjects/LoginPageLocators.py


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