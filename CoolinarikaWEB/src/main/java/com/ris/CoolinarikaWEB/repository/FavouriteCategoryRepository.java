package com.ris.CoolinarikaWEB.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Favourite_category;
import model.Recipe;
import model.User;

public interface FavouriteCategoryRepository extends JpaRepository<Favourite_category, Integer> {
	
	List<Favourite_category> findByUser(User user);
	
	@Query("select r from Recipe r inner join r.favouriteCategories fc where fc.idFavourite_category=:idCat")
	List<Recipe> getRecipesFromFavCat(@Param("idCat") Integer idCat);
	
}