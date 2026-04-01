*** Settings ***
Library     SeleniumLibrary
Library    BuiltIn
Variables   ${ENV_FILE}
Resource   ../Resources/LoginPageKeywords.robot
Resource   ../Resources/ViewpointNavigationBarKeywords.robot
Resource   ../Resources/DashboardPageKeywords.robot

*** Variables ***
#${TEST_BROWSER}    chrome
#${APP_URL}     https://otl-qa.arrayviewpoint.fellowes.com/login/
#${CORRECT_EMAIL}    e-sdhepale@fellowes.com
#${CORRECT_PASSWORD}    Onward@2023
#${EXPECTED_URL}    https://otl-qa.arrayviewpoint.fellowes.com/login/
${page_title}   Dashboard
${header_title}         Select Location
${building_to_select}   Fellowes Itasca
${pm25_title}       PM 2.5
${tvoc_title}       TVOC
${co2_title}        CO₂
${history_title}    History

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

To Verify Graph Comparison is working on Dashboard Page
    Click on Dashboard Page
    Click on Building Selection Dropdown
    Select Given building from Building Dropdown    ${building_to_select}
    Wait Until Graph Canvas Is Visible
    Click on Graph Comparison Dropdown
    Select Building For Comparison By Index
    Wait Until Graph Canvas Is Visible

To Verify See More Link is Visible
    isSeeMoreLinkVisible

To Verify See All Areas Link is Visible
    isSeeAllAreasLinkVisible

To Verify Current Air Quality Label is Visible
    IsCurrentAirQualityLabelVisible

To Verify Current Air Quality Value is Visible
    isCurrentAirQualityValueVisible

To Verify Current Air Quality Status is Visible
    isCurrentAirQualityStatusVisible

To Verify PM2.5 Title is Visible
    isPM25TitleVisible      ${pm25_title}

To Verify TVOC Title is Visible
    isTVOCTitleVisible      ${tvoc_title}

To Verify CO2 Title is Visible
    isCO2TitleVisible      ${co2_title}

To Verify History Title is Visible
    isHistoryTitleVisible      ${history_title}

    Close My Browser