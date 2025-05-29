import jwt
import datetime

# Clave secreta para firmar los tokens (no compartas esto en producción)
SECRET_KEY = "d581876229aac84488e8135c85bcfd19a3391e077bde5aab757b53d60c9cd9a8" 

def generar_token_verificacion(data: dict, expiracion_min=30):
    """
    Genera un token JWT con los datos del usuario y una expiración (por defecto 30 minutos).
    """
    payload = {
        "data": data,
        "exp": datetime.datetime.utcnow() + datetime.timedelta(minutes=expiracion_min)
    }
    token = jwt.encode(payload, SECRET_KEY, algorithm="HS256")
    return token

def verificar_token(token: str):
    """
    Verifica y decodifica un token JWT. Devuelve los datos del usuario si es válido.
    """
    try:
        decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
        return decoded["data"]
    except jwt.ExpiredSignatureError:
        print("❌ Token expirado.")
        return None
    except jwt.InvalidTokenError:
        print("❌ Token inválido.")
        return None
