# Reto de Automatización QA – BackEnd

## Descripción

Este proyecto implementa una suite de pruebas automatizadas para la API de usuarios de ServeRest, cubriendo operaciones CRUD completas y validando el comportamiento del sistema ante diferentes escenarios.

---

## Tecnologías utilizadas

* Karate DSL
* Java (Maven)
* JUnit 5

---

## Estrategia de automatización

Se utilizó Karate DSL para la automatización de pruebas API, aprovechando su sintaxis declarativa y su integración nativa con validaciones JSON.

La estrategia se basa en:

* Separación de escenarios por endpoint
* Cobertura de casos positivos y negativos
* Validación de estructuras mediante esquemas JSON
* Uso de datos dinámicos para evitar conflictos en pruebas

---

## Estructura del proyecto

```
src
 └── test
      ├──java
      │   └── runners
      │        └── TestRunner
      └── resources
            ├── features
            │     └── usuarios
            │           ├── deleteUsuario.feature
            │           ├── getUsuarioById.feature
            │           ├── getUsuarios.feature
            │           ├── postUsuario.feature
            │           └── putUsuario.feature
            ├── helpers
            │     ├── dataGenerator.js
            │     └── dataGeneratorPut.js
            └── schemas
                  └── userSchema.json
```

---

## Cobertura de pruebas

### Operaciones CRUD

* Obtener lista de usuarios (GET /usuarios)
* Registrar nuevo usuario (POST /usuarios)
* Buscar usuario por ID (GET /usuarios/{id})
* Actualizar usuario (PUT /usuarios/{id})
* Eliminar usuario (DELETE /usuarios/{id})

---

### Casos positivos

* Creación de usuario con datos válidos
* Consulta de usuarios existentes
* Consulta de usuarios existentes usando si Id
* Actualización de datos del usuario
* Eliminación de usuarios

---

### Casos negativos

* Creación de usuario con email duplicado
* Creación de usuarios sin email
* Creación de usuarios con email invalido
* Consulta de usuarios inexistentes
* Actualización de usuario con un email duplicado
* Eliminación de usuarios inexistentes

---

## Validación de esquema JSON

Se implementaron validaciones de esquema para garantizar la estructura de las respuestas:

* Validación de usuario individual
* Validación de listas de usuarios

---

## Instalación

1. Clonar el repositorio:

```
git clone <URL_DEL_REPOSITORIO>
```

2. Abrir el proyecto en IntelliJ IDEA

3. Instalar dependencias con Maven:

```
mvn clean install
```

---

## Ejecución de pruebas

Ejecutar desde la terminal:

```
mvn test
```

O desde IntelliJ:

* Ejecutar la clase `TestRunner`

---

## Manejo de datos de prueba

Se implementó el generador de datos dinámicos (`dataGenerator.js` y `dataGeneratorPut.js`) para:

* Crear usuarios únicos
* Evitar conflictos por duplicidad de datos
* Facilitar la ejecución repetida de pruebas


---

## Decisiones técnicas

* Uso de Karate DSL por su facilidad para pruebas API
* Organización modular por endpoints
* Validaciones declarativas para mejorar legibilidad
* Separación de datos y lógica de prueba

---

## Posibles mejoras

* Ejecución en CI/CD
* Integración con reportes (Allure)
* Mayor cobertura de validaciones de negocio
* Uso de variables de entorno

---

## 👨‍💻 Autor

Cristian Miguel Paucar Vargas  
QA Automation Engineer
