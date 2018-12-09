package org.o7planning.springmvconlinestore.model;

import org.o7planning.springmvconlinestore.entity.Customer;

public class CustomerInfo {
 
	public CustomerInfo() {
		
	}
	
	public CustomerInfo(Customer customer) {
		super();
		this.firstName = customer.getFirstName();
		this.lastName = customer.getLastName();
		this.address = customer.getAddress();
		this.city = customer.getCity();
		this.state = customer.getState();
		this.zip = customer.getZip();
		this.email = customer.getEmail();
		this.phone = customer.getPhone();
		this.password = customer.getPassword();
	}

	private String firstName;
    private String lastName;
    private String address;
    private String city;
    private String state;
    private String zip;
    private String email;
    private String phone;
    private String password;
    
 
 
    public String getFirstName() {
        return firstName;
    }
 
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String getLastName() {
        return lastName;
    }
 
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
 
    public String getAddress() {
        return address;
    }
 
    public void setAddress(String address) {
        this.address = address;
    }
 
    public String getPhone() {
        return phone;
    }
 
    public void setPhone(String phone) {
        this.phone = phone;
    }
    

    public void setPassword(String password) {
    	this.password = password;
    }
    
	public String getPassword() {
		return this.password;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}
 
}