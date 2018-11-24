package org.o7planning.springmvconlinestore.dao;
 
import org.o7planning.springmvconlinestore.entity.Product;
import org.o7planning.springmvconlinestore.model.PaginationResult;
import org.o7planning.springmvconlinestore.model.ProductInfo;
 
public interface ProductDAO {
 
    
    public Product findProduct(int code);
    
    public ProductInfo findProductInfo(int code) ;
  
    
    public PaginationResult<ProductInfo> queryProducts(int page,
                       int maxResult, int maxNavigationPage  );
    
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult,
                       int maxNavigationPage, String likeName);
 
    public void save(ProductInfo productInfo);
    
    public PaginationResult<ProductInfo> queryCategoryProducts(int page, int maxResult, int maxNavigationPage,
            String likeName, String category);
    
    public PaginationResult<ProductInfo> queryBySubCategoryProducts(int page, int maxResult, int maxNavigationPage,
            String likeName, String mainCategory, String subCategory);
    
}