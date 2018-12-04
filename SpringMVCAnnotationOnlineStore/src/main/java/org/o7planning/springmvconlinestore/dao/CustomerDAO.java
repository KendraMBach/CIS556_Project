package org.o7planning.springmvconlinestore.dao;
 
import java.util.List;

import org.o7planning.springmvconlinestore.entity.Customer;
import org.o7planning.springmvconlinestore.model.CustomerInfo;
 
public interface CustomerDAO {
 
    
    public Customer findAccount(String userName );
    
    public void registerNewUser(CustomerInfo newUser);

	public Customer findAccountWithPass(String email, String password);

	public int findCustomerId(String email, String password);

	public Customer lookUpCustomerWithID(int id);

	public List<Customer> findAll();
    
}