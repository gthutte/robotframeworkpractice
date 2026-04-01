*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    BuiltIn
Library     Collections
Variables   ${ENV_FILE}


*** Variables ***
#${BROWSER}            Chrome
#${BASE_URL}           https://otl-qa.arrayviewpoint.fellowes.com/login/
#${USERNAME}           e-sdhepale@fellowes.com
#${PASSWORD}           Onward@2023
${API_BASE}     https://otl-qa.api.arrayviewpoint.net
${TOKEN}        Bearer SFMyNTY.g2gDdAAAAAJkAAhpc19hZG1pbmQABWZhbHNlZAAHdXNlcl9pZGIAAAE7bgYAGPvF6JYBYgABUYA.jDkXqiwuk1rS1c82HgAXQvi6KtRrBEnn3YP3oAXvvjo
${HEADERS}      {"Authorization": "${TOKEN}"}
${ENDPOINT}     /api/buildings/3/telemetries?start_date=1748241735&end_date=1748846535&field=reset_air_index



*** Test Cases ***
Validate Dynamic Sensor Data On Graph
#    Login To Application
#    Select Building
    Capture And Validate Sensor API Data

*** Keywords ***
Login To Application
    Open Browser    ${APP_URL}    ${TEST_BROWSER}
    BuiltIn.sleep   5
    input text      xpath://*[@data-testid="email-input"]    ${CORRECT_EMAIL}
    input text      xpath://*[@data-testid="password-input"]    ${CORRECT_PASSWORD}
    click button    xpath://*[@data-testid="button"]
    BuiltIn.sleep   10
    Wait Until Element Is Visible    xpath://div[contains(@class, "NavBarstyles__NavMenuWrapper")]//a[@href='/']
    ${Get_Dashboard}=    Get Text    xpath://div[contains(@class, "NavBarstyles__NavMenuWrapper")]//a[@href='/']
    Should Be Equal As Strings    ${Get_Dashboard}    Dashboard     #validate Dashboard text on screen
    BuiltIn.sleep   3

Capture And Validate Sensor API Data
    Create Session    sensor    ${API_BASE}    headers=${HEADERS}    verify=False
    ${response}=    GET On Session    sensor    ${ENDPOINT}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    BuiltIn.log to console    ${json}

#######################################################################
    # Example: validate the first value is in expected range
#    ${first_entry}=    Get From List    ${json}    0      #0 is the index of the item in json
#    BuiltIn.log to console    ${first_entry}
#    ${first_value}=    Get From Dictionary    ${first_entry}    value
##    ${first_value}=    Set Variable    ${NONE}
#    Should Not Be Equal    ${first_value}    ${NONE}     #check if value is not NULL
#    Should Be True    ${first_value} >= 0
#    Should Be True    ${first_value} <= 500
########################################################################

    FOR    ${entry}    IN    @{json}
    ${value}=    Get From Dictionary    ${entry}    value
    BuiltIn.log to console    Air Quality values: ${value}
    Should Be True    ${value} >= 0
    Should Be True    ${value} <= 100
    END


Select Building
    click element    xpath://div[contains(@class, "NavBarstyles__StyledSelectedOption")]      #click on Building selection dropdown
    BuiltIn.sleep    3
    click element     xpath://div[contains(@class, 'NavBarstyles__StyledBuildingPickerOption') and text()='Fellowes FOP']      #selecting specified building from Building selection dropdown
    builtin.sleep    10
#    ${List_Elements}=   get list items  xpath:(//div[contains(@class, "Chartsstyles__StyledPicker")]//div//select)[2]
##    BuiltIn.log to console    ${List_Elements}
#    BuiltIn.sleep    2
#    select from list by label     xpath:(//div[contains(@class, "Chartsstyles__StyledPicker")]//div//select)[2]   Last 12 months
#    BuiltIn.sleep    10
#    ${Selected_Option}=     get selected list label    xpath:(//div[contains(@class, "Chartsstyles__StyledPicker")]//div//select)[2]
#    BuiltIn.log to console    Selected option of dashboard: ${Selected_Option}
#    Should Be Equal As Strings    ${selected_option}    Last 12 months

    Close My Browser