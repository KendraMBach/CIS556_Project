# Dependencies
Python 3.6, Python Library MySQL Connector (pip install MySQL-connector-python)

# Receipts
Sends an email to the user associated with an orderID containing a breakdown of the order's items as well as options and their cost, and shipping information.

## How To Generate A Reciept
Call SendReceipt.py and give it the orderID as a parameter
>python SendReceipt.py 30001

# Newsletter
Sends a welcome email to the user specified containing a newsletter with this month's birthstone.

## How To Generate A Newsletter
Call Newsletter.py and give it three parameters: EmailAddress, FirstName, LastName
>python Newsletter.py ncrooker@umich.edu Nick Crooker