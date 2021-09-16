*** Settings ***
Resource                                            ../Frameworks/Routers.robot

*** Variables ***

## Right Side
# Non Login
${button_header_signin}                             css=div[role='navigation'] > .HeaderMenu-link.mr-3.no-underline

# Logged In
${button_header_add_gits}                           css=.Header-item.mr-0.mr-md-3 > .Header-link

*** Keywords ***
Click Signin Button On Header
    Wait Until Element Is Visible                   ${button_header_signin}
    Click Element                                   ${button_header_signin}

Click Add New Gist
    Wait Until Element Is Visible                   ${button_header_add_gits}
    Click Element                                   ${button_header_add_gits}