*** Settings ***
Library     SeleniumLibrary
Library    BuiltIn
Variables   ${ENV_FILE}
Resource   ../Resources/LoginPageKeywords.robot
Resource   ../Resources/ViewpointNavigationBarKeywords.robot
Resource   ../Resources/AreasPageKeywords.robot
Resource   ../Resources/DashboardPageKeywords.robot

*** Variables ***
#${TEST_BROWSER}    chrome
#${APP_URL}     https://otl-qa.arrayviewpoint.fellowes.com/login/
#${CORRECT_EMAIL}    e-sdhepale@fellowes.com
#${CORRECT_PASSWORD}    Onward@2023
#${EXPECTED_URL}    https://otl-qa.arrayviewpoint.fellowes.com/login/
${page_title}   Areas
${area_to_select}   Testw
@{TIME_RANGES}          Last 7 Days Graph    Last 30 Days Graph    Last 12 Months Graph    Last 24 Hours Graph
@{COMPARISON_PARAMS}    pm2_5_in    voc    co2      reset_air_index
@{METRICS_TO_VERIFY}
...    Air Quality    ${TRUE}
...    PM2.5          ${FALSE}
...    TVOC           ${FALSE}
...    CO2            ${FALSE}
...    Temperature    ${FALSE}
...    Humidity       ${FALSE}
...    PM 1.0         ${FALSE}
...    PM 10          ${FALSE}
...    Air Pressure   ${FALSE}


*** Test Cases ***
To Verify Successfull Login
    Open My Browser     ${APP_URL}  ${TEST_BROWSER}
    Wait For Overlay To Disappear
    Enter Username      ${CORRECT_EMAIL}
    Enter Password      ${CORRECT_PASSWORD}
    Click Login Button
    builtIn.sleep   2
    Wait For Overlay To Disappear

To Verify Areas page is clickable and visible
    Click on Areas Page
    isAreasSidebarTitleVisible
    builtIn.sleep   5

To Verify Graph Comparison is working on Areas Page   ## Verify Areas graph comparison
    Wait Until Graph Canvas Is Visible
    scrollDownPage
    Click on Graph Comparison Dropdown
    Select Building For Comparison By Index
    Wait Until Graph Canvas Is Visible
    #builtIn.sleep   5

Verify All Metric Graphs
    FOR    ${metric}    ${needs_drawer_close}    IN    @{METRICS_TO_VERIFY}
        Verify Metric Graph    ${metric}    ${needs_drawer_close}
    END

To Verify Occupancy Graph          ### Verified the Occupancy graph against Air Quality,PM2.5,TVOC and CO2
    Click on Occupancy Parameter in Metrics Tab
    Wait Until Graph Canvas Is Visible

    Loop Through Time Ranges          ### Loop for checking 24hrs, 7 days, 30 days & 12 months

    FOR    ${param}    IN    @{COMPARISON_PARAMS}
        Select Comparison Parameter in Occupancy Graph    ${param}
        Wait Until Graph Canvas Is Visible
        Loop Through Time Ranges
    END

To Verify Given Area is available in list and Clickable  ## Selecting and verifying the given area
    ${areas}=    Get Areas List
    Click on Given Area    ${area_to_select}
    builtIn.sleep   5

    Close My Browser