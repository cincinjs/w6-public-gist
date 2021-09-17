*** Settings ***
Resource                                        ../Frameworks/Routers.robot
*** Variables ***
${tab_list_all_gist}                            css=.js-selected-navigation-item.selected.UnderlineNav-item
${text_list_counter}                            css=.Counter

${text_list_filename}                           xpath=//a[@data-hovercard-type='user']/following-sibling::a/strong
${text_list_desc}                               xpath=//a[@data-hovercard-type='user']/parent::span/following-sibling::span
${text_list_code}                               css=div[id*=file-filename]

*** Keywords ***
Verify user able to view list of user gist
    Wait Until Element Is Visible               ${tab_list_all_gist}
    Element Should Contain                      ${tab_list_all_gist}                All gists
    Element Should Be Visible                   ${tab_list_all_gist}
    Element Should Be Visible                   ${text_list_counter}
    Wait Until Element Is Visible               ${text_list_filename}
    Element Should Be Visible                   ${text_list_filename}
    Element Should Be Visible                   ${text_list_desc}
    Wait Until Element Is Visible               ${text_list_code}
    Element Should Be Visible                   ${text_list_code}

Click detail gist
    Wait Until Element Is Visible               ${text_list_filename}
    Click Element                               ${text_list_filename}

Get gist filename on gist list
    Wait Until Element Is Visible               ${text_list_filename}
    ${FILENAME} =       Get Text                ${text_list_filename}
    [Return]     ${FILENAME}

Get gist description on gist list
    Wait Until Element Is Visible               ${text_list_desc}
    ${DESC} =           Get Text                ${text_list_desc}
    [Return]     ${DESC}

Get gist code on gist list
    Wait Until Element Is Visible               ${text_list_code}
    ${CODE} =           Get Text                ${text_list_code}
    [Return]     ${CODE}