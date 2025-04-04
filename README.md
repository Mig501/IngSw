# 🛠️ Proyecto BSA - BuySellAutomovile

## Índice

---

## 📌 Descripción general

**BSA (BuySellAutomovile)** es una aplicación de escritorio para la gestión de venta y compra de automóviles, piezas y servicios asociados, con módulos de soporte para talleres, almacenes, empleados, transporte y chatbot.

---

## 🧠 Requisitos y objetivos

- Gestionar productos, usuarios, talleres y transportes.
- Control de inventario, pedidos, contratos y mantenimiento.
- Interacción con chatbot y generación de estadísticas.
- Soporte para distintos perfiles de usuario con permisos diferenciados.

---

## 🖼️ Frontend (Interfaz Gráfica)

La interfaz gráfica está siendo desarrollada en **PyQt6**, siguiendo el patrón arquitectónico **MVC**. Cada funcionalidad del sistema cuenta con una pantalla dedicada.

### ✔️ Funcionalidades ya implementadas o en desarrollo

- **Pantalla de Login**  
  - Añadir dos funcionalidades: login y registrer
  - Login: Vista principal de la ventana que da acceso a la main gui
  - Registrer: vista secundaria a la que se accede a través del boton

- **Pantalla Principal**  
  - Estructura modular para mostrar contenido dinámico según el perfil.
  - Menús de navegación para distintas funcionalidades según permisos del usuario.
  - Estilo visual moderno y limpio.

### 🧪 Pruebas UI

- Se han probado las transiciones entre ventanas.

---

## 🗃️ Backend

*En desarrollo...*

---

## 📂 Base de datos

---

## 👥 Perfiles de usuario

- **Administrador**: acceso total a la aplicación, gestión completa.
- **Usuario**: acceso limitado, puede consultar productos, interactuar con chatbot, etc.

---

## ❓ Preguntas sobre posibles funcionalidades

- Integrar bot de Telegram para enviar notificaciones
