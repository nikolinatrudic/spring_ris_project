package com.ris.CoolinarikaWEB.repository;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;

import model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	//@Query("select u from User u where u.username=:username")
	User findByUsername(String username);
}
