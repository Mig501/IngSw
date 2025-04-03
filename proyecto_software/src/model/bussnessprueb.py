<<<<<<< HEAD
from model.dao.dao import UserDao
=======
from proyecto_software.src.model.dao.UserDao import UserDao
>>>>>>> 53bf489ffccd54034c656eb1425eb8d2f4fd96b9
class bussinesobject():
    def pruebaselect(self):
        userdao= UserDao()
        usuarios=userdao.select()

        for usuario in usuarios:
            print(usuario.id, usuario.name, usuario.email, usuario.password)

    
    def Comprobarlogin(self, loginVo):
        userdao= UserDao()
        return userdao.consultlogin(loginVo.username, loginVo.password)

