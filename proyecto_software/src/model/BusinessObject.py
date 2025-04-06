from model.conexion.Conexion import Conexion
from model.vo.UserVO import UserVO
from model.dao.UserDao import UserDao
#probar
import random

class BusinessObject():

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

    
    def comprobarlogin(self, loginVo):
        userdao= UserDao()
        return userdao.consultlogin(loginVo)
    
    def insert(self, user_vo) -> int:
        try:
            user_dao = UserDao()
            rows = user_dao.insert(user_vo)
            return rows

        except Exception as e:
            raise Exception(f"Error in BusinessObject.insert: {e}")


