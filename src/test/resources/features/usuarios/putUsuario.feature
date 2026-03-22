Feature: Actualizar usuario


  Background:
    * url baseUrl
    * def data = call read('classpath:helpers/dataGenerator.js')
    * def dataPut = call read('classpath:helpers/dataGeneratorPut.js')


  @actualizar_usuario_existente
  Scenario: Actualizar usuario existente

    # crear usuario
    Given path '/usuarios'
    And request data.user
    When method POST
    Then status 201
    * def userId = response._id

    # actualizar
    Given path '/usuarios', userId
    And request dataPut.user
    When method PUT
    Then status 200
    And match response.message == "Registro alterado com sucesso"


  @actualizar_usuario_email_duplicado
  Scenario: Actualizar usuario con un email duplicado

    # crear usuario
    Given path '/usuarios'
    And request data.user
    When method POST
    Then status 201
    * def userId = response._id

    # consultar el email del primero de la lista de usuarios
    Given path '/usuarios'
    When method GET
    Then status 200
    * def email = response.usuarios[0].email
    * print email

    # actualizar el usuario creado
    Given path '/usuarios', userId
    * set dataPut.user.email = email
    And request dataPut.user
    When method PUT
    Then status 400
    And match response.message == "Este email já está sendo usado"