from model.dao.dao import UserDao
class bussinesobject():
    def pruebaselect(self):
        userdao= UserDao()
        usuarios=userdao.select()

        for usuario in usuarios:
            print(usuario.id, usuario.name, usuario.email, usuario.password)
