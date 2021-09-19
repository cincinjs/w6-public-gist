*** Settings ***
Resource                            ../Frameworks/Routers.robot

Test Timeout                        ${DEFAULT_TEST_TIMEOUT}
Test Setup                          Open Web Browser                ${HOST}
Test Teardown                       Close All Browsers

*** Variables ***


*** Test Cases ***
User should able to create public gist
    [Tags]  Regression  Smoke
    ${random_number} =      Generate Random String  8  [NUMBERS]
    ${git_description} =	Catenate    description-${random_number}
    ${git_filename} =	    Catenate    filename-${random_number}
    ${git_code} =	        Catenate    code-${random_number}\nsecond line\nthird line

    HeaderPage. Click Signin Button On Header
    LoginPage. Login Using Credentials                 ${ACCOUNTS_GITHUB_EMAIL}            ${ACCOUNTS_GITHUB_PASSWORD}
    HeaderPage. Click Add New Gist
    GistEditorPage. Choose Indent Size 4
    GistEditorPage. Choose Indent Mode Tabs
    GistEditorPage. Choose Soft Wrapped Mode
    GistEditorPage. Enter Gist Description             ${git_description}
    GistEditorPage. Enter Gist Filename                ${git_filename}
    GistEditorPage. Enter Gist Code                    ${git_code}
    GistEditorPage. Click Create Public Gist Button
    GistDetailPage. Verify Gist Data                   ${git_description}       ${git_filename}         ${git_code}

User should able to view list of gist
    [Tags]  Regression  Smoke

    HeaderPage. Click Signin Button On Header
    LoginPage. Login Using Credentials                 ${ACCOUNTS_GITHUB_EMAIL}            ${ACCOUNTS_GITHUB_PASSWORD}
    HeaderPage. Open List User Gist
    GistListPage. Verify user able to view list of user gist

User should able to view details of a gist
    [Tags]  Regression  Smoke

    HeaderPage. Click Signin Button On Header
    LoginPage. Login Using Credentials                 ${ACCOUNTS_GITHUB_EMAIL}            ${ACCOUNTS_GITHUB_PASSWORD}
    HeaderPage. Open List User Gist
    ${FILENAME}     GistListPage. Get Gist Filename On Gist List
    ${DESC}         GistListPage.Get Gist Description On Gist List
    ${CODE}         GistListPage.Get Gist Code On Gist List
    GistListPage. Click Detail Gist
    GistDetailPage.Verify Filename Text                ${FILENAME}
    GistDetailPage.Verify Desc Text                    ${DESC}
    GistDetailPage.Verify Code Text                    ${CODE}

User able to update a gist
    [Tags]  Regression  Smoke
    ${random_number} =      Generate Random String  8  [NUMBERS]
    ${git_description} =	Catenate    -updated-${random_number}
    ${git_filename} =	    Catenate    -updated-${random_number}
    ${git_code} =	        Catenate    \n${random_number}-updated

    HeaderPage. Click Signin Button On Header
    LoginPage. Login Using Credentials                 ${ACCOUNTS_GITHUB_EMAIL}            ${ACCOUNTS_GITHUB_PASSWORD}
    HeaderPage. Open List User Gist
    ${FILENAME}     GistListPage. Get Gist Filename On Gist List
    ${DESC}         GistListPage.Get Gist Description On Gist List
    ${CODE}         GistListPage.Get Gist Code On Gist List

    ${random_number} =      Generate Random String  8  [NUMBERS]
    ${git_description} =	Catenate    -updated-${random_number}
    ${git_filename} =	    Catenate    -updated-${random_number}
    ${git_code} =	        Catenate    \n${random_number}-updated


    GistListPage. Click Detail Gist
    GistDetailPage. Click Edit Button
    GistEditorPage. Enter Gist Description             ${git_description}
    GistEditorPage. Enter Gist Filename                ${git_filename}
    GistEditorPage. Enter Gist Code                    ${git_code}
    GistEditorPage. Click Update Gist Button
    GistDetailPage. Verify Gist Data                   ${DESC}${git_description}       ${FILENAME}${git_filename}         ${CODE}${git_code}

User able to delete a gist
    [Tags]  Regression  Smoke

    HeaderPage. Click Signin Button On Header
    LoginPage. Login Using Credentials                 ${ACCOUNTS_GITHUB_EMAIL}            ${ACCOUNTS_GITHUB_PASSWORD}
    HeaderPage. Open List User Gist
    ${FILENAME}     GistListPage. Get Gist Filename On Gist List
    GistListPage. Click Detail Gist
    GistDetailPage. Click Delete Button
    GistListPage.Verify Gist Deleted                   ${FILENAME}
