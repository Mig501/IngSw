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
