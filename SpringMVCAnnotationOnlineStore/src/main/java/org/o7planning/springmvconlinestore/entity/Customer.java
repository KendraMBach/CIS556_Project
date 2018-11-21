package org.o7planning.springmvconlinestore.entity;
 
import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name = "customer")
public class Customer implements Serializable {
	
	
	public Customer(String password, String firstName, String lastName, String email, String phone, String address,
			String city, String state, String zip) {
		super();
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
	}

	
 
    public Customer() {
		
	}



	private static final long serialVersionUID = -2054386655979281969L;
 
 
    private int ID;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String address;
    private String city;
    private String state;
    private String zip;
 
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Customer_ID", nullable = false)
    public int getCustomerID() {
        return ID;
    }
 
    public void setCustomerID(int customerID) {
        this.ID = customerID;
    }
 
    @Column(name = "Password", length = 20, nullable = false)
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
 
  
    @Column(name = "Customer_First_Name", nullable = false)
    public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	@Column(name = "Customer_Last_Name", nullable = false)
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

    @Column(name = "Customer_Email_Address", nullable = false)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "Customer_Phone_Number", nullable = false)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Column(name = "Customer_Street_Address", nullable = false)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "Customer_City", nullable = false)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "Customer_State", nullable = false)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name = "Customer_Zip", nullable = false)
	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

    
}