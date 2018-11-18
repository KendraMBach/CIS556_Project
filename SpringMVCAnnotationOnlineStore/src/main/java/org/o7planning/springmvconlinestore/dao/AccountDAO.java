package org.o7planning.springmvconlinestore.dao;
 
import org.o7planning.springmvconlinestore.entity.Account;
import org.o7planning.springmvconlinestore.model.CustomerInfo;
 
public interface AccountDAO {
 
    
    public Account findAccount(String userName );
    
    public void registerNewUser(CustomerInfo newUser);

	public Account findAccountWithPass(String email, String password);
    
}