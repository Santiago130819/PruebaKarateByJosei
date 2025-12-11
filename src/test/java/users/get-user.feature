Feature: Obtener usuario por ID en ServeRest

  Background:
    * url baseUrl

  Scenario: Buscar usuario existente por ID
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

    # Lo consulto por ID
    Given path 'usuarios', id
    When method get
    Then status 200
    And match response._id == id
    And match response.nome == newUser.nome
    And match response.email == newUser.email

  Scenario: Buscar usuario inexistente devuelve error
    * def invalidId = 'non-existing-id-123456'
    Given path 'usuarios', invalidId
    When method get
    Then status 400
    And match response.id == '#string'