*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables   ../PageObjects/ViewpointNavigationBarLocators.py
Variables   ../PageObjects/AreasPageLocators.py
Variables   ../PageObjects/DashboardPageLocators.py
Resource    ../Resources/DashboardPageKeywords.robot

*** Keywords ***

isAreasSidebarTitleVisible
    Wait Until Element Is Visible   ${areas_page_sidebar_title}
    Element Should Be Visible    ${areas_page_sidebar_title}

scrollDownPage
    Execute JavaScript    window.scrollBy(0, 1000)

scrollUpPage
    Execute JavaScript    window.scrollBy(0, -1000)

Select Last 24 Hours Graph
    click element   ${drp_graph_days_picker}
    click element   ${option_one_days_graph}

Select Last 7 Days Graph
    click element   ${drp_graph_days_picker}
    click element   ${option_seven_days_graph}

Select Last 30 Days Graph
    click element   ${drp_graph_days_picker}
    click element   ${option_thirty_days_graph}

Select Last 12 Months Graph
    click element   ${drp_graph_days_picker}
    click element   ${option_one_year_graph}

Get Areas List
    Wait Until Element Is Visible    ${list_areas_name}    10s
    ${elements}=  Get WebElements  ${list_areas_name}

    ${areas}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${areas}    ${text}
    END

    RETURN    ${areas}

Click on Given Area
    [Arguments]     ${target_area_name}
    Wait Until Element Is Visible    ${list_areas_name}    10s
    ${elements}=    Get WebElements    ${list_areas_name}
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Run Keyword If    '${text}' == '${target_area_name}'    Run Keywords    Click Element    ${el}    AND    Exit For Loop
    END

Click on Air Quality Parameter in Metrics Tab
    click element       ${metrics_air_quality_parameter}

Click on Close button of How is my Air Quality Calculated Drawer
    click element       ${btn_close_how_is_my_air_quality_calculate_drawer}

Click on PM 2.5 Parameter in Metrics Tab
    click element       ${metrics_pm2_5_parameter}

Click on TVOC Parameter in Metrics Tab
    click element       ${metrics_tvoc_parameter}

Click on CO2 Parameter in Metrics Tab
    click element       ${metrics_co2_parameter}

Click on Temperature Parameter in Metrics Tab
    click element       ${metrics_temperature_parameter}

Click on Humidity Parameter in Metrics Tab
    click element       ${metrics_humidity_parameter}

Click on PM 1.0 Parameter in Metrics Tab
   click element       ${metrics_pm1_0_parameter}

Click on PM 10 Parameter in Metrics Tab
    click element       ${metrics_pm10_parameter}

Click on Air Pressure Parameter in Metrics Tab
    click element       ${metrics_air_pressure_parameter}

Click on Occupancy Parameter in Metrics Tab
    click element       ${metrics_occupancy_parameter}

Select Comparison Parameter in Occupancy Graph
    [Arguments]     ${sensor_param}
    Select From List By Value       ${select_graph_comparison}  ${sensor_param}


Loop Through Time Ranges
    FOR    ${range}    IN    @{TIME_RANGES}
        ${result}=    Run Keyword If    '${range}' == 'Last 7 Days Graph'    Select Last 7 Days Graph
        ...    ELSE IF    '${range}' == 'Last 30 Days Graph'    Select Last 30 Days Graph
        ...    ELSE IF    '${range}' == 'Last 12 Months Graph'    Select Last 12 Months Graph
        ...    ELSE IF    '${range}' == 'Last 24 Hours Graph'    Select Last 24 Hours Graph
        Wait Until Graph Canvas Is Visible
    END

Verify Metric Graph
    [Arguments]    ${metric_name}    ${close_drawer}=False
    Run Keyword     Click On Metric Parameter   ${metric_name}
    Run Keyword If    '${close_drawer}'=='${TRUE}'      Click on Close button of How is my Air Quality Calculated Drawer
    Wait Until Graph Canvas Is Visible
    Loop Through Time Ranges
#    FOR    ${range}    IN    @{TIME_RANGES}
#        Run Keyword If    '${range}' == 'Last 7 Days Graph'    Select Last 7 Days Graph
#        ...    ELSE IF    '${range}' == 'Last 30 Days Graph'    Select Last 30 Days Graph
#        ...    ELSE IF    '${range}' == 'Last 12 Months Graph'    Select Last 12 Months Graph
#        ...    ELSE IF    '${range}' == 'Last 24 Hours Graph'    Select Last 24 Hours Graph
#        Wait Until Graph Canvas Is Visible
#    END

Click On Metric Parameter
    [Arguments]    ${metric_name}
    ${locator}=    Get From Dictionary    ${METRIC_LOCATORS}    ${metric_name}
    Click Element    ${locator}
