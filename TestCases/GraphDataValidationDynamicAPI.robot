*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     Collections
Variables   ${ENV_FILE}



*** Variables ***
#${BROWSER}            Chrome
#${BASE_URL}           https://otl-qa.arrayviewpoint.fellowes.com/login/
#${USERNAME}           e-sdhepale@fellowes.com
#${PASSWORD}           Onward@2023
${TOKEN}        Bearer SFMyNTY.g2gDdAAAAAJkAAhpc19hZG1pbmQABWZhbHNlZAAHdXNlcl9pZGIAAAE7bgYAGPvF6JYBYgABUYA.jDkXqiwuk1rS1c82HgAXQvi6KtRrBEnn3YP3oAXvvjo
${HEADERS}      {"Authorization": "${TOKEN}"}
${FIELD}    reset_air_index
${API_BASE_URL}    https://otl-qa.api.arrayviewpoint.net
${building_id}      3
${API_PATH}    /api/buildings/${building_id}/telemetries
${canvas}       "xpath://div[contains(@class, "Chartsstyles__StyledContainer")]//canvas"


*** Test Cases ***
Validate Dynamic Sensor Data On Graph
    Login To Application
    Capture And Validate Sensor API Data
    Get X And Y Axis From Canvas   # ${canvas}

*** Keywords ***
Login To Application
    Open Browser    ${API_BASE_URL}    ${TEST_BROWSER}
    BuiltIn.sleep   5
    input text      xpath://*[@data-testid="email-input"]    ${USERNAME}
    input text      xpath://*[@data-testid="password-input"]    ${PASSWORD}
    click button    xpath://*[@data-testid="button"]
    BuiltIn.sleep   5
    Wait Until Element Is Visible    xpath://div[contains(@class, "NavBarstyles__NavMenuWrapper")]//a[@href='/']
    ${Get_Dashboard}=    Get Text    xpath://div[contains(@class, "NavBarstyles__NavMenuWrapper")]//a[@href='/']
    Should Be Equal As Strings    ${Get_Dashboard}    Dashboard     #validate Dashboard text on screen
    BuiltIn.sleep   3

Capture And Validate Sensor API Data
     # Get current epoch time (end_date)
    ${end_epoch}=    Evaluate    int(time.time())    modules=time
    # Subtract 1 hour (3600 seconds) to get start_date
    ${start_epoch}=    Evaluate    ${end_epoch} - 86400
    #  24 hrs 	86400; 7 days 604800; 30 days 2592000; 12 months (365 days approx.)	31536000
    Log To Console    Start: ${start_epoch}
    Log To Console    End: ${end_epoch}

    # Build the full endpoint with dynamic dates
    ${endpoint}=    Set Variable    ${API_PATH}?start_date=${start_epoch}&end_date=${end_epoch}&field=${FIELD}
    # Call API
    Create Session    sensor    ${API_BASE_URL}    headers=${HEADERS}
    ${response}=    GET On Session    sensor    ${endpoint}
    Should Be Equal As Integers    ${response.status_code}    200

    ${json}=    Set Variable    ${response.json()}
#    BuiltIn.log to console    ${json}

    # Example validation
    FOR    ${entry}    IN    @{json}
        ${value}=    Get From Dictionary    ${entry}    value
        Run Keyword If    '${value}' != 'None'    Should Be True    ${value} >= 0
        Run Keyword If    '${value}' != 'None'    Should Be True    ${value} <= 500
    END

Get X And Y Axis From Canvas
#    [Arguments]    ${canvas_selector}
#    ${script}=    Catenate    SEPARATOR=
#    ...    var canvas = document.querySelector("xpath://div[contains(@class, "Chartsstyles__StyledContainer")]//canvas");
#    ...    var chart = Chart.getChart(canvas);
#    ...    return [chart.data.labels, chart.data.datasets[0].data];

    Wait Until Keyword Succeeds    10x    1s    Execute JavaScript    return !!document.querySelector('canvas[role="img"]').$chartjs

    ${chart_data}=    Execute JavaScript
    ...     var chart = document.querySelector('canvas[role="img"]').$chartjs._chart;
    ...     return {x: chart.data.labels, y: chart.data.datasets[0].data};
    Log To Console    X-axis: ${chart_data['x']}
    Log To Console    Y-axis: ${chart_data['y']}

    Close My Browser

