package com.ris.CoolinarikaWEB.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.IsFriend;
import model.User;

public interface FriendRepository extends JpaRepository<IsFriend, Integer>{

	@Query("select count(if.id) from IsFriend if where if.user2.username=:username and status='pending'")
	int getNumberOfFriendRequest(@Param("username") String username);
	
	@Query("select if.user1 from IsFriend if where if.user2.username=:username and status='pending'")
	List<User> getFriendRequests(@Param("username") String username);
	
	@Query("select u from User u where u in (select if.user1 from IsFriend if where if.user2.username=:username and status='accepted')"
			+ " or u in (select if.user2 from IsFriend if where if.user1.username=:username and status='accepted')")
	List<User> getFriends(@Param("username") String username);
	
	@Query("select if from IsFriend if where if.user1.idUser=:idFrom and if.user2.username=:usernameTo")
	IsFriend acceptFriend(@Param("usernameTo") String username, @Param("idFrom") int id);
	
	@Query("select if.user2 from IsFriend if where if.user1.username=:username and status='pending' ")
	List<User> getSentRequestsUser(@Param("username") String username);
}
