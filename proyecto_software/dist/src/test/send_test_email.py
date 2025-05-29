import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from dotenv import load_dotenv
import os

# Cargar las variables de entorno desde el archivo .env
load_dotenv()

def send_test_email():
    # Configuración básica
    from_email = os.getenv("EMAIL_HOST_USER")
    password = os.getenv("EMAIL_HOST_PASSWORD")
    to_email = 'Chatogeteunileon@gmail.com' # Puedes cambiar esto por otro correo tuyo si prefieres

    # Crear el mensaje
    subject = "📧 Correo de prueba desde BSA"
    body = "¡Hola! Este es un correo de prueba enviado desde tu aplicación BSA usando Gmail SMTP."

    msg = MIMEMultipart()
    msg["From"] = from_email
    msg["To"] = to_email
    msg["Subject"] = subject
    msg.attach(MIMEText(body, "plain"))

    try:
        # Conexión al servidor SMTP de Gmail
        server = smtplib.SMTP(os.getenv("EMAIL_HOST"), int(os.getenv("EMAIL_PORT")))
        server.starttls()
        server.login(from_email, password)
        server.sendmail(from_email, to_email, msg.as_string())
        server.quit()
        print("✅ Correo enviado correctamente.")
    except Exception as e:
        print(f"❌ Error al enviar el correo: {e}")

if __name__ == "__main__":
    send_test_email()
