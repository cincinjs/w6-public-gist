*** Settings ***
Resource                                ../Frameworks/Routers.robot

*** Variables ***
${text_detail_gist_desc}                css=[itemprop='about']
${text_detail_gist_filename}            css=.user-select-contain
${text_detail_gist_code}                css=tbody

*** Keywords ***
Verify Gist Created
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
