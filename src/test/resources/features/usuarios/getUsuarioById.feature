Feature: Consultar usuario por ID


  Background:
    * url baseUrl
    * def data = call read('classpath:helpers/dataGenerator.js')


  @consultar_usuario_existente
  Scenario: Buscar usuario existente

    # crear usuario
    Given path '/usuarios'
    And request data.user
    When method POST
    Then status 201
    * def userId = response._id

    # consultarlo
    Given path '/usuarios', userId
    When method GET
    Then status 200
    And match response == read('classpath:schemas/userSchema.json')


  @consultar_usuario_inexistente
  Scenario: Buscar usuario inexistente

    Given path '/usuarios', 'abcdefghijklmnop'
    When method GET
    Then status 400
    And match response.message == "Usuário não encontrado"