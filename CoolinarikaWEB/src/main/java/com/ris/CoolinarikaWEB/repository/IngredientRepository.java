package com.ris.CoolinarikaWEB.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Ingredient;

public interface IngredientRepository extends JpaRepository<Ingredient, Integer> {

	@Query("select c.ingredient from Contain c where c.recipe.idRecipe=:id")
	List<Ingredient> searchByRecipe(@Param("id") Integer r);
}
