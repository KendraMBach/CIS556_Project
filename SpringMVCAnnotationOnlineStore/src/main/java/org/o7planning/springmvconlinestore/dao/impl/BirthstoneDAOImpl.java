package org.o7planning.springmvconlinestore.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.o7planning.springmvconlinestore.dao.BirthstoneDAO;
import org.o7planning.springmvconlinestore.entity.Birthstone;
import org.o7planning.springmvconlinestore.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class BirthstoneDAOImpl implements BirthstoneDAO {
	
	@Autowired
    private SessionFactory sessionFactory;
	
	public List<Birthstone> retrieveAll() {
    	Session session = sessionFactory.getCurrentSession();
    	String sql = "select b from " + Birthstone.class.getName();
    	sql += " b";
    	Query query = session.createQuery(sql);
    	List<Birthstone> rows = query.list();
    	
        return rows;
	    }
	
	public Birthstone findOne(int id) {
    	Session session = sessionFactory.getCurrentSession();
    	String sql = "select b from " + Birthstone.class.getName();
    	sql += " b where b.id = :id";
    	Query query = session.createQuery(sql);
    	query.setParameter("id", id);
    	Birthstone birthstone = (Birthstone) query.uniqueResult();
    	
        return birthstone;
	    }
}
