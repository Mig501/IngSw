<<<<<<< HEAD
from src.model.dao.UserDao import UserDao

=======

from src.model.dao.UserDao import UserDao
>>>>>>> 2560ce82681ae45d10970fafe680f8ace29479d1
class bussinesobject():
    def pruebaselect(self):
        userdao= UserDao()
        usuarios=userdao.select()

        for usuario in usuarios:
            print(usuario.id, usuario.name, usuario.email, usuario.password)

    
    def Comprobarlogin(self, loginVo):
        userdao= UserDao()
        return userdao.consultlogin(loginVo.username, loginVo.password)

