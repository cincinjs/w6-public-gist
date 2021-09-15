*** Settings ***
Resource                        Configs.robot
Library                         SeleniumLibrary                     ${DEFAULT_ELEMENT_TIMEOUT}
Library                         String

Resource                        ../Datas/Accounts.robot
Resource                        ../Pages/CommonKeywords.robot