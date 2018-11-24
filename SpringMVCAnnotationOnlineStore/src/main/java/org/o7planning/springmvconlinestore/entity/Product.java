package org.o7planning.springmvconlinestore.entity;
 
import java.io.Serializable;
import java.util.Date;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
 
@Entity
@Table(name = "Product")
public class Product implements Serializable {
 
    
	public Product(int id, String name, String description, String color, String category, String gender, String size,
			int inStock, double priceWholeSale, double priceRetail, String image, String prodOptDesc, int optEngrave,
			int optBirthstone, int optCharm1, int optCharm2, int optCharm3, int optCharm4) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.color = color;
		this.category = category;
		this.gender = gender;
		this.size = size;
		this.inStock = inStock;
		this.priceWholeSale = priceWholeSale;
		this.priceRetail = priceRetail;
		this.image = image;
		this.prodOptDesc = prodOptDesc;
		this.optEngrave = optEngrave;
		this.optBirthstone = optBirthstone;
		this.optCharm1 = optCharm1;
		this.optCharm2 = optCharm2;
		this.optCharm3 = optCharm3;
		this.optCharm4 = optCharm4;

	}
	
	

	private static final long serialVersionUID = -1000119078147252957L;
 
    private int id;
    private String name;
    private String description;
    private String color;
    private String category;
    private String gender;
    private String size;
    private int inStock;
    private double priceWholeSale;
    private double priceRetail;
    private String image;
    private String prodOptDesc;
    private int optEngrave; 
    private int optBirthstone;
    private int optCharm1;
    private int optCharm2;
    private int optCharm3;
    private int optCharm4;
    
 
    public Product() {
    }
 
    @Id
    @Column(name = "Product_ID", length = 11, nullable = false)
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
 
    @Column(name = "Product_Name", length = 255, nullable = false)
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
    
    @Column(name = "Product_Description", nullable = true)
    public String getDescription() {
        return description;
    }
 
    public void setDescription(String description) {
        this.description = description;
    }
 
    @Column(name = "Product_Base_Wholesale_Price", nullable = false)
    public double getPriceWholeSale() {
        return priceWholeSale;
    }
 
    public void setPriceWholeSale(double price) {
        this.priceWholeSale = price;
    }
 
 
    @Column(name = "Image_Filename", nullable = false)
    public String getImage() {
        return image;
    }
 
    public void setImage(String image) {
        this.image = image;
    }

    @Column(name = "Number_In_Stock", nullable = false)
	public int getInStock() {
		return inStock;
	}

    
	public void setInStock(int inStock) {
		this.inStock = inStock;
	}

	@Column(name = "Product_Size", nullable = false)
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	@Column(name = "Gender", nullable = false)
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "Product_Category", nullable = true)
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Column(name = "Product_Color", nullable = true)
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	/*
	public boolean isInStock() {
		return(getInStock()<= 0);
	}
	*/
	@Column(name = "Product_Retail_Price", nullable = false)
	public double getPriceRetail() {
		return priceRetail;
	}

	public void setPriceRetail(double priceRetail) {
		this.priceRetail = priceRetail;
	}

	@Column(name = "Product_Option_Description", nullable = true)
	public String getProdOptDesc() {
		return prodOptDesc;
	}

	public void setProdOptDesc(String prodOptDesc) {
		this.prodOptDesc = prodOptDesc;
	}

	@Column(name = "Option_Name_Engraving", nullable = true)
	public int getOptEngrave() {
		return optEngrave;
	}

	public void setOptEngrave(int optEngrave) {
		this.optEngrave = optEngrave;
	}

	@Column(name = "Option_Birthstone", nullable = true)
	public int getOptBirthstone() {
		return optBirthstone;
	}

	
	public void setOptBirthstone(int optBirthstone) {
		this.optBirthstone = optBirthstone;
	}

	@Column(name = "Option_Charm_1", nullable = true)
	public int getOptCharm1() {
		return optCharm1;
	}

	public void setOptCharm1(int optCharm1) {
		this.optCharm1 = optCharm1;
	}

	@Column(name = "Option_Charm_2", nullable = true)
	public int getOptCharm2() {
		return optCharm2;
	}

	public void setOptCharm2(int optCharm2) {
		this.optCharm2 = optCharm2;
	}

	@Column(name = "Option_Charm_3", nullable = true)
	public int getOptCharm3() {
		return optCharm3;
	}

	public void setOptCharm3(int optCharm3) {
		this.optCharm3 = optCharm3;
	}

	@Column(name = "Option_Charm_4", nullable = true)
	public int getOptCharm4() {
		return optCharm4;
	}

	public void setOptCharm4(int optCharm4) {
		this.optCharm4 = optCharm4;
	}
 
	public boolean hasCharmOpt() {
		if(this.getOptCharm1() == 1 || this.getOptCharm2() == 1 || this.getOptCharm3() == 1 || this.getOptCharm1() == 1) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public boolean hasEngravingOpt() {
		if(this.getOptEngrave() == 1)
		{
			return true;
		}
		else {
			return false;
		}
	}
	
	public boolean hasBirthstoneOpt() {
		if(this.getOptBirthstone() == 1)
		{
			return true;
		}
		else {
			return false;
		}
	}
}