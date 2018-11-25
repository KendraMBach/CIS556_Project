package org.o7planning.springmvconlinestore.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.o7planning.springmvconlinestore.dao.CharmDAO;
import org.o7planning.springmvconlinestore.entity.Birthstone;
import org.o7planning.springmvconlinestore.entity.Charm;
import org.o7planning.springmvconlinestore.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class CharmDAOImpl implements CharmDAO {
	
	@Autowired
    private SessionFactory sessionFactory;
 
    public List<Charm> getCharmList() {
    	Session session = sessionFactory.getCurrentSession();
    	String sql = "select c from " + Charm.class.getName();
    	sql += " c";
    	Query query = session.createQuery(sql);
    	List<Charm> rows = query.list();
    	
        return rows;
    }

    public Charm findOne(int id) {
    	Session session = sessionFactory.getCurrentSession();
    	String sql = "select b from " + Charm.class.getName();
    	sql += " b where b.id = :id";
    	Query query = session.createQuery(sql);
    	query.setParameter("id", id);
    	Charm charm = (Charm) query.uniqueResult();
    	
        return charm;
    }
}
