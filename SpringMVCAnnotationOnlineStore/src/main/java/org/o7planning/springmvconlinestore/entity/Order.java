package org.o7planning.springmvconlinestore.entity;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

import org.o7planning.springmvconlinestore.model.OrderInfo;

@Entity
@Table(name = "Orders") 
public class Order implements Serializable {

    /**
	 * Maximal Constructor
	 */
	public Order(Date orderDate, String orderStatus, int amount, Double prodRetailPrice,
			String customerName, String customerAddress, String customerEmail, String customerPhone,
			String nameEngraving, String birthstoneID, String charmId1, String charmId2, String charmId3,
			String charmId4, Product product, Customer customer) {
		super();
		
		
		String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
		
		this.orderDate = date;
		this.orderStatus = orderStatus;
		this.amount = amount;
		;
		this.prodRetailPrice = prodRetailPrice;


		this.nameEngraving = nameEngraving;
		this.birthstoneID = birthstoneID;
		this.charmId1 = charmId1;
		this.charmId2 = charmId2;
		this.charmId3 = charmId3;
		this.charmId4 = charmId4;
		this.customerId = customer;
		this.prodId = product;
	}

	/**
	 * Minimal Constructor
	 */
	public Order(int id, Date orderDate, String orderStatus, int amount, Product product, double productPrice, Customer customer) {
		
		String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
		
		this.orderDate = date;
		this.orderStatus = orderStatus;
		this.amount = amount;

		this.prodId = product;
		this.prodRetailPrice = productPrice;


		this.customerId = customer;

	}

	public Order(OrderInfo orderInfo) {
		String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
		
		this.orderDate = date;
		this.id = orderInfo.getOrderNum();
		this.orderStatus = "Open";
		this.customerId = orderInfo.getCustomer();
		this.prodId = orderInfo.getProduct();
		this.prodRetailPrice = 0.0; //default
		this.amount = 0; //default
		

	}
	

	private static final long serialVersionUID = -2576670215015463100L;

    private int id;
    private String orderDate;
    private String orderStatus;

    private int amount;

    private Double prodRetailPrice;

    private String nameEngraving;
    private String birthstoneID;
    private String charmId1;
    private String charmId2;
    private String charmId3;
    private String charmId4;


    private Customer customerId;

    private Product prodId;


    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Order_ID", length = 11, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "Order_Date", nullable = false)
    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
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



    @ManyToOne(targetEntity=Product.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "Product_ID", nullable = false)
    public Product getProdId() {
		return this.prodId;
	}

	public void setProdId(Product prodId) {
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
	public String getBirthstoneID() {
		return birthstoneID;
	}

	public void setBirthstoneID(String birthstoneID) {
		this.birthstoneID = birthstoneID;
	}

	@Column(name = "Customer_Choice_Charm_ID_1", nullable = true)
	public String getCharmId1() {
		return charmId1;
	}

	public void setCharmId1(String charmId1) {
		this.charmId1 = charmId1;
	}

	@Column(name = "Customer_Choice_Charm_ID_2", nullable = true)
	public String getCharmId2() {
		return charmId2;
	}

	public void setCharmId2(String charmId2) {
		this.charmId2 = charmId2;
	}

	@Column(name = "Customer_Choice_Charm_ID_3", nullable = true)
	public String getCharmId3() {
		return charmId3;
	}

	public void setCharmId3(String charmId3) {
		this.charmId3 = charmId3;
	}

	@Column(name = "Customer_Choice_Charm_ID_4", nullable = true)
	public String getCharmId4() {
		return charmId4;
	}

	public void setCharmId4(String charmId4) {
		this.charmId4 = charmId4;
	}

	@ManyToOne(targetEntity=Customer.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "Customer_ID", nullable = false)
	public Customer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Customer customerID) {
		this.customerId = customerID;
	}

}
