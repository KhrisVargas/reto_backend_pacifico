Feature: Eliminar usuario


  Background:
    * url baseUrl
    * def data = call read('classpath:helpers/dataGenerator.js')


  @eliminar_usuario_existente
  Scenario: Eliminar usuario existente

    # crear usuario
    Given path '/usuarios'
    And request data.user
    When method POST
    Then status 201
    * def userId = response._id

    # eliminar
    Given path '/usuarios', userId
    When method DELETE
    Then status 200
    And match response.message == "Registro excluído com sucesso"


  @eliminar_usuario_inexistente
  Scenario: Eliminar usuario inexistente

    Given path '/usuarios', 'abcdefghijklmnop'
    When method DELETE
    Then status 200
    And match response.message == "Nenhum registro excluído"