*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary
Library    String
Library    Collections

*** Keywords ***

Make a new user
    ${RANDOM_WORD}       Word
    ${RANDOM_WORD}       Convert To Lower Case    ${RANDOM_WORD}
    Set Test Variable    ${TEST_EMAIL}    ${RANDOM_WORD}@email.com
    Log    ${TEST_EMAIL}

Register the user at ServeRest
    [Arguments]    ${TEST_EMAIL}    ${WANTED_STATUS}
    ${RANDOM_NAME}        Name
    ${RANDOM_PASSWORD}    Password

    Set Test Variable    ${NAME}        ${RANDOM_NAME}
    Set Test Variable    ${PASSWORD}    ${RANDOM_PASSWORD}

    ${BODY}        Create Dictionary
    ...            nome=${NAME}
    ...            email=${TEST_EMAIL}
    ...            password=${PASSWORD}
    ...            administrador=true
    Log            ${BODY}

    Make Session on ServeRest

    ${ANSWER}    POST On Session
    ...          alias=ServeRest
    ...          url=/usuarios
    ...          json=${BODY}
    ...          expected_status=${WANTED_STATUS}
    
    Log          ${ANSWER.json()}
    IF  ${ANSWER.status_code} == 201
        Set Test Variable    ${ID_USER}          ${ANSWER.json()["_id"]}
    END
    
    Set Test Variable    ${SERVER_ANSWER}    ${ANSWER.json()}

Make Session on ServeRest
    ${HEADERS}    Create Dictionary
    ...           accept=application/json
    ...           Content-Type=application/json
    
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${HEADERS}

Verify if the user was registered
    Log    ${SERVER_ANSWER}
    Dictionary Should Contain Item    ${SERVER_ANSWER}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${SERVER_ANSWER}    _id

Register again the same user
    Register the user at ServeRest    ${TEST_EMAIL}    WANTED_STATUS=400

Verify if the API does not allow the same user to register again
    Dictionary Should Contain Item    ${SERVER_ANSWER}    message    Este email já está sendo usado

Consult new user data
    ${CONSULT_ANSWER}    GET On Session    alias=ServeRest    url=/usuarios/${ID_USER}    expected_status=200
    Set Test Variable    ${CONST_ANSWER}    ${CONSULT_ANSWER.json()}

Check new user data
    Log    ${CONST_ANSWER}
    Dictionary Should Contain Item    ${CONST_ANSWER}    nome             ${NAME}
    Dictionary Should Contain Item    ${CONST_ANSWER}    email            ${TEST_EMAIL}
    Dictionary Should Contain Item    ${CONST_ANSWER}    password         ${PASSWORD}
    Dictionary Should Contain Item    ${CONST_ANSWER}    administrador    true
    Dictionary Should Contain Item    ${CONST_ANSWER}    _id              ${ID_USER}

Login with created user
    [Arguments]    ${TEST_EMAIL}    ${PASSWORD}

    ${LOGIN_BODY}    Create Dictionary
    ...              email=${TEST_EMAIL}
    ...              password=${PASSWORD}
    
    Make Session on ServeRest
    
    ${LOGIN_ANWSER}    POST On Session
    ...                alias=ServeRest
    ...                url=/login
    ...                json=${LOGIN_BODY}
    ...                expected_status=200
    
    Log    ${LOGIN_ANWSER.json()}

    Set Test Variable    ${LOGIN_ANWSER}    ${LOGIN_ANWSER.json()}
    
Verify if login was successful
    Log    ${LOGIN_ANWSER}
    Dictionary Should Contain Item    ${LOGIN_ANWSER}    message    Login realizado com sucesso
    Dictionary Should Contain Key    ${LOGIN_ANWSER}    authorization
