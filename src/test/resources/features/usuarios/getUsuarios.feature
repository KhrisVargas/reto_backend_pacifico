Feature: Consultar lista de usuarios


  Background:
    * url baseUrl


  @consultar_usuarios
  Scenario: Obtener lista de usuarios

    Given path '/usuarios'
    When method GET
    Then status 200
    And match each response.usuarios == read('classpath:schemas/userSchema.json')