package org.o7planning.springmvconlinestore.dao;

import java.util.List;

import org.o7planning.springmvconlinestore.entity.Charm;

public interface CharmDAO {
	
	public List<Charm> getCharmList();
	
	public Charm findOne(int id);

}
