package org.o7planning.springmvconlinestore.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.o7planning.springmvconlinestore.dao.ShippingCostsDAO;
import org.o7planning.springmvconlinestore.entity.ShippingCost;
import org.springframework.beans.factory.annotation.Autowired;

public class ShippingCostsDAOImpl implements ShippingCostsDAO {
	
	@Autowired
    private SessionFactory sessionFactory;
 
    public List<ShippingCost> getStateList() {
    	Session session = sessionFactory.getCurrentSession();
    	String sql = "select s from " + ShippingCost.class.getName();
    	sql += " s";
    	Query query = session.createQuery(sql);
    	List<ShippingCost> rows = query.list();
    	
        return rows;
    }

    public ShippingCost findOne(int id) {
    	Session session = sessionFactory.getCurrentSession();
    	String sql = "select s from " + ShippingCost.class.getName();
    	sql += " s where s.id = :id";
    	Query query = session.createQuery(sql);
    	query.setParameter("id", id);
    	ShippingCost shippingCost = (ShippingCost) query.uniqueResult();
    	
        return shippingCost;
    }

	@Override
	public ShippingCost findByState(String state) {
		Session session = sessionFactory.getCurrentSession();
    	String sql = "select s from " + ShippingCost.class.getName();
    	sql += " s where s.state = :state";
    	Query query = session.createQuery(sql);
    	query.setParameter("state", state);
    	ShippingCost shippingCost = (ShippingCost) query.uniqueResult();
    	
        return shippingCost;
	}

}
