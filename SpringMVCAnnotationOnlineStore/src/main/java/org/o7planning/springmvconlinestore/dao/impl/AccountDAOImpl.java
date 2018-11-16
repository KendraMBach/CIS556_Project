package org.o7planning.springmvconlinestore.dao.impl;
 
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.o7planning.springmvconlinestore.dao.AccountDAO;
import org.o7planning.springmvconlinestore.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
 
// Transactional for Hibernate
@Transactional
public class AccountDAOImpl implements AccountDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
 
    public Account findAccount(String userName ) {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("deprecation")
		Criteria crit = session.createCriteria(Account.class);
        crit.add(Restrictions.eq("userName", userName));
        return (Account) crit.uniqueResult();
    }
 
}