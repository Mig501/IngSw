from src.model.dao.UserDao import UserDao

class bussinesobject():
    def pruebaselect(self):
        userdao= UserDao()
        usuarios=userdao.select()

        for usuario in usuarios:
            print(usuario.id, usuario.name, usuario.email, usuario.password)

    
    def Comprobarlogin(self, loginVo):
        userdao= UserDao()
        return userdao.consultlogin(loginVo.username, loginVo.password)

