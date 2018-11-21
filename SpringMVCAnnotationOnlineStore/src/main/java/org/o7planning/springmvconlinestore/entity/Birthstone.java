package org.o7planning.springmvconlinestore.entity;
 
import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name = "birthstone")
public class Birthstone implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3781425868564854478L;


	public Birthstone(int id, String month, String type, Double cost) {
		this.id = id;
		this.month = month;
		this.type = type;
		this.cost = cost;
	}
 
    private int id;
    private String month;
    private String type;
    private Double cost;
    
 
    @Id
    @Column(name = "birthstone_id", nullable = false)
    public int getID() {
        return this.id;
    }
    
    @Column(name = "month", nullable = false)
	public String getMonth() {
		return month;
	}

    
	public void setMonth(String month) {
		this.month = month;
	}

    @Column(name = "birthstone", nullable = false)
	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}

    @Column(name = "birthstone_cost", nullable = false)
	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

    
}