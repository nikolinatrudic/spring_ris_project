package com.ris.CoolinarikaWEB.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Category;
import model.Recipe;

public interface RecipeRepository extends JpaRepository<Recipe, Integer> {

	@Query("select count(r.idRecipe) from Recipe r where r.user.username=:username")
	int getNumberOfRecipes(@Param("username") String username);
	
	List<Recipe> findByCategory(Category category);
}
