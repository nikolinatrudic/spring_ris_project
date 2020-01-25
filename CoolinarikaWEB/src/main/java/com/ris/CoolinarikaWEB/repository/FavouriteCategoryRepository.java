package com.ris.CoolinarikaWEB.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Favourite_category;
import model.User;

public interface FavouriteCategoryRepository extends JpaRepository<Favourite_category, Integer> {
	
	List<Favourite_category> findByUser(User user);
	
}