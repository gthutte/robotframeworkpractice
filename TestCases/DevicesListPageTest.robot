*** Settings ***
Library     SeleniumLibrary
Library    BuiltIn
Resource    ../Resources/LoginPageKeywords.robot
Resource    ../Resources/ViewpointNavigationBarKeywords.robot

*** Variables ***
${TEST_BROWSER}    chrome
${APP_URL}     https://otl-qa.arrayviewpoint.fellowes.com/login/
${CORRECT_EMAIL}    e-sdhepale@fellowes.com
${CORRECT_PASSWORD}    Onward@2023
${EXPECTED_URL}    https://otl-qa.arrayviewpoint.fellowes.com/login/]
${page_title}   Dashboard

*** Test Cases ***
To Verify Successfully Login
    Open My Browser     ${APP_URL}  ${TEST_BROWSER}
    Wait For Overlay To Disappear
    Enter Username      ${CORRECT_EMAIL}
    Enter Password      ${CORRECT_PASSWORD}
    Click Login Button
    builtIn.sleep   5
    Wait For Overlay To Disappear
    Verify Successfull Login    ${page_title}

To Verify Devices tab is visible and clickable in Navigation Bar
    Click on Devices Page
    Wait For Overlay To Disappear
