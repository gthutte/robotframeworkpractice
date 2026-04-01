*** Settings ***
Library     SeleniumLibrary
Library    BuiltIn
Resource   ../Resources/LoginPageKeywords.robot
Resource   ../Resources/ViewpointNavigationBarKeywords.robot
Resource   ../Resources/CommunityDashboardKeywords.robot
Variables   ${ENV_FILE}


*** Variables ***
#${TEST_BROWSER}    chrome
#${APP_URL}     https://otl-qa.arrayviewpoint.fellowes.com/login/
#${CORRECT_EMAIL}    e-sdhepale@fellowes.com
#${CORRECT_PASSWORD}    Onward@2023
#${EXPECTED_URL}    https://otl-qa.arrayviewpoint.fellowes.com/login/
${page_title}   Dashboard
${header_title}         Select Location
${building_to_select}   Fellowes Itasca
${floor_to_select}      Second Floor
${area_to_select}       DEV POOL



*** Test Cases ***
To Verify Successfull Login
    Open My Browser     ${APP_URL}  ${TEST_BROWSER}
    Wait For Overlay To Disappear
    Enter Username      ${CORRECT_EMAIL}
    Enter Password      ${CORRECT_PASSWORD}
    Click Login Button
    builtIn.sleep   10
    Wait For Overlay To Disappear
    Wait For Overlay To Disappear
    Verify Successfull Login    ${page_title}

To Verify Community Dashboard is Selected from Account Menu
    Click on Account Menu
    Select Community Dashboard from Account Menu
    builtIn.sleep   10
    Wait For Overlay To Disappear

To Verify Location is selected successfully    ### Select Building Floor and Area
#    isHeaderTitleVisible    ${header_title}
    Click on Select Building Dropdown
    Select Building from Dropdown   ${building_to_select}
    builtIn.sleep   10
    Click on Select Floor Dropdown
    Select Floor from Dropdown      ${floor_to_select}
    builtIn.sleep   10
    Click on Select Area Dropdown
    Select Area from Dropdown       ${area_to_select}
    builtIn.sleep   10

    Close My Browser