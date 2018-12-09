import databaseLib
import gmailLib
import sys


class Receipt():
   def __init__(self, order_id):
      self.db = databaseLib.Database()
      self.mail = gmailLib.Email()
      self.order_id = order_id
      self.customerID = ""
      self.orderDescription = ""
      self.first = ""
      self.last = ""
      self.street = ""
      self.city = ""
      self.state = ""
      self.zipCode = ""
      self.emailAddress = ""
      self.mailingLabel = ""
      self.orderHeader = ""
      self.orderDescription = ""
      self.orderFooter = ""
      self.BirthstoneLookup = []
      self.CharmLookup = []

   def GetCustomerID(self):
      qCustomerID = "SELECT Customer_ID FROM orders WHERE Order_ID=" + self.order_id
      self.customerID = str(self.db.SendCommand(qCustomerID)[0][0])

   def CreateBirthstoneLookup(self):
      qBirthstone = "SELECT Birthstone, Birthstone_Cost FROM birthstone"
      birthstoneList = self.db.SendCommand(qBirthstone)

      #This is here to make the index start at 1 for BirthstoneLookup
      self.BirthstoneLookup.append(("",0.0))

      for stone in birthstoneList:
         self.BirthstoneLookup.append((stone[0].strip(), float(stone[1])))

   def CreateCharmLookup(self):
      qCharm = "SELECT Charm, Charm_Price FROM charm"
      charmList = self.db.SendCommand(qCharm)

      #This is here to make the index start at 1 for CharmLookup
      self.CharmLookup.append(("", 0.0))

      for charm in charmList:
         self.CharmLookup.append((charm[0].strip(), float(charm[1])))

   def GetProductInfo(self, product_id):
      qProduct = "SELECT Product_Name, Product_Retail_Price, Product_Color, Product_Size FROM product WHERE Product_ID=" + str(product_id)

      return(self.db.SendCommand(qProduct)[0])

   def GetShippingCostByState(self, stateCode):
      qShippingCost = "SELECT Shipping_Cost FROM shipping_costs WHERE State_Code=" + "\" " + stateCode + "\""
      return(str(self.db.SendCommand(qShippingCost)[0][0]))

   def GetCustomerInfo(self):
      qCustomer = "SELECT Customer_First_Name, Customer_Last_Name, Customer_Street_Address, Customer_City, Customer_State, Customer_Zip, Customer_Email_Address \
                   FROM customer WHERE Customer_ID=" + self.customerID

      customer = self.db.SendCommand(qCustomer)[0]
      self.first = customer[0].strip()
      self.last = customer[1].strip()
      self.street = customer[2].strip()
      self.city = customer[3].strip()
      self.state = customer[4].strip()
      self.zipCode = customer[5]
      self.emailAddress = customer[6].strip()

      self.mailingLabel = "{} {}\n{}\n{}, {} {}".format(self.first, self.last, self.street, self.city, self.state, self.zipCode)

   def GetOrderList(self):
      qOrderList = "SELECT Order_Date, Product_ID, Order_Total, Product_Quantity, Customer_Choice_Name_Engraving, Customer_Choice_Birthstone_ID, \
                    Customer_Choice_Charm_ID_1, Customer_Choice_Charm_ID_2, Customer_Choice_Charm_ID_3, Customer_Choice_Charm_ID_4 \
                    FROM orders WHERE Order_ID=" + self.order_id

      orderList = self.db.SendCommand(qOrderList)

      birthstone = ("",0.0)
      charmOne = ("",0.0)
      charmTwo = ("",0.0)
      charmThree = ("",0.0)
      charmFour = ("",0.0)

      orderDate = str(orderList[0][0])
      self.orderHeader = "Order Date: " + orderDate + '\n' + "Name" + '\t' + "Quantity" + '\t' + "Unit Price" + '\t' + "Total Price"

      #Build the order list
      for item in orderList:
         productInfo = self.GetProductInfo(item[1]) #[0]Product_Name, [1]Product_Retail_Price, [2]Product_Color, [3]Product_Size
         orderTotal = item[2]
         quantity = item[3]
         engraving = item[4]
         birthstoneID = item[5]
         charmIDOne = item[6]
         charmIDTwo = item[7]
         charmIDThree = item[8]
         charmIDFour = item[9]

         if birthstoneID != "" and birthstoneID != None:
            birthstone = self.BirthstoneLookup[int(birthstoneID)]
         if charmIDOne != "" and charmIDOne != None:
            charmOne = self.CharmLookup[int(charmIDOne)]
         if charmIDTwo != "" and charmIDTwo != None:
            charmTwo = self.CharmLookup[int(charmIDTwo)]
         if charmIDThree != "" and charmIDThree != None:
            charmThree = self.CharmLookup[int(charmIDThree)]
         if charmIDFour != "" and charmIDFour != None:
            charmFour = self.CharmLookup[int(charmIDFour)]


         self.orderDescription += '\n' + productInfo[0] + '\t' + str(quantity) + '\t' + str(productInfo[1]) + '\t' + str(float(productInfo[1]) * float(quantity))
         self.orderDescription += '\n' + "Color: " + productInfo[2]
         self.orderDescription += '\n' + "Size: " + productInfo[3]
         if engraving != "" and engraving != None:
            self.orderDescription += '\n' + "Engraving: " + engraving
         if birthstone[0] != "":
            self.orderDescription += '\n' + "Birthstone: " + birthstone[0] + '\t' + str(birthstone[1])
         if charmOne[0] != "" or charmTwo[0] != "" or charmThree[0] != "" or charmFour[0] != "":
            self.orderDescription += '\n' + "Charms: "
         if charmOne[0] != "":
            self.orderDescription += charmOne[0]
         if charmTwo[0] != "":
            self.orderDescription += ", " + charmTwo[0]
         if charmThree[0] != "":
            self.orderDescription += ", " + charmThree[0]
         if charmFour[0] != "":
            self.orderDescription += ", " + charmFour[0]
         if charmOne[0] != "" or charmTwo[0] != "" or charmThree[0] != "" or charmFour[0] != "":
            charmTotalCost = charmOne[1] + charmTwo[1] + charmThree[1] + charmFour[1]
            self.orderDescription += '\t' + str(charmTotalCost)


      self.orderFooter = "Shipping Cost: " + self.GetShippingCostByState(self.state) + '\n' + "Order Total: " + '\t\t\t' + str(orderTotal)

   def EmailReceipt(self):
      self.CreateBirthstoneLookup()
      self.CreateCharmLookup()
      self.GetCustomerID()
      self.GetCustomerInfo()
      self.GetOrderList()
      self.mail.SendEmail(self.emailAddress, "Invoice for Order #" + str(self.order_id), self.orderHeader + self.orderDescription + '\n' + self.orderFooter)


def main():
   print("Started: ")
   order_id = sys.argv[1]
   print(order_id)
   receipt = Receipt(order_id)
   receipt.EmailReceipt()


if __name__ == "__main__":
   main()
