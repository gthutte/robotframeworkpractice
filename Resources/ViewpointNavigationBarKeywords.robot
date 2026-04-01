*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/ViewpointNavigationBarLocators.py


*** Keywords ***

isFellowesLogoVisible
    Wait Until Element Is Visible   ${fellowes_logo}
    Element Should Be Visible    ${fellowes_logo}

Click on Building Selection Dropdown
    click element   ${drp_building_selection}

Select Given building from Building Dropdown
    [Arguments]     ${Building_to_be_select}
    click element   xpath://div[@data-testid='building-option' and text()='${Building_to_be_select}']

Wait For Building Option To Be Visible In Building Dropdown
    [Arguments]     ${Building_to_be_select}
    Wait Until Element Is Visible    ${option_building_selection}    timeout=2s

Click on Dashboard Page
    click element   ${dashboard_page}

Click on Areas Page
    click element   ${areas_page}

Click on Devices Page
    click element   ${devices_page}

Click on Maintenance Page
    click element   ${maintenance_page}

Click on Integrations Page
    click element   ${integrations_page}

isSubscriptionPlanButtonVisible
    Element Should Be Visible    ${btn_subscription_plan}

isSubscriptionPlanButtonCorrect
    [Arguments]     ${expected_subscription_button}
    ${get_subscription_button_text}=    Get Text    ${btn_subscription_plan}
    Should Be Equal As Strings    ${get_subscription_button_text}    ${expected_subscription_button}

isAccountMenuVisible
    Element Should Be Visible    ${user_account_menu}

Click on Account Menu
    click element   ${user_account_menu}

Select Community Dashboard from Account Menu
    click element   ${option_community_dashboard}

Select Settings from Account Menu
    click element   ${option_settings}

Select Support from Account Menu
    click element   ${option_support}




