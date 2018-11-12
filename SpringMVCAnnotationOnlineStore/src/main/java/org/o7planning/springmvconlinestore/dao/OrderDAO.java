package org.o7planning.springmvconlinestore.dao;
 
import java.util.List;
 
import org.o7planning.springmvconlinestore.model.CartInfo;
import org.o7planning.springmvconlinestore.model.OrderDetailInfo;
import org.o7planning.springmvconlinestore.model.OrderInfo;
import org.o7planning.springmvconlinestore.model.PaginationResult;
 
public interface OrderDAO {
 
    public void saveOrder(CartInfo cartInfo);
 
    public PaginationResult<OrderInfo> listOrderInfo(int page,
            int maxResult, int maxNavigationPage);
    
    public OrderInfo getOrderInfo(String orderId);
    
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId);
 
}