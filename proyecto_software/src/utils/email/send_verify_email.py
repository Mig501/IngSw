import smtplib
import os
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from dotenv import load_dotenv

load_dotenv()  # Carga las variables desde .env

def send_verification_email(to_email, username, token):
    subject = "Verificación de tu cuenta en BSA"
    verification_link = f"http://localhost:5000/verify?token={token}"

    body = f"""
Hola {username},

Gracias por registrarte en BuySellAuto (BSA).

Por favor, verifica tu cuenta haciendo clic en el siguiente enlace:

{verification_link}

Este enlace expirará en unos minutos. Si tú no solicitaste este registro, ignora este correo.
"""

    msg = MIMEMultipart()
    msg["From"] = os.getenv("EMAIL_HOST_USER")
    msg["To"] = to_email
    msg["Subject"] = subject
    msg.attach(MIMEText(body, "plain"))

    try:
        with smtplib.SMTP(os.getenv("EMAIL_HOST"), int(os.getenv("EMAIL_PORT"))) as server:
            server.starttls()
            server.login(os.getenv("EMAIL_HOST_USER"), os.getenv("EMAIL_HOST_PASSWORD"))
            server.send_message(msg)
        print("Correo de verificación enviado correctamente.")
    except Exception as e:
        print(f"Error al enviar el correo: {e}")

def send_edit_confirmation_email(to_email, username, token):
    subject = "Confirmación de modificación de datos en BuySellAuto (BSA)"
    verification_link = f"http://localhost:5000/confirm_edit?token={token}"
    body = f"""
Hola {username},

Hemos recibido una solicitud para modificar tus datos personales en la plataforma BuySellAuto (BSA).

Si realizaste este cambio, confirma haciendo clic en el siguiente enlace:

{verification_link}

Este enlace caducará en unos minutos por motivos de seguridad.

Si no solicitaste este cambio, por favor contacta con el administrador del sistema inmediatamente.

Atentamente,  
El equipo de BSA
"""

    # Crear mensaje MIME
    msg = MIMEMultipart()
    msg['From'] = os.getenv("EMAIL_HOST_USER")
    msg['To'] = to_email
    msg['Subject'] = subject
    msg.attach(MIMEText(body, "plain"))

    try:
        with smtplib.SMTP(os.getenv("EMAIL_HOST"), int(os.getenv("EMAIL_PORT"))) as server:
            server.starttls()
            server.login(os.getenv("EMAIL_HOST_USER"), os.getenv("EMAIL_HOST_PASSWORD"))
            server.send_message(msg)

        print("Correo de modificación enviado correctamente.")
    except Exception as e:
        print(f"Error al enviar el correo de modificación: {e}")

        server = smtplib.SMTP("smtp.tuservidor.com", 587)  # ← ajusta tus valores SMTP
        server.starttls()
        server.login("tucuenta@correo.com", "tu_contraseña")  # ← NO lo dejes hardcoded en producción
        server.sendmail(msg['From'], msg['To'], msg.as_string())
        server.quit()
    except Exception as e:
        raise Exception(f"No se pudo enviar el correo de modificación: {str(e)}")