*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/CommunityDashboardLocators.py


*** Keywords ***
isHeaderTitleVisible
    [Arguments]     ${COMMUNITY_TITLE}
    Element Should Be Visible   ${header_title}

Click on Select Building Dropdown
    click element   ${drp_select_building}

Click on Select Floor Dropdown
    click element   ${drp_select_floor}

Click on Select Area Dropdown
    click element   ${drp_select_area}

Select Building from Dropdown
    [Arguments]     ${building_to_be_select}
    click element   ${option_buildings}

Select Floor from Dropdown
    [Arguments]     ${floor_to_be_select}
    click element   ${option_floors}

Select Area from Dropdown
    [Arguments]     ${area_to_be_select}
    click element   ${option_area}






