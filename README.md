# Reto 2 - API Usuarios ServeRest con Karate

Proyecto Maven con Karate DSL para automatizar el CRUD de `/usuarios` en https://serverest.dev.
ByJosei.

## Requisitos

- Java 11+
- Karate DSL 1.4.1
- Maven 3+
- JUnit 5
- ServeRest API

## Estructura del proyecto 

reto2-karate-serverest/
│── pom.xml
│── README.md
└── src
    └── test
        └── java
        ├── karate-config.js
        ├── users
    │   ├── UsersRunner.java
    │   ├── list-users.feature
    │   ├── create-user.feature
    │   ├── get-user.feature
    │   ├── update-user.feature
    │   └── delete-user.feature

## Ejecutar

```bash
mvn clean test
```