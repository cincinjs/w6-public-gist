*** Settings ***
Resource                                        ../Frameworks/Routers.robot

*** Variables ***
${field_gist_description}                       css=input[name='gist[description]']
${field_gist_filename}                          css=input[name='gist[contents][][name]']
${field_gist_code}                              css=.CodeMirror-code

${dropdown_gist_indent_mode}                    id=indent-mode
${dropdown_gist_indent_mode_space}              css=option[value='space']
${dropdown_gist_indent_mode_tabs}               css=option[value='tab']

${dropdown_gist_indent_size}                    id=indent-size
${dropdown_gist_indent_size_2}                  css=option[value='2']
${dropdown_gist_indent_size_4}                  css=option[value='4']

${dropdown_gist_wrap_mode}                      id=line-wrap-mode
${dropdown_gist_wrap_no}                        css=option[value='off']
${dropdown_gist_wrap_soft}                      css=option[value='on']

${button_gist_create_gist}                      xpath=//div[@class='BtnGroup']/button
${button_gist_create_options}                   xpath=//div[@class='BtnGroup']/button/following-sibling::details
${button_gist_create_public_gist}               xpath=//div[@class='BtnGroup']//ancestor::span[contains(text(),'Create public gist')]

*** Keywords ***
Enter Gist Description
    [Arguments]         ${DESCRIPTION}
    Wait Until Element Is Visible               ${field_gist_description}
    Input Text                                  ${field_gist_description}               ${DESCRIPTION}

Enter Gist Filename
    [Arguments]         ${FILENAME}
    Wait Until Element Is Visible               ${field_gist_filename}
    Input Text                                  ${field_gist_filename}                  ${FILENAME}

Enter Gist Code
    [Arguments]         ${CODE}
    Wait Until Element Is Visible               ${field_gist_code}
    Input Text                                  ${field_gist_code}                      ${CODE}

Click Create Public Gist Button
    Wait Until Element Is Visible               ${button_gist_create_options}
    Click Element                               ${button_gist_create_options}
    Wait Until Element Is Visible               ${button_gist_create_public_gist}
    Scroll Element Into View                    ${button_gist_create_public_gist}
    Click Element                               ${button_gist_create_public_gist}
    Wait Until Element Is Visible               ${button_gist_create_gist}
    Click Element                               ${button_gist_create_gist}

Choose Indent Mode Tabs
    Wait Until Element Is Visible               ${dropdown_gist_indent_mode}
    Click Element                               ${dropdown_gist_indent_mode}
    Wait Until Element Is Visible               ${dropdown_gist_indent_mode_tabs}
    Click Element                               ${dropdown_gist_indent_mode_tabs}

Choose Indent Size 4
    Wait Until Element Is Visible               ${dropdown_gist_indent_size}
    Click Element                               ${dropdown_gist_indent_size}
    Wait Until Element Is Visible               ${dropdown_gist_indent_size_4}
    Click Element                               ${dropdown_gist_indent_size_4}

Choose Soft Wrapped Mode
    Wait Until Element Is Visible               ${dropdown_gist_wrap_mode}
    Click Element                               ${dropdown_gist_wrap_mode}
    Wait Until Element Is Visible               ${dropdown_gist_wrap_soft}
    Click Element                               ${dropdown_gist_wrap_soft}