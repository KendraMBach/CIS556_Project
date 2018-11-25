package org.o7planning.springmvconlinestore.model;
 
import java.util.Date;
import java.util.List;
 
public class OrderInfo {
 
    private int id;
    private Date orderDate;
    private int orderNum;
    private double amount;
 
    private String customerFirstName;
    private String customerLastName;
    private String customerAddress;
    private String customerCity;
    private String customerState;
    private String customerZip;
    private String customerEmail;
    private String customerPhone;
 
    private List<OrderDetailInfo> details;
 
    public OrderInfo() {
 
    }
 
    // Using for Hibernate Query.
    public OrderInfo(int id, Date orderDate, int orderNum, //
            int amount, String customerFirstName, String customerLastName, String customerAddress, String customerCity, //
            String customerState, String customerZip, String customerEmail, String customerPhone) {
        this.id = id;
        this.orderDate = orderDate;
        this.orderNum = orderNum;
        this.amount = amount;
 
        this.customerFirstName = customerFirstName;
        this.customerLastName = customerLastName;
        this.customerAddress = customerAddress;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
    }
 
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
 
    public Date getOrderDate() {
        return orderDate;
    }
 
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
 
    public int getOrderNum() {
        return orderNum;
    }
 
    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }
 
    public double getAmount() {
        return amount;
    }
 
    public void setAmount(double amount) {
        this.amount = amount;
    }
 
    public String getCustomerFirstName() {
        return customerFirstName;
    }
 
    public void setCustomerFirstName(String customerName) {
        this.customerFirstName = customerName;
    }
 
    public String getCustomerLastName() {
        return customerLastName;
    }
 
    public void setCustomerLastName(String customerName) {
        this.customerLastName = customerName;
    }
    
    public String getCustomerAddress() {
        return customerAddress;
    }
 
    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }
 
    public String getCustomerEmail() {
        return customerEmail;
    }
 
    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }
 
    public String getCustomerPhone() {
        return customerPhone;
    }
 
    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }
 
    public List<OrderDetailInfo> getDetails() {
        return details;
    }
 
    public void setDetails(List<OrderDetailInfo> details) {
        this.details = details;
    }

	public String getCustomerCity() {
		return customerCity;
	}

	public void setCustomerCity(String customerCity) {
		this.customerCity = customerCity;
	}

	public String getCustomerState() {
		return customerState;
	}

	public void setCustomerState(String customerState) {
		this.customerState = customerState;
	}

	public String getCustomerZip() {
		return customerZip;
	}

	public void setCustomerZip(String customerZip) {
		this.customerZip = customerZip;
	}
 
}