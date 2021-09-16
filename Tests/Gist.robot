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
    GistDetailPage. Verify Gist Created                ${git_description}       ${git_filename}         ${git_code}

