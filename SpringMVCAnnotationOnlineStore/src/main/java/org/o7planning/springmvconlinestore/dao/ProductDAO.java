package org.o7planning.springmvconlinestore.dao;
 
import org.o7planning.springmvconlinestore.entity.Product;
import org.o7planning.springmvconlinestore.model.PaginationResult;
import org.o7planning.springmvconlinestore.model.ProductInfo;
 
public interface ProductDAO {
 
    
    public Product findProduct(String code);
    
    public ProductInfo findProductInfo(String code) ;
  
    
    public PaginationResult<ProductInfo> queryProducts(int page,
                       int maxResult, int maxNavigationPage  );
    
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult,
                       int maxNavigationPage, String likeName);
 
    public void save(ProductInfo productInfo);
    
}