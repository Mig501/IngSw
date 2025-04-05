# src/main.py
from model.BusinessObject import BussinesObject
import sys
from PyQt6.QtWidgets import QApplication
from frontend.windows.login.login_window import LoginWindow

def main():
    bo = BussinesObject()
    bo.pruebainsert()
    bo.pruebaselect()

if __name__ == '__main__':
    main()
