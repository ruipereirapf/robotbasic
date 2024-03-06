*** Variables ***

@{MONTHS}    January    February    March    April    May    June    July    August    September    October    November    December

*** Test Cases ***

Test Case 01 - Print List
    Print list

*** Keywords ***

Print list
    Log to Console    message=${months}[0]
    Log to Console    message=${months}[1]
    Log to Console    message=${months}[2]
    Log to Console    message=${months}[3]
    Log to Console    message=${months}[4]
    Log to Console    message=${months}[5]
    Log to Console    message=${months}[6]
    Log to Console    message=${months}[7]
    Log to Console    message=${months}[8]
    Log to Console    message=${months}[9]
    Log to Console    message=${months}[10]
    Log to Console    message=${months}[11]