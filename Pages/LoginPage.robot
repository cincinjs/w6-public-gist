*** Settings ***
Resource                                        ../Frameworks/Routers.robot
*** Variables ***
# Notifcation
${text_login_error_message}                     css=[class*='flash-error'] > div[class^='container-lg']

${field_login_username_email}                   id=login_field
${field_login_pasword}                          id=password
${button_login_signin}                          css=input[name='commit']


*** Keywords ***
Enter Username Or Email
    [Arguments]    ${USERNAME}
    Wait Until Element Is Visible               ${field_login_username_email}
    Input Text                                  ${field_login_username_email}                   ${USERNAME}

Enter Password
    [Arguments]    ${PASSWORD}
    Wait Until Element Is Visible               ${field_login_pasword}
    Input Password                              ${field_login_pasword}                          ${PASSWORD}

Click Signin Button
    Wait Until Element Is Visible               ${button_login_signin}
    Click Element                               ${button_login_signin}

Login Using Credentials
    [Arguments]    ${USERNAME}      ${PASSWORD}
    Enter Username Or Email                     ${USERNAME}
    Enter Password                              ${PASSWORD}
    Click Signin Button

Verify User Got Error Message
    [Arguments]    ${MESSAGE}
    Wait Until Element Is Visible               ${text_login_error_message}
    Element Should Contain                      ${text_login_error_message}                 ${MESSAGE}                  Ignore_cae=Trues