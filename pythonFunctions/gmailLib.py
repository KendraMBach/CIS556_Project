import smtplib

class Email():
    def __init__(self):
        self.gmail_user = 'myponywonderland@gmail.com'  
        self.gmail_password = 'ponypony1!'
        self.server = None
        self.Connect()
    def Connect(self):
        try:  
            self.server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
            self.server.ehlo()
            self.server.login(self.gmail_user, self.gmail_password)
        except Exception as e:  
            print("Error: ", e)
    def SendEmail(self, to, subject, body):
        message = "Subject: {}\n\n{}".format(subject, body)
        self.server.sendmail(self.gmail_user, to, message)