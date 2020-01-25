package com.ris.CoolinarikaWEB.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Contain;
import model.Recipe;

public interface ContainRepository extends JpaRepository<Contain, Integer> {
	
	List<Contain> findByRecipe(Recipe r);
}
