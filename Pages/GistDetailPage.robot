*** Settings ***
Resource                                ../Frameworks/Routers.robot

*** Variables ***
# Top
${button_detail_edit}                   css=a[class='btn btn-sm'][aria-label*='Edit this Gist']
${button_detail_delete}                 css=button[class^=btn-danger]

${text_detail_gist_desc}                css=[itemprop='about']
${text_detail_gist_filename}            css=.user-select-contain
${text_detail_gist_code}                css=tbody

*** Keywords ***
Verify Gist Data
    [Arguments]    ${DESC}      ${FILENAME}     ${CODE}
    Verify Desc Text                    ${DESC}
    Verify Filename Text                ${FILENAME}
    Verify Code Text                    ${CODE}

Verify Desc Text
    [Arguments]    ${DESC}
    Wait Until Element Is Visible       ${text_detail_gist_desc}
    Element Should Be Visible           ${text_detail_gist_desc}
    Element Text Should Be              ${text_detail_gist_desc}            ${DESC}

Verify Filename Text
    [Arguments]    ${FILENAME}
    Wait Until Element Is Visible       ${text_detail_gist_filename}
    Element Should Be Visible           ${text_detail_gist_filename}
    Element Text Should Be              ${text_detail_gist_filename}        ${FILENAME}

Verify Code Text
    [Arguments]    ${CODE}
    Wait Until Element Is Visible       ${text_detail_gist_code}
    Element Should Be Visible           ${text_detail_gist_code}
    Element Should Contain              ${text_detail_gist_code}            ${CODE}

Click Edit Button
    Wait Until Element Is Visible       ${button_detail_edit}
    Click Element                       ${button_detail_edit}

Click Delete Button
    Wait Until Element Is Visible       ${button_detail_delete}
    Click Element                       ${button_detail_delete}
    Handle Alert	                    action=ACCEPT

Get Gist Filename On Gist Detail
    Wait Until Element Is Visible               ${text_detail_gist_filename}
    ${FILENAME} =       Get Text                ${text_detail_gist_filename}
    [Return]     ${FILENAME}

Get Gist Description On Gist List
    Wait Until Element Is Visible               ${text_detail_gist_desc}
    ${DES} =           Get Text                 ${text_detail_gist_desc}
    [Return]     ${DES}

Get Gist Code On Gist List
    Wait Until Element Is Visible               ${text_detail_gist_code}
    ${CODE} =           Get Text                ${text_detail_gist_code}
    [Return]     ${CODE}