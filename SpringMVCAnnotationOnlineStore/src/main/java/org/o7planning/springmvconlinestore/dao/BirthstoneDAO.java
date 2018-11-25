package org.o7planning.springmvconlinestore.dao;

import java.util.List;

import org.o7planning.springmvconlinestore.entity.Birthstone;

public interface BirthstoneDAO {
	
	public List<Birthstone> retrieveAll();
	
	public Birthstone findOne(int id);

}
