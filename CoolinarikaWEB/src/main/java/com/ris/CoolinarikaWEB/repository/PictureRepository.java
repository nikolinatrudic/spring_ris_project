package com.ris.CoolinarikaWEB.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Picture;

public interface PictureRepository extends JpaRepository<Picture, Integer> {

	@Query("select p from Picture p where p.recipe.idRecipe=:id")
	List<Picture> searchByRecipe(@Param("id") Integer forRecipe);
}
