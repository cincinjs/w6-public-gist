*** Settings ***
Resource                        Configs.robot
Library                         SeleniumLibrary                     ${DEFAULT_ELEMENT_TIMEOUT}
Library                         String

Resource                        ../Datas/Accounts.robot
Resource                        ../Pages/CommonKeywords.robot
Resource                        ../Pages/GistDetailPage.robot
Resource                        ../Pages/GistEditorPage.robot
Resource                        ../Pages/HeaderPage.robot
Resource                        ../Pages/HomePage.robot
Resource                        ../Pages/LoginPage.robot