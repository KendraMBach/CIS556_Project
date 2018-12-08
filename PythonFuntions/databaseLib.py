import mysql.connector

class Database():
    def __init__(self):
        self.mydb = mysql.connector.connect(
            host = "localhost",
            user="root",
            password="YourStrong!Passw0rd",
            database="jewlz"
        )

        self.cursor = self.mydb.cursor()

    def SendCommand(self, command):
        self.cursor.execute(command)
        
        return self.cursor.fetchall()


    def CloseConnection(self):
        self.cursor.close()
        self.mydb.close()