# 🛠️ DESARROLLO

---

## ❓ Preguntas sobre posibles funcionalidades
- Si se añade como extend de iniciar sesión de user una funcionalidad que sea desactivar cuenta, se debe meter en el login obligatoriamente o para poder implementarlo en otra parte debe aparecer en el diagrama de caso de uso en otra parte.

---

## Cosas por hacer 

  ### Entrega 2
    - revisar diagrama de casos de usos unificado
    - cambiar formato del word al formato indicado 
    - actualizar word a los cambios realizados respeto al diagrama
    - creacion de diagramas de flujo
    - actualizar tablas de entidad realicion para que se ajuste al formato y a las actualizaciones necesarias
        -unificar warehouse y workshop en una unica tabla llamada concesionario/taller
  
  ### Base de datos
    - quitar atributos y tablas inecesarios
    - crear clase root de todos los usuarios "Users" y hacer que el resto de ususarios hereden del esa.

  ### Codigo
    - Implementar los atributos de clientes en default 0
---

## Consultas
- Value object -> Login, Registro, por cada grupo de datos que se tenga que solicitar a la base de datos, son      muchas
- DAO -> uno por tabla
- Login window y register window en vista

validaciones de forma en contralador, enteros, string
validaciones de lógico va en el model en otra carpeta logica

---

# BSA - BuySellAutomobile

![Logo del proyecto](proyecto_software/resources/images/logo2.jpg)

---

## Descripción

**BSA (BuySellAutomobile)** es un sistema de información diseñado para gestionar la compra, venta y mantenimiento de automóviles y sus componentes dentro de talleres mecánicos.  

La aplicación se ejecuta en **quioscos físicos instalados en los talleres**, funcionando de manera **offline** a través de una red **LAN interna**, sin conexión a Internet.

BSA está orientado a **usuarios como clientes particulares, técnicos de taller y administradores**, permitiéndoles realizar tareas como:

- Publicar o adquirir vehículos, piezas y accesorios.
- Programar servicios de mantenimiento o reparación.
- Consultar el estado de inventario.
- Gestionar transacciones y facturación.
- Calificar productos y servicios mediante un sistema de reseñas.

El sistema proporciona una interfaz gráfica sencilla e intuitiva, y está basado en una arquitectura modular que garantiza su mantenibilidad, fiabilidad y seguridad en entornos cerrados.

---

## Tecnologías usadas

El desarrollo del sistema BSA se ha llevado a cabo utilizando las siguientes tecnologías:

- **Python** – Lenguaje principal para la lógica de negocio y la aplicación en general.
- **PyQt6** – Framework para el desarrollo de la interfaz gráfica de usuario (GUI).
- **MySQL** – Sistema de gestión de bases de datos relacional utilizado para almacenar la información del sistema.
- **Arquitectura MVC** – Separación de la lógica de negocio, interfaz y modelo de datos.
- **Git** – Control de versiones del código fuente.
- **GitHub** – Plataforma de colaboración para el desarrollo del proyecto.
- **Markdown + PDF** – Formatos usados para la documentación técnica y entregas.

---

## Documentación

> Toda la documentación técnica y académica se encuentra en la carpeta [`/docs`](./docs/)

### Documentos principales
- [`Presentación Proyecto BSA`](./docs/entrega_0/Componentes_descripcion_proyecto.pdf)

### Documentación complementaria

---

## Autores

El sistema BSA ha sido desarrollado por el **Grupo 6** para la asignatura de Ingeniería del Software. A continuación, se detallan los integrantes del equipo, sus roles y responsabilidades:

- **David Morán Gorgojo**  
  *Rol:* CEO  
  *Responsabilidades:* Supervisión general, planificación, obtención y validación de requisitos.  
  *Correo:* dmorag03@estudiantes.unileon.es

- **Miguel Sánchez Rodríguez**  
  *Rol:* Desarrollador de base de datos (BD)  
  *Responsabilidades:* Definición de la arquitectura, implementación de la lógica del servidor y base de datos.  
  *Correo:* msancr11@estudiantes.unileon.es

- **Pablo Ruiz Morán**  
  *Rol:* Desarrollador Backend  
  *Responsabilidades:* Pruebas funcionales y no funcionales, aseguramiento de calidad y validación final.  
  *Correo:* pruizm01@estudiantes.unileon.es

- **Jaime Alvarado Fernández**  
  *Rol:* Desarrollador Frontend  
  *Responsabilidades:* Diseño e implementación de la interfaz de usuario (UI/UX), conexión con el backend.  
  *Correo:* jalvaf08@estudiantes.unileon.es

---

## Licencia
  
Puedes consultar los términos completos en el archivo [`LICENSE`](./LICENSE).