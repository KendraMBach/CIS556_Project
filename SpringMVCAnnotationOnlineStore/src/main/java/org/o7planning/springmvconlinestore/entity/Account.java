package org.o7planning.springmvconlinestore.entity;
 
import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
	
	public Account() {
		this.setUserID(UUID.randomUUID().toString());
	}
 
    private static final long serialVersionUID = -2054386655979281969L;
 
    
    public static final String ROLE_MANAGER = "MANAGER";
    public static final String ROLE_EMPLOYEE = "EMPLOYEE";
 
    private String userID;
    private String password;
    private boolean active;
    private String userRole;
    private String firstName;
    private String lastName;
    private String email;
 
    @Id
    @Column(name = "User_ID", length = 36, nullable = true)
    public String getUserID() {
        return userID;
    }
 
    public void setUserID(String userName) {
        this.userID = userName;
    }
 
    @Column(name = "Password", length = 20, nullable = true)
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
 
    @Column(name = "Active", length = 1, nullable = true)
    public boolean isActive() {
        return active;
    }
 
    public void setActive(boolean active) {
        this.active = active;
    }
 
    @Column(name = "User_Role", length = 20, nullable = true)
    public String getUserRole() {
        return userRole;
    }
 
    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }
    
    @Column(name = "First_Name", length = 45, nullable = true)
    public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	@Column(name = "Last_Name", length = 45, nullable = true)
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
    
    @Override
    public String toString()  {
        return "["+ this.userID+","+ this.password+","+ this.userRole+"]";
    }

    @Column(name = "Email", length = 45, nullable = true)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

    
}