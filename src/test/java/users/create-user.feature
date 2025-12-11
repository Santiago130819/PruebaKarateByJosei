Feature: Crear usuarios en ServeRest

  Background:
    * url baseUrl

  Scenario: Crear usuario con datos válidos
    * def random = java.lang.System.currentTimeMillis()
    * def newUser = {}
    * set newUser.nome = 'Usuario QA ' + random
    * set newUser.email = 'qa' + random + '@qa.com'
    * set newUser.password = '12345'
    * set newUser.administrador = 'true'

    Given path 'usuarios'
    And request newUser
    When method post
    Then status 201
    And match response._id == '#string'
    And match response.message == 'Cadastro realizado com sucesso'

  Scenario: No permitir registrar usuario con email repetido
    * def random = java.lang.System.currentTimeMillis()
    * def newUser = {}
    * set newUser.nome = 'Usuario QA ' + random
    * set newUser.email = 'qa' + random + '@qa.com'
    * set newUser.password = '12345'
    * set newUser.administrador = 'true'

    Given path 'usuarios'
    And request newUser
    When method post
    Then status 201

    # Intento de registrar de nuevo con el mismo email
    Given path 'usuarios'
    And request newUser
    When method post
    Then status 400
    And match response.message == '#string'
