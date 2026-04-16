*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library    ../Resources/LoadDotenvVariables.py
Variables       ../PageObjects/AdminPageLocators.py
Variables       ../PageObjects/LoginPageLocators.py

*** Variables ***
${URL}    https://example.com
${BROWSER}    chrome
${USERNAME}    your_username
${PASSWORD}    your_password
${page_title}    Example Domain


*** Keywords ***
#User defined keywords to perform operations

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

Click Change Subscription Button
    Wait Until Element Is Visible   ${btn_changeSubscription}   timeout=10s
    click button    ${btn_changeSubscription}

Click Subscription Plan Dropdown
    click element   ${dropdown_selectPlan}

Select Subscription Plan From Dropdown
    click element   ${option_subscriptionPlan}

Click Confirm Button
    click button    ${btn_confirm}

Wait For Toaster Message to be Visible
    Wait Until Element Is Visible   ${toaster_message}  timeout=10s

isToasterMessageCorrect
    [Arguments]     ${SUCCESS_MESSAGE}
    ${GET_SUCCESS_TOASTER_MESSAGE}=     get text    ${toaster_message}
    should be equal    ${GET_SUCCESS_TOASTER_MESSAGE}   ${SUCCESS_MESSAGE}

Wait For Toaster Message to be Disappear
    Wait Until Page Does Not Contain Element    ${toaster_message}  timeout=15s

Click Devices tab
    click element   ${tab_devices}


isDevicesListPresent
    ${DEVICES_PRESENT}=    Run Keyword And Return Status    Element Should Be Visible    ${devices_table}
    ${NO_DEVICES_PRESENT}=    Run Keyword And Return Status    Page Should Contain    No devices found
    IF    ${DEVICES_PRESENT}
        BuiltIn.log to console    ✅ Devices list is visible
    ELSE IF    ${NO_DEVICES_PRESENT}
        BuiltIn.log to console    ℹ️ No devices found message is visible
    ELSE
        Fail    ❌ Neither devices list nor 'No devices found' message appeared
    END

Click Users tab
    click element   ${tab_users}

isActiveUsersLabelVisible
    [Arguments]     ${ACTIVE_USERS}
    ${TEXT_ACTIVE_USERS}    get text    ${lbl_active_users}      #gets the Active User text from given xpath & stores it in ${TEXT_ACTIVE_USERS}
    should be equal as strings    ${TEXT_ACTIVE_USERS}    ${ACTIVE_USERS}    # validates the text in ${text}

Click Admin Account Menu Dropdown
    click element   ${admin_account_menu}

Click Admin Sign Out Option
    click element   ${option_admin_account_logout}

# isAdminUserLoggedOut
#    [Arguments]     ${EXPECTED_URL}
#    ${CURRENT_LOGOUT_URL}=     get location
#    should be equal    ${CURRENT_LOGOUT_URL}   ${EXPECTED_URL}

isCurrentUrlCorrect
    [Arguments]     ${EXPECTED_URL}
    ${CURRENT_URL}=     get location
    should be equal    ${CURRENT_URL}   ${EXPECTED_URL}


Load .env Variables
    ${dotenv}=    Evaluate    __import__('Resources.LoadDotenvVariables', fromlist=['DotenvVariables']).DotenvVariables()
    ${None}=    Evaluate    ${dotenv}.set_env_variables_as_robot_variables()
