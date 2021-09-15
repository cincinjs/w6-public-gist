*** Settings ***
Resource                        ../Frameworks/Routers.robot


*** Keywords ***
Open Web Browser
    [Arguments]    ${URL}
    ${chrome_options}       Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --disable-infobars

    ${OS}          Evaluate             platform.system()       platform
    ${chrometype}  Set Variable If
    ...	           '${OS}' == 'Darwin'	chromedriver_mac64/chromedriver
    ...	           '${OS}' == 'Linux'	chromedriver_linux64/chromedriver
    ...	           '${OS}' == 'Windows'	chromedriver_win32/chromedriver.exe

    Run Keyword If    os.sep == '/'    Create Webdriver    Chrome    my_alias    chrome_options=${chrome_options}    executable_path=${CURDIR}/../Webdrivers/${chrometype}
    Maximize Browser Window
    Go To          ${URL}
    Set Selenium Speed              ${DEFAULT_SELENIUM_SPEED}