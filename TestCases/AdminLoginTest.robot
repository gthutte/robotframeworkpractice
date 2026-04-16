*** Settings ***
Library     SeleniumLibrary
Variables   ${ENV_FILE}
Resource   ../Resources/AdminLoginKeywords.robot

*** Variables ***
${TEST_BROWSER}    chrome
${APP_URL}     https://otl-qa.arrayviewpoint.fellowes.com/admin/login/
${CORRECT_EMAIL}    rohan_kadu@onwardgroup.com
${CORRECT_PASSWORD}    0}Av|55#N27=
${EXPECTED_SUCCESS_MESSAGE}  The organization was successfully updated
${ACTIVE_USERS}     Active Users
${EXPECTED_URL}    https://otl-qa.arrayviewpoint.fellowes.com/admin/
${page_title}   Admin Dashboard


*** Test Cases ***
To Verify Successfull Login
#    Load .env Variables
    Open My Browser     ${APP_URL}  ${TEST_BROWSER}
    Wait For Overlay To Disappear
    Enter Username      ${CORRECT_EMAIL}
    Enter Password      ${CORRECT_PASSWORD}
    Click Login Button
    builtIn.sleep   10
    Wait For Overlay To Disappear
    isCurrentUrlCorrect   ${EXPECTED_URL}


To Verify Subscription Plan Changes Successfully
    Wait For Overlay To Disappear
    Click Change Subscription Button
    Click Subscription Plan Dropdown
    Select Subscription Plan From Dropdown
    Click Confirm Button
    Wait For Toaster Message to be Visible
#    isToasterMessageCorrect     ${EXPECTED_SUCCESS_MESSAGE}
#    Wait For Toaster Message to be Disappear

To Verify Devices Tab is loaded Successfully
    Click Devices tab
    Wait For Overlay To Disappear
    isDevicesListPresent

To Verify Users Tab is loaded Successfully
    Click Users tab
    Wait For Overlay To Disappear
    isActiveUsersLabelVisible   ${ACTIVE_USERS}

To Verify User Logged Out Successfully
    Click Admin Account Menu Dropdown
    Click Admin Sign Out Option
    isCurrentUrlCorrect    ${APP_URL}

    Close My Browser
