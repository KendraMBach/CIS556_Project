package org.o7planning.springmvconlinestore.model;
 
import org.o7planning.springmvconlinestore.entity.Product;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
 
public class ProductInfo {
    private int code;
    private String name;
    private double price;
 
    private boolean newProduct=false;
 
    // Upload file.
    private String fileData;
 
    public ProductInfo() {
    }
 
    public ProductInfo(Product product) {
        this.code = product.getId();
        this.name = product.getName();
        this.price = product.getPriceRetail();
    }
 
    public ProductInfo(int code, String name, double price) {
        this.code = code;
        this.name = name;
        this.price = price;
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
 
}