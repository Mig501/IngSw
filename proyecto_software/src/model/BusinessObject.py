from model.conexion.Conexion import Conexion
from model.vo.UserVO import UserVO
from model.dao.UserDao import UserDao
#probar
import random

class BussinesObject():

    def pruebainsert(self):
        user_dao = UserDao()
        random_id = random.randint(1000, 9999)
        user1 = UserVO(random_id, "jmpd", "chatgpt@gmail.com", "7593")
        rows = user_dao.insert(user1)


    def pruebaselect(self):
        user_dao = UserDao()
        users = user_dao.select()

        for usuario in users:
            print(usuario.user_id, usuario.username, usuario.email, usuario.userpassword)

    
    def Comprobarlogin(self, loginVo):
        userdao= UserDao()
        return userdao.consultlogin(loginVo.username, loginVo.userpassword)

