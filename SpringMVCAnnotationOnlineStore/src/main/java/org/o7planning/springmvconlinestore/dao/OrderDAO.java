package org.o7planning.springmvconlinestore.dao;
 
import java.util.List;
import java.util.Map;

import org.o7planning.springmvconlinestore.entity.Order;
import org.o7planning.springmvconlinestore.entity.Product;
import org.o7planning.springmvconlinestore.model.CartInfo;
import org.o7planning.springmvconlinestore.model.OrderDetailInfo;
import org.o7planning.springmvconlinestore.model.OrderInfo;
import org.o7planning.springmvconlinestore.model.PaginationResult;
 
public interface OrderDAO {
 
    public void saveOrder(CartInfo cartInfo);
 
    public PaginationResult<OrderInfo> listOrderInfo(int page,
            int maxResult, int maxNavigationPage);
    
    public Order findSingleOrder(int orderId);
    
    public Order findOrderForCustomer(int orderId, int customerId);
    
    public List<Order> listAllOrderItemsForSingleOrder(int orderId);
    
    public List<Product> listAllOrderItemsForAllOrders();
 
}