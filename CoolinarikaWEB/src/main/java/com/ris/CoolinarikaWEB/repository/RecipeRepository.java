package com.ris.CoolinarikaWEB.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Category;
import model.Recipe;
import model.User;

public interface RecipeRepository extends JpaRepository<Recipe, Integer> {

	@Query("select count(r.idRecipe) from Recipe r where r.user.username=:username")
	int getNumberOfRecipes(@Param("username") String username);
	
	List<Recipe> findByCategory(Category category);
	
	List<Recipe> findByUser(User u);
	
	@Query("select r from Recipe r where r.category.idCategory=:cat and r.user.username <> :username")
	List<Recipe> notMyRecipes(@Param("username") String username, @Param("cat") Integer cat);
	
	@Query("select c.recipe from Contain c where c.ingredient.idIngredient=:idIng")
	List<Recipe> searchByIngredient(@Param("idIng") Integer idIng);
}
