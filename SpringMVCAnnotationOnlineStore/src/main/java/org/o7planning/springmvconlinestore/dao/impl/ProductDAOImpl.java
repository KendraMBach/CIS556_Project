package org.o7planning.springmvconlinestore.dao.impl;
 
import java.util.Date;
 
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.o7planning.springmvconlinestore.dao.ProductDAO;
import org.o7planning.springmvconlinestore.entity.Product;
import org.o7planning.springmvconlinestore.model.PaginationResult;
import org.o7planning.springmvconlinestore.model.ProductInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
 
// Transactional for Hibernate
@Transactional
public class ProductDAOImpl implements ProductDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    public Product findProduct(int code) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Product.class);
        crit.add(Restrictions.eq("Product_ID", code));
        return (Product) crit.uniqueResult();
    }
 
    public ProductInfo findProductInfo(int code) {
        Product product = this.findProduct(code);
        if (product == null) {
            return null;
        }
        return new ProductInfo(product.getId(), product.getName(), product.getPriceRetail());
    }
 
    public void save(ProductInfo productInfo) {
        int code = productInfo.getCode();
 
        Product product = null;
 
        boolean isNew = false;
        try {
            product = this.findProduct(code);
        }
        catch(Exception e) {
        	System.out.println("Null Pointer in Product DAO");
        	System.out.println(e);
        }
        if (product == null) {
            isNew = true;
            product = new Product();
            product.setCreateDate(new Date());
        }
        product.setId(code);
        product.setName(productInfo.getName());
        product.setPriceRetail(productInfo.getPrice());
 
        if (productInfo.getFileData() != null) {
            String image = productInfo.getFileData();
            if (image != null) {
                product.setImage(image);
            }
        }
        if (isNew) {
            this.sessionFactory.getCurrentSession().persist(product);
        }
        // If error in DB, Exceptions will be thrown out immediately
        this.sessionFactory.getCurrentSession().flush();
    }
 
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage,
            String likeName) {
        String sql = "Select new " + ProductInfo.class.getName() //
                + "(p.code, p.name, p.price) " + " from "//
                + Product.class.getName() + " p ";
        if (likeName != null && likeName.length() > 0) {
            sql += " Where lower(p.name) like :likeName ";
        }
        sql += " order by p.createDate desc ";
        //
        Session session = sessionFactory.getCurrentSession();
 
        Query query = session.createQuery(sql);
        if (likeName != null && likeName.length() > 0) {
            query.setParameter("likeName", "%" + likeName.toLowerCase() + "%");
        }
        return new PaginationResult<ProductInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage) {
        return queryProducts(page, maxResult, maxNavigationPage, null);
    }
    
}