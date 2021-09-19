*** Settings ***
Resource                            ../Frameworks/Routers.robot

Test Timeout                        ${DEFAULT_TEST_TIMEOUT}
Test Setup                          Open Web Browser                ${HOST}
Test Teardown                       Close All Browsers

*** Variables ***


*** Test Cases ***
User should able to login using valid credentials
    [Tags]  Regression  Smoke

    HeaderPage. Click Signin Button On Header
    LoginPage. Login Using Credentials                 ${ACCOUNTS_GITHUB_EMAIL}            ${ACCOUNTS_GITHUB_PASSWORD}
    HeaderPage. Verify User Successfully Logged In     ${ACCOUNTS_GITHUB_USERNAME}

User should can't login using invalid password
    [Tags]  Regression  Smoke

    HeaderPage. Click Signin Button On Header
    LoginPage. Login Using Credentials                 ${ACCOUNTS_GITHUB_EMAIL}            1234567890
    LoginPage. Verify User Got Error Message           Incorrect username or password.

