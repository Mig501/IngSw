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

## 👥 Perfiles de usuario

- **Administrador**: acceso total a la aplicación, gestión completa.
- **Usuario**: acceso limitado, puede consultar productos, interactuar con chatbot, etc.

---

## ❓ Preguntas sobre posibles funcionalidades

- Integrar bot de Telegram para enviar notificaciones
