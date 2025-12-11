Feature: Listar usuarios de ServeRest

  Background:
    * url baseUrl

  Scenario: Obtener lista de usuarios exitosamente
    Given path 'usuarios'
    When method get
    Then status 200
    And match response.quantidade == '#number'
    And match response.usuarios == '#[]'
