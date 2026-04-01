*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables   ../PageObjects/DeviceListPageLocators.py

*** Keywords ***

 isMyDevicesHeadingVisible
    Wait Until Element Is Visible   ${devices_page_header}
    Element Should Be Visible    ${devices_page_header}

 isAddDeviceButtonVisible
    Wait Until Element Is Visible   ${btn_add_device}
    Element Should Be Visible    ${btn_add_device}

 isSearchInputVisibleOnDeviceListPage
    Wait Until Element Is Visible   ${search_input}
    Element Should Be Visible    ${search_input}