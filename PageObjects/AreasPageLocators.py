##Areas page Locators

areas_page_sidebar_title="xpath://div[contains (@class,'Sidebarstyles__StyledSidebarTitle')]"
drp_graph_days_picker="xpath://*[@data-testid='days-picker']"
option_one_days_graph="xpath://*[@data-testid='1']"
option_seven_days_graph="xpath://*[@data-testid='7']"
option_thirty_days_graph="xpath://*[@data-testid='30']"
option_one_year_graph="xpath://*[@data-testid='365']"
list_areas_name="xpath://div[contains (@class,'Sidebarstyles__StyledSidebarAreaName')]"
metrics_tab="xpath://*[@data-testid='metrics-tab']"
areas_devices_tab="xpath://*[@data-testid='devices-tab']"
schedule_tab="xpath://*[@data-testid='schedule-tab']"
about_tab="xpath://*[@data-testid='about-tab']"
metrics_air_quality_parameter="xpath://*[@data-testid='air-quality-chart-option' and contains(@class, 'ChartOptionstyles__StyledChartOption')]"
metrics_pm2_5_parameter="xpath://*[@data-testid='pm-2.5-chart-option']"
metrics_tvoc_parameter="xpath://*[@data-testid='tvoc-chart-option']"
metrics_co2_parameter="xpath://*[@data-testid='co2-chart-option']"
metrics_temperature_parameter="xpath://*[@data-testid='temperature-chart-option']"
metrics_humidity_parameter="xpath://*[@data-testid='humidity-chart-option']"
metrics_pm1_0_parameter="xpath://*[@data-testid='pm-1.0-chart-option']"
metrics_pm10_parameter="xpath://*[@data-testid='pm-10-chart-option']"
metrics_air_pressure_parameter="xpath://*[@data-testid='air-pressure-chart-option']"
metrics_occupancy_parameter="xpath://*[@data-testid='occupancy-chart-option']"
btn_close_how_is_my_air_quality_calculate_drawer= "//button[contains (@class,'Drawersstyles__StyledCloseButton')]"

METRIC_LOCATORS = {
    "Air Quality": metrics_air_quality_parameter,
    "PM2.5": metrics_pm2_5_parameter,
    "TVOC": metrics_tvoc_parameter,
    "CO2": metrics_co2_parameter,
    "Temperature": metrics_temperature_parameter,
    "Humidity": metrics_humidity_parameter,
    "PM 1.0": metrics_pm1_0_parameter,
    "PM 10": metrics_pm10_parameter,
    "Air Pressure": metrics_air_pressure_parameter,
    "Occupancy": metrics_occupancy_parameter
}