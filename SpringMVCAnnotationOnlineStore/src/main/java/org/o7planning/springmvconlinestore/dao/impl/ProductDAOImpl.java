package org.o7planning.springmvconlinestore.dao.impl;
 
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.o7planning.springmvconlinestore.dao.ProductDAO;
import org.o7planning.springmvconlinestore.entity.Product;
import org.o7planning.springmvconlinestore.model.PaginationResult;
import org.o7planning.springmvconlinestore.model.ProductInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order;
 
// Transactional for Hibernate
@Transactional
public class ProductDAOImpl implements ProductDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    public Product findProduct(int code) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Product.class);
        crit.add(Restrictions.eq("id", code));
        return (Product) crit.uniqueResult();
    }
    
    public Product findProductBySize(int code, String size) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Product.class);
        crit.add(Restrictions.eq("id", code));
        crit.add(Restrictions.eq("size", size));
        return (Product) crit.uniqueResult();
    }
    
    public List<String> allSizes(String name) {
    	Session session = sessionFactory.getCurrentSession();
    	String sql = "select distinct p.size from " + Product.class.getName() + " p where lower(p.name) = :name";
    	Query query = session.createQuery(sql);
    	query.setParameter("name", name.toLowerCase());
    	List<String> rows = query.list();
    	
        return rows;
    }
    
 
    public ProductInfo findProductInfo(int code) {
        Product product = this.findProduct(code);
        if (product == null) {
            return null;
        }
        //return new ProductInfo(product.getId(), product.getName(), product.getPriceRetail());
        return new ProductInfo(product.getId(), product.getName(), product.getPriceRetail(), product.getDescription(), product.getImage(),
    			product.getCategory(), product.getColor(), product.getInStock(), product.getOptBirthstone(), product.getOptCharm1(), //
    			product.getOptCharm2(), product.getOptCharm3(), product.getOptCharm4());
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
            //product.setCreateDate(new Date());
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
                + "(p.id, p.name, p.priceRetail, p.description, p.image, p.category, p.color) " + " from "//
                + Product.class.getName() + " p ";
        if (likeName != null && likeName.length() > 0) {
            sql += " Where lower(p.name) like :likeName and ";
        }
        else {
        	sql+= " Where ";
        }
        sql += "p.id IN (select max(p2.id) from " + Product.class.getName()
        		+ " as p2 group by p2.name, p2.color, p2.description, p2.priceRetail)";
        sql += " order by p.priceRetail asc ";
        //
        Session session = sessionFactory.getCurrentSession();
 
        Query query = session.createQuery(sql);
        if (likeName != null && likeName.length() > 0) {
            query.setParameter("likeName", "%" + likeName.toLowerCase() + "%");
        }
        return new PaginationResult<ProductInfo>(query, page, maxResult, maxNavigationPage);
    }
    
    public PaginationResult<ProductInfo> queryCategoryProducts(int page, int maxResult, int maxNavigationPage,
            String likeName, String category) { 
    	
        String sql = "Select new " + ProductInfo.class.getName() //
                + "(p.id, p.name, p.priceRetail, p.description, p.image, p.category, p.color) " + " from "//
                + Product.class.getName() + " p " //
                + " Where lower(p.category) = :category";
        	sql += " and p.id IN (select max(p2.id) from " + Product.class.getName()
        		+ " as p2 group by p2.name, p2.color, p2.description, p2.priceRetail)";
        	sql += " order by p.priceRetail asc ";
        //
        Session session = sessionFactory.getCurrentSession();
 
        Query query = session.createQuery(sql);
        if (category != null && category.length() > 0) {
            query.setParameter("category", category.toLowerCase());
        }
        return new PaginationResult<ProductInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage) {
        return queryProducts(page, maxResult, maxNavigationPage, null);
    }
    
    public PaginationResult<ProductInfo> queryBySubCategoryProducts(int page, int maxResult, int maxNavigationPage,
            String likeName, String mainCategory, String subCategory) { 
    	
    	Query query = null;
    	
    	
        String sql = "Select distinct new " + ProductInfo.class.getName() //
                + "(p.id, p.name, p.priceRetail, p.description, p.image, p.category, p.color) " + " from "//
                + Product.class.getName() + " p " //
                + " Where lower(p.category) = :mainCategory";
        if(subCategory.equals("all")) {
        	sql += " and p.id IN (select max(p2.id) from " + Product.class.getName()
            		+ " as p2 group by p2.name, p2.color, p2.description, p2.priceRetail)";
        	sql += " order by p.priceRetail asc ";
        //
        Session session = sessionFactory.getCurrentSession();
 
        query = session.createQuery(sql);
        query.setParameter("mainCategory", mainCategory.toLowerCase());
        	
        }
        else {
        	
        	sql += " and lower(p.name) = :subCategory";
        	sql += " and p.id IN (select max(p2.id) from " + Product.class.getName()
            		+ " as p2 group by p2.name, p2.color, p2.description, p2.priceRetail)";
        	sql += " order by p.priceRetail asc ";
            //
            Session session = sessionFactory.getCurrentSession();
     
            query = session.createQuery(sql);
            query.setParameter("mainCategory", mainCategory.toLowerCase());
            query.setParameter("subCategory", subCategory.toLowerCase());
        }
        return new PaginationResult<ProductInfo>(query, page, maxResult, maxNavigationPage);
    }
    
    
    
}