package org.o7planning.springmvconlinestore.dao.impl;
 
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.o7planning.springmvconlinestore.dao.CustomerDAO;
import org.o7planning.springmvconlinestore.entity.Charm;
import org.o7planning.springmvconlinestore.entity.Customer;
import org.o7planning.springmvconlinestore.entity.Product;
import org.o7planning.springmvconlinestore.model.CustomerInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
 
// Transactional for Hibernate
@Transactional
public class CustomerDAOImpl implements CustomerDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    public Customer findAccount(String email ) {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("deprecation")
		Criteria crit = session.createCriteria(Customer.class);
        crit.add(Restrictions.eq("email", email));
        return (Customer) crit.uniqueResult();
    }

	@Override
	public void registerNewUser(CustomerInfo newUser) {
		
		Customer user = null;
		String email = newUser.getEmail(); 
 
        boolean isNew = false;
        if (email != null) {
           user = this.findAccount(email);
        }
        if (user == null) {
            isNew = true;
            user = new Customer();
        }
        user.setEmail(email);
        user.setFirstName(newUser.getFirstName());
        user.setLastName(newUser.getLastName());
        user.setPassword(newUser.getPassword());
        user.setAddress(newUser.getAddress());
        user.setCity(newUser.getCity());
        user.setState(newUser.getState());
        user.setZip(newUser.getZip());
        user.setPhone(newUser.getPhone());
 
        
        if (isNew) {
            this.sessionFactory.getCurrentSession().persist(user);
        }
        // If error in DB, Exceptions will be thrown out immediately
        this.sessionFactory.getCurrentSession().flush();
    }

	@Override
	public Customer findAccountWithPass(String email, String password) {
		Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("deprecation")
		Criteria crit = session.createCriteria(Customer.class);
        crit.add(Restrictions.eq("email", email));
        crit.add(Restrictions.eq("password", password));
        return (Customer) crit.uniqueResult();
	}
	
	@Override
	public int findCustomerId(String email, String password)
	{
		Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("deprecation")
		Criteria crit = session.createCriteria(Customer.class);
        crit.add(Restrictions.eq("email", email));
        crit.add(Restrictions.eq("password", password));
        Customer thisCustomer = (Customer) crit.uniqueResult();
        return(thisCustomer.getId());
	}
	
	@Override
	public Customer lookUpCustomerWithID(int id) {
		Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("deprecation")
		Criteria crit = session.createCriteria(Customer.class);
        crit.add(Restrictions.eq("id", id));
        return((Customer) crit.uniqueResult());
	}
	
	@Override
	public List<Customer> findAll() {
		Session session = sessionFactory.getCurrentSession();
    	String sql = "select c from " + Customer.class.getName();
    	sql += " c";
    	Query query = session.createQuery(sql);
    	List<Customer> rows = query.list();
    	
        return rows;
	}
 
}