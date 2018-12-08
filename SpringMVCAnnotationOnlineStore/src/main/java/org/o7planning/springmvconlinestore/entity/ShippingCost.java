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
	public ShippingCost() {
		super();
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 8328306079219543687L;


	public ShippingCost(int id, String state, Double cost) {
		this.id = id;
		this.state = state;
		this.cost = cost;
	}
 
    private int id;
    private String state;
    private Double cost;
    
 
    @Id
    @Column(name = "shipping_code_id", nullable = false)
    public int getID() {
        return this.id;
    }
    
    public void setID(int id) {
        this.id = id;
    }

    @Column(name = "state_code", nullable = false)
	public String getState() {
		return state;
	}


	public void setState(String type) {
		this.state = type;
	}

    @Column(name = "shipping_cost", nullable = false)
	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

    
}