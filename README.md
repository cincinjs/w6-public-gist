# w6-public-gist
Gist Github Automation Using Robot Framework

## Prerequisite
1. Python3
2. Robot Framework -> pip3 install robotframework
3. SeleniumLibrary -> pip3 install robotframework-seleniumlibrary

## Config
1. Open file w6-public-gist > Datas > Accounts.robot
2. Change `%{ACCOUNTS_GITHUB_EMAIL}` to your github email. ex email@gmail.com
3. Change `%{ACCOUNTS_GITHUB_PASSWORD}` to your github password. ex 12345678
4. Change `%{ACCOUNTS_GITHUB_USERNAME}` to your github username. ex cincinjs001

## How to run?
1. Make sure you have config accounts on Accounts.robot
2. cd w6-public-gist
3. robot -d Reports Tests
