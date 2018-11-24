package org.o7planning.springmvconlinestore.authentication;
 
import java.util.ArrayList;
import java.util.List;
 
import org.o7planning.springmvconlinestore.dao.CustomerDAO;
import org.o7planning.springmvconlinestore.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
 
@Service
public class MyDBAuthenticationService implements UserDetailsService {
 
    @Autowired
    private CustomerDAO customerDAO;
 
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //Customer account = accountDAO.findAccount(username);
        Customer customer = customerDAO.findAccount(username);
        System.out.println("Account= " + customer);
 
        if (customer == null) {
            throw new UsernameNotFoundException("User " //
                    + username + " was not found in the database");
        }
 
        // EMPLOYEE,MANAGER,..
        //String role = account.getUserRole();
 
        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
 
        // ROLE_EMPLOYEE, ROLE_MANAGER
        //GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role);
 
        //grantList.add(authority);
 
        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
 
        UserDetails userDetails = (UserDetails) new User(String.valueOf(customer.getCustomerID()), //
        		customer.getPassword(), enabled, accountNonExpired, //
                credentialsNonExpired, accountNonLocked, grantList);
 
        return userDetails;
    }
 
}