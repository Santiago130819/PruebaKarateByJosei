Feature: Actualizar usuario en ServeRest

  Background:
    * url baseUrl

  Scenario: Actualizar información de un usuario existente
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

    # Actualizo sus datos
    * def updated = {}
    * set updated.nome = 'Usuario Actualizado ' + random
    * set updated.email = 'qa_atualizado' + random + '@qa.com'
    * set updated.password = '54321'
    * set updated.administrador = 'true'

    Given path 'usuarios', id
    And request updated
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'
