package org.o7planning.springmvconlinestore.entity;
 
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
 
@Entity
@Table(name = "Orders", //
uniqueConstraints = { @UniqueConstraint(columnNames = "Order_ID, Product_ID, Customer_ID") })
public class Order implements Serializable {
 
    /**
	 * Maximal Constructor
	 */
	public Order(Date orderDate, String orderStatus, int amount, int prodId, Double prodRetailPrice,
			int customerID, String customerName, String customerAddress, String customerEmail, String customerPhone,
			String nameEngraving, int birthstoneID, int charmId1, int charmId2, int charmId3,
			int charmId4, Customer customer, Product product) {
		super();
		Calendar today = Calendar.getInstance();
		today.set(Calendar.HOUR_OF_DAY, 0);
		
		this.orderDate = today.getTime();
		this.orderStatus = orderStatus;
		this.amount = amount;
		this.prodId = prodId;
		this.prodRetailPrice = prodRetailPrice;
		this.customerID = customerID;

		this.nameEngraving = nameEngraving;
		this.birthstoneID = birthstoneID;
		this.charmId1 = charmId1;
		this.charmId2 = charmId2;
		this.charmId3 = charmId3;
		this.charmId4 = charmId4;
		this.customerID = customer.getCustomerID();
		this.prodId = product.getId();
	}
	
	/**
	 * Minimal Constructor
	 */
	public Order(int id, Date orderDate, String orderStatus, int amount, Product product, Customer customer) {
		Calendar today = Calendar.getInstance();
		today.set(Calendar.HOUR_OF_DAY, 0);
		
		this.orderDate = today.getTime();
		this.orderStatus = orderStatus;
		this.amount = amount;
		
		this.prodId = product.getId();
		this.prodRetailPrice = product.getPriceRetail();
		
		this.customerID = customer.getCustomerID();
		
		
	}

	public Order() {
		
	}

	private static final long serialVersionUID = -2576670215015463100L;
 
    private int id;
    private Date orderDate;
    private String orderStatus;
    
    private int amount;

    private Double prodRetailPrice;
    
    private String nameEngraving; 
    private int birthstoneID;
    private int charmId1;
    private int charmId2;
    private int charmId3;
    private int charmId4;
    
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "Customer_Id") 
    private int customerID;
    
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "Product_Id") 
    private int prodId;

 
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Order_ID", length = 11, nullable = false)
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
  
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Order_Date", nullable = false)
    public Date getOrderDate() {
        return orderDate;
    }
 
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
 
    @Column(name = "Order_Status", nullable = false)
    public String getOrderStatus() {
        return orderStatus;
    }
 
    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
    
 
    @Column(name = "Product_Quantity", nullable = false)
    public int getAmount() {
        return amount;
    }
 
    public void setAmount(int amount) {
        this.amount = amount;
    }
 
    
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Product_ID", nullable = false, foreignKey = @ForeignKey(name = "Product_ID"))
    public int getProdId() {
		return this.prodId;
	}

	public void setProdId(int prodId) {
		this.prodId = prodId;
	}

	@Column(name = "Product_Retail_Price", nullable = false)
	public Double getProdRetailPrice() {
		return prodRetailPrice;
	}

	public void setProdRetailPrice(Double prodRetailPrice) {
		this.prodRetailPrice = prodRetailPrice;
	}

	@Column(name = "Customer_Choice_Name_Engraving", nullable = true)
	public String getNameEngraving() {
		return nameEngraving;
	}

	public void setNameEngraving(String nameEngraving) {
		this.nameEngraving = nameEngraving;
	}

	@Column(name = "Customer_Choice_Birthstone_ID", nullable = true)
	public int getBirthstoneID() {
		return birthstoneID;
	}

	public void setBirthstoneID(int birthstoneID) {
		this.birthstoneID = birthstoneID;
	}

	@Column(name = "Customer_Choice_Charm_ID_1", nullable = true)
	public int getCharmId1() {
		return charmId1;
	}

	public void setCharmId1(int charmId1) {
		this.charmId1 = charmId1;
	}

	@Column(name = "Customer_Choice_Charm_ID_2", nullable = true)
	public int getCharmId2() {
		return charmId2;
	}

	public void setCharmId2(int charmId2) {
		this.charmId2 = charmId2;
	}

	@Column(name = "Customer_Choice_Charm_ID_3", nullable = true)
	public int getCharmId3() {
		return charmId3;
	}

	public void setCharmId3(int charmId3) {
		this.charmId3 = charmId3;
	}

	@Column(name = "Customer_Choice_Charm_ID_4", nullable = true)
	public int getCharmId4() {
		return charmId4;
	}

	public void setCharmId4(int charmId4) {
		this.charmId4 = charmId4;
	}

	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Customer_ID", nullable = false, foreignKey = @ForeignKey(name = "Customer_ID"))
	public int getCustomerID() {
		return this.customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
    
}