package org.o7planning.springmvconlinestore.entity;
 
import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name = "shipping_costs")
public class ShippingCost implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8328306079219543687L;


	public ShippingCost(int id, String month, String type, Double cost) {
		this.id = id;
		this.type = type;
		this.cost = cost;
	}
 
    private int id;
    private String type;
    private Double cost;
    
 
    @Id
    @Column(name = "charm_id", nullable = false)
    public int getID() {
        return this.id;
    }
    

    @Column(name = "charm", nullable = false)
	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}

    @Column(name = "charm_price", nullable = false)
	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

    
}