import databaseLib
import gmailLib
import sys
from datetime import datetime

class Newsletter():
   def __init__(self, emailAddress, firstName, lastName):
      self.db = databaseLib.Database()
      self.mail = gmailLib.Email()
      self.email = emailAddress
      self.firstName = firstName
      self.lastName = lastName
      self.month = datetime.now().month
      self.birthstone = ""
      self.Months = ["", "January ", "February ", "March ", "April ", "May ", "June ", "July ", "August ", "September ", "October ", "November ", "December "]

   def BirthstoneLookup(self):
      qBirthstone = "SELECT Birthstone FROM birthstone WHERE Month=" + "\"" + self.Months[self.month] + "\""
      self.birthstone = self.db.SendCommand(qBirthstone)[0][0].strip()

   def SendNewsletter(self):
      self.BirthstoneLookup()
      self.mail.SendEmail(self.email, "Thank you for signing up!", "Hi {}, \n Welcome to Junction Jewlers! Please enjoy our selection of high quality Jewlery. \n\n This month's birthstone is {}.".format(self.firstName, self.birthstone))

def main():
   email = sys.argv[1]
   firstName = sys.argv[2]
   lastName = sys.argv[3]
   newsletter = Newsletter(email, firstName, lastName)
   newsletter.SendNewsletter()


if __name__ == "__main__":
   main()