import bcrypt

password_plain = "arch"
hashed = bcrypt.hashpw(password_plain.encode('utf-8'), bcrypt.gensalt())
print(hashed.decode('utf-8'))
