*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/DashboardPageLocators.py

*** Keywords ***

Wait Until Graph Canvas Is Visible
    Wait Until Element Is Visible    ${graph_canvas}

Click on Graph Comparison Dropdown
    click element   ${select_graph_comparison}
    Wait Until Element Is Visible    ${select_graph_comparison}    timeout=2s

Select Building For Comparison By Index
    Select From List By Index    ${select_graph_comparison}    1

isSeeMoreLinkVisible
    Wait Until Element Is Visible    ${see_more_link}    timeout=5s
    Element Should Be Visible   ${see_more_link}

isSeeAllAreasLinkVisible
    Element Should Be Visible   ${see_all_areas_link}

isCurrentAirQualityLabelVisible
    Element Should Be Visible   ${lbl_current_air_quality_index}

isCurrentAirQualityValueVisible
    Element Should Be Visible   ${current_air_quality_index_value}

isCurrentAirQualityStatusVisible
    Element Should Be Visible   ${current_air_quality_index_status}

isPM25TitleVisible
    [Arguments]     ${title_pm25}
    ${pm_25_metric_summary_title}=    Set Variable    xpath://*[(contains(@class,'MetricSummarystyles__StyledTitle') and text()='${title_pm25}')]
    Element Should Be Visible    ${pm_25_metric_summary_title}

isTVOCTitleVisible
    [Arguments]     ${title_tvoc}
    ${tvoc_metric_summary_title}=    Set Variable    xpath://*[(contains(@class,'MetricSummarystyles__StyledTitle') and text()='${title_tvoc}')]
    Element Should Be Visible    ${tvoc_metric_summary_title}

isCO2TitleVisible
    [Arguments]     ${title_CO2}
    ${CO2_metric_summary_title}=    Set Variable    xpath://*[(contains(@class,'MetricSummarystyles__StyledTitle') and text()='${title_CO2}')]
    Element Should Be Visible    ${CO2_metric_summary_title}

isHistoryTitleVisible
    [Arguments]     ${title_history}
    ${history_title}=    Set Variable    xpath://*[(contains(@class,'Chartsstyles__StyledHeader') and text()='${title_history}')]
    Element Should Be Visible    ${history_title}