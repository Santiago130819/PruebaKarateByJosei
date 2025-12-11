Feature: Eliminar usuario en ServeRest

  Background:
    * url baseUrl

  Scenario: Eliminar usuario existente
    * def random = java.lang.System.currentTimeMillis()
    * def newUser = {}
    * set newUser.nome = 'Usuario QA ' + random
    * set newUser.email = 'qa' + random + '@qa.com'
    * set newUser.password = '12345'
    * set newUser.administrador = 'true'

    # Creo el usuario
    Given path 'usuarios'
    And request newUser
    When method post
    Then status 201
    * def id = response._id

    # Lo elimino
    Given path 'usuarios', id
    When method delete
    Then status 200
    And match response.message == 'Registro excluído com sucesso'

  Scenario: Intentar eliminar usuario inexistente
    * def invalidId = 'non-existing-id-123456'
    Given path 'usuarios', invalidId
    When method delete
    Then status 200
    And match response.message == 'Nenhum registro excluído'
