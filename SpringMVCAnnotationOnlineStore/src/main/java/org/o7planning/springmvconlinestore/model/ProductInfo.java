package org.o7planning.springmvconlinestore.model;
 
import org.o7planning.springmvconlinestore.entity.Birthstone;
import org.o7planning.springmvconlinestore.entity.Charm;
import org.o7planning.springmvconlinestore.entity.Product;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
 
public class ProductInfo {
    

	private int code;
    private String name;
    private double price;
    private String description;
    private String color;
    private boolean newProduct=false;
 
    // Upload file.
    private String fileData;
	private String category;
	private boolean inStock;
	private int birthstone;
	private int charm1;
	private int charm2;
	private int charm3;
	private int charm4;
	private String size;
	private String engraving;
	private Birthstone birthstoneSelected;
	private Charm charmSelected1;
	private Charm charmSelected2;
	private Charm charmSelected3;
	private Charm charmSelected4;
	private double totalOptionsPrice;
	
    public ProductInfo() {
    }
    
    public ProductInfo(int code, String name, double price, String description, String fileData,
			String category, String color) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.description = description;
		//this.newProduct = newProduct;
		this.fileData = fileData;
		this.category = category;
		this.setColor(color);
	}
 
    public ProductInfo(Product product) {
    	this.code = product.getId();
		this.name = product.getName();
		this.price = product.getPriceRetail();
		this.description = product.getDescription();
		//this.newProduct = newProduct;
		this.fileData = product.getImage();
		this.category = product.getCategory();
		this.setColor(product.getColor());
		this.setSize(product.getSize());
		this.setInStock(true);
		this.setBirthstone(product.getOptBirthstone());
		this.setCharm1(product.getOptCharm1());
		this.setCharm2(product.getOptCharm2());
		this.setCharm3(product.getOptCharm3());
		this.setCharm4(product.getOptCharm4());
    }
 
    public ProductInfo(int code, String name, double price) {
        this.code = code;
        this.name = name;
        this.price = price;
    }
    
    public ProductInfo(int code, String name, double price, String category) {
        this.code = code;
        this.name = name;
        this.price = price;
        this.setCategory(category);
    }
    
 
    public ProductInfo(int id, String name2, double priceRetail, String description2, String image, String category2,
			String color2, int inStock, int optBirthstone, int optCharm1, int optCharm2, int optCharm3, int optCharm4) {
    	
    	this.code = id;
		this.name = name2;
		this.price = priceRetail;
		this.description = description2;
		//this.newProduct = newProduct;
		this.fileData = image;
		this.category = category2;
		this.setColor(color2);
		this.setInStock(true);
		this.setBirthstone(optBirthstone);
		this.setCharm1(optCharm1);
		this.setCharm2(optCharm2);
		this.setCharm3(optCharm3);
		this.setCharm4(optCharm4);
		
	}

	public int getCode() {
        return code;
    }
 
    public void setCode(int code) {
        this.code = code;
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public double getPrice() {
        return price;
    }
 
    public void setPrice(double price) {
        this.price = price;
    }
 
    public String getFileData() {
        return fileData;
    }
 
    public void setFileData(String fileData) {
        this.fileData = fileData;
    }
 
    public boolean isNewProduct() {
        return newProduct;
    }
 
    public void setNewProduct(boolean newProduct) {
        this.newProduct = newProduct;
    }

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public boolean isInStock() {
		return inStock;
	}

	public void setInStock(boolean inStock) {
		this.inStock = inStock;
	}

	public int getBirthstone() {
		return birthstone;
	}

	public void setBirthstone(int birthstone) {
		this.birthstone = birthstone;
	}

	public int getCharm1() {
		return charm1;
	}

	public void setCharm1(int charm1) {
		this.charm1 = charm1;
	}

	public int getCharm2() {
		return charm2;
	}

	public void setCharm2(int charm2) {
		this.charm2 = charm2;
	}

	public int getCharm3() {
		return charm3;
	}

	public void setCharm3(int charm3) {
		this.charm3 = charm3;
	}

	public int getCharm4() {
		return charm4;
	}

	public void setCharm4(int charm4) {
		this.charm4 = charm4;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getEngraving() {
		return engraving;
	}

	public void setEngraving(String engraving) {
		this.engraving = engraving;
	}

	public Birthstone getBirthstoneSelected() {
		return birthstoneSelected;
	}

	public void setBirthstoneSelected(Birthstone birthstoneSelected) {
		this.birthstoneSelected = birthstoneSelected;
	}

	public Charm getCharmSelected1() {
		return charmSelected1;
	}

	public void setCharmSelected1(Charm charmSelected1) {
		this.charmSelected1 = charmSelected1;
	}

	public Charm getCharmSelected2() {
		return charmSelected2;
	}

	public void setCharmSelected2(Charm charmSelected2) {
		this.charmSelected2 = charmSelected2;
	}

	public Charm getCharmSelected3() {
		return charmSelected3;
	}

	public void setCharmSelected3(Charm charmSelected3) {
		this.charmSelected3 = charmSelected3;
	}

	public Charm getCharmSelected4() {
		return charmSelected4;
	}

	public void setCharmSelected4(Charm charmSelected4) {
		this.charmSelected4 = charmSelected4;
	}

	public double getTotalOptionsPrice() {
		return totalOptionsPrice;
	}

	public void setTotalOptionsPrice(double totalPrice) {
		this.totalOptionsPrice = totalPrice;
	}
 
}