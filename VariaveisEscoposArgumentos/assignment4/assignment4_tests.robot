*** Variables ***

&{DAYS_PER_MONTH}    january=31    february=29    march=31    april=30    may=31    june=30    july=31    august=31    september=30    october=31    november=30    december=31

*** Test Cases ***

Test Case 01 - Print Dict
    Print dict

*** Keywords ***

Print dict
    Log To Console    message=Mês: January - Dias: ${DAYS_PER_MONTH.january}
    Log To Console    message=Mês: February - Dias: ${DAYS_PER_MONTH.february}
    Log To Console    message=Mês: March - Dias: ${DAYS_PER_MONTH.march}
    Log To Console    message=Mês: April - Dias: ${DAYS_PER_MONTH.april}
    Log To Console    message=Mês: May - Dias: ${DAYS_PER_MONTH.may}
    Log To Console    message=Mês: June - Dias: ${DAYS_PER_MONTH.june}
    Log To Console    message=Mês: July - Dias: ${DAYS_PER_MONTH.july}
    Log To Console    message=Mês: August - Dias: ${DAYS_PER_MONTH.august}
    Log To Console    message=Mês: September - Dias: ${DAYS_PER_MONTH.september}
    Log To Console    message=Mês: October - Dias: ${DAYS_PER_MONTH.october}
    Log To Console    message=Mês: November - Dias: ${DAYS_PER_MONTH.november}
    Log To Console    message=Mês: December - Dias: ${DAYS_PER_MONTH.december}
