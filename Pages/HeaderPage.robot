*** Settings ***
Resource                                            ../Frameworks/Routers.robot

*** Variables ***

## Right Side
# Non Login
${button_header_signin}                             css=div[role='navigation'] > .HeaderMenu-link.mr-3.no-underline

# Logged In
${button_header_add_gits}                           xpath=//div[@id='user-links']//preceding-sibling::*//a[@aria-label='Create new gist']
${button_header_user_profile}                       xpath=//div[@id='user-links']/child::details

# User Profile
${text_header_profile_username}                     css=a[role='menuitem'] > strong[class$='target']
${menu_header_profile_your_gist}                    xpath=//div[@id='user-links']//details-menu/child::a[contains(text(),'Your gists')]

*** Keywords ***
Click Signin Button On Header
    Wait Until Element Is Visible                   ${button_header_signin}
    Click Element                                   ${button_header_signin}

Click Add New Gist
    Wait Until Element Is Visible                   ${button_header_add_gits}
    Click Element                                   ${button_header_add_gits}

Click User Profile
    Wait Until Element Is Visible                   ${button_header_user_profile}
    Click Element                                   ${button_header_user_profile}

Open List User Gist
    Click User Profile
    Wait Until Element Is Visible                   ${menu_header_profile_your_gist}
    Click Element                                   ${menu_header_profile_your_gist}

Verify User Successfully Logged In
    [Arguments]    ${USERNAME}
    Click User Profile
    Wait Until Element Is Visible                   ${text_header_profile_username}
    Element Should Contain                          ${text_header_profile_username}                 ${USERNAME}         ignore_case=True