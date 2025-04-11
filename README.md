# 🛠️ Proyecto BSA - BuySellAutomovile

## Índice

- [📌 Descripción general](#descripción-general)
- [🧠 Requisitos y objetivos](#requisitos-y-objetivos)
- [🏗️ Arquitectura](#arquitectura)
- [🖼️ Frontend (Interfaz Gráfica)](#frontend-interfaz-gráfica)
- [🗃️ Base de datos](#base-de-datos)
- [❓ Preguntas sobre posibles funcionalidades](#preguntas-sobre-posibles-funcionalidades)
- [❓ Preguntas de implementación](#preguntas-de-implementación)
- [📦 Instalación y uso](#instalación-y-uso)
- [🧾 Licencia](#licencia)

---

## 📌 Descripción general

**BSA (BuySellAutomovile)** es una aplicación de escritorio para la gestión de venta y compra de automóviles, piezas y servicios asociados, con módulos de soporte para talleres, almacenes, empleados y clientes.

---

## 🧠 Requisitos y objetivos

- Gestionar productos, usuarios y talleres.
- Control de inventario, pedidos, contratos y mantenimiento.
- Generación de estadísticas.
- Soporte para distintos perfiles de usuario con permisos diferenciados.

---

## 🏗️ Arquitectura

- Basada en el patrón **MVC (Modelo-Vista-Controlador)**.
- Implementada en **Python** con **PyQt6** para la interfaz de usuario.
- Uso de **SQLite** como motor de base de datos local, con posibilidad de migración.

---

## 🖼️ Frontend (Interfaz Gráfica)

La interfaz gráfica está siendo desarrollada en **PyQt6**, siguiendo el patrón arquitectónico **MVC**. Cada funcionalidad del sistema cuenta con una pantalla dedicada.

### ✔️ Funcionalidades ya implementadas o en desarrollo:

- **Pantalla de Login**
  - Validación de credenciales por tipo de usuario.
  - Cierre de la ventana de login al iniciar sesión y apertura de la ventana principal.
  - Manejo de errores de autenticación.

- **Pantalla Principal**
  - Estructura modular para mostrar contenido dinámico según el perfil.
  - Menús de navegación personalizados.
  - Estética limpia y moderna.

---

## 🗃️ Base de Datos

El sistema BSA utiliza una base de datos relacional para gestionar toda la información crítica del sistema.

### 🧾 Consideraciones para la tabla `user`

- `username` debe ser **único**.
- La `password` podría tener unos **requisitos mínimos** (por ejemplo: longitud mínima, mayúsculas, símbolos, etc.).
- El `email` debe ser **único** para evitar duplicidades en el registro.
- **Ajustar el tamaño del código postal** en función del país más largo (el que tenga códigos más largos).
- El campo `país` se puede escribir completo y después mapear a una abreviatura asociada (ej. España → ES).
- En la dirección se podría incluir un **desplegable** para seleccionar el tipo de vía (ej. Calle, Avenida) y luego escribir el nombre.
- Posibilidad de añadir campos como **escalera**, ya que algunos edificios requieren esta información para una dirección completa.
- El campo de **teléfono móvil debe ser obligatorio** y el prefijo se añadiría en función del país que se haya añadido.

---

## ❓ Preguntas sobre posibles funcionalidades

- ¿Se puede integrar un bot de Telegram para enviar notificaciones?

---

## 📦 Instalación y uso

---

## 🧾 Licencia

Proyecto desarrollado con fines educativos para la asignatura de Ingeniería del Software.


Consultas
 - Value object -> Login, Registro, por cada cosa es, son muchas
 - DAO -> uno por tabla
- Login window y register window en vista

validaciones de forma en contralador, enteros, string
validaciones de lógico va en el model en otra carpeta logica