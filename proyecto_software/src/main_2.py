from model.dao.UserDao import UserDao

def main():
    dao = UserDao()
    users = dao.select()

if __name__ == '__main__':
    main()
