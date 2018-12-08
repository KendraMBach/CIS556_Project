package org.o7planning.springmvconlinestore.dao;

import java.util.List;

import org.o7planning.springmvconlinestore.entity.ShippingCost;


public interface ShippingCostsDAO {
	
	public List<ShippingCost> getStateList();
	
	public ShippingCost findOne(int id);
	
	public ShippingCost findByState(String state);

}
