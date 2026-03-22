Feature: Registrar usuario


  Background:
    * url baseUrl
    * def data = call read('classpath:helpers/dataGenerator.js')


  @registrar_usuario_valido
  Scenario: Crear usuario válido

    Given path '/usuarios'
    And request data.user
    When method POST
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"
    And match response._id == '#string'


  @registrar_usuario_email_duplicado
  Scenario: Crear usuario con email duplicado

    # crear usuario
    Given path '/usuarios'
    And request data.user
    When method POST
    Then status 201

    # repetir mismo request
    Given path '/usuarios'
    And request data.user
    When method POST
    Then status 400
    And match response.message == "Este email já está sendo usado"


  @registrar_usuario_sin_email
  Scenario: Crear usuario sin email

    Given path '/usuarios'
    * set data.user.email = ''
    And request data.user
    When method POST
    Then status 400
    And match response.email == "email não pode ficar em branco"


  @registrar_usuario_email_invalido
  Scenario: Crear usuario con email invalido

    Given path '/usuarios'
    * set data.user.email = 'cristian@'
    And request data.user
    When method POST
    Then status 400
    And match response.email == "email deve ser um email válido"