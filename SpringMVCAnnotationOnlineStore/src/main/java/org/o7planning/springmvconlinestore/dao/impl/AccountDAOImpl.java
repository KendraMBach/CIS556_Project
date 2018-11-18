package org.o7planning.springmvconlinestore.dao.impl;
 
import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.o7planning.springmvconlinestore.dao.AccountDAO;
import org.o7planning.springmvconlinestore.entity.Account;
import org.o7planning.springmvconlinestore.entity.Product;
import org.o7planning.springmvconlinestore.model.CustomerInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
 
// Transactional for Hibernate
@Transactional
public class AccountDAOImpl implements AccountDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    public Account findAccount(String email ) {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("deprecation")
		Criteria crit = session.createCriteria(Account.class);
        crit.add(Restrictions.eq("email", email));
        return (Account) crit.uniqueResult();
    }

	@Override
	public void registerNewUser(CustomerInfo newUser) {
		
		Account user = null;
		String email = newUser.getEmail(); 
 
        boolean isNew = false;
        if (email != null) {
           user = this.findAccount(email);
        }
        if (user == null) {
            isNew = true;
            user = new Account();
        }
        user.setEmail(email);
        user.setFirstName(newUser.getFirstName());
        user.setLastName(newUser.getLastName());
        user.setPassword(newUser.getPassword());
 
        
        if (isNew) {
            this.sessionFactory.getCurrentSession().persist(user);
        }
        // If error in DB, Exceptions will be thrown out immediately
        this.sessionFactory.getCurrentSession().flush();
    }

	@Override
	public Account findAccountWithPass(String email, String password) {
		Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("deprecation")
		Criteria crit = session.createCriteria(Account.class);
        crit.add(Restrictions.eq("email", email));
        crit.add(Restrictions.eq("password", password));
        return (Account) crit.uniqueResult();
	}
 
}