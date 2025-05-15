# src/utils/server/verify_server.py

from flask import Flask, request
from utils.email.jwt_utils_email import verificar_token
from model.vo.RegisterUserVO import RegisterUserVO
from model.vo.ArchVO import ArchVO
from model.BusinessObject import BusinessObject

app = Flask(__name__)

@app.route("/verify")
def verify_user():
    token = request.args.get("token")

    if not token:
        return "Token no proporcionado."

    user_data = verificar_token(token)

    if not user_data:
        return "Token inválido o expirado."

    try:
        # Crear objeto RegisterUserVO
        user_vo = RegisterUserVO(
            user_id=None,
            username=user_data["username"],
            userpassword=user_data["password"],
            email=user_data["email"],
            phone=user_data["phone"],
            rol=user_data["rol"]
        )

        if user_data["rol"] == "arch":
            arch_vo = ArchVO("ARC000001", "559678146234", 10, 40, "Arch", "System")
            success = BusinessObject().registrar_arch(user_vo, arch_vo)
        else:
            success = BusinessObject().registrar_cliente(user_vo)

        if success:
            return "Tu cuenta ha sido verificada y activada. Ya puedes iniciar sesión."
        else:
            return "Error al registrar la cuenta. Intenta más tarde."

    except Exception as e:
        return f"Error interno: {str(e)}"

def run_server():
    app.run(port=5000)