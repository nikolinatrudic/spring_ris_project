package com.ris.CoolinarikaWEB.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Message;
import model.User;

public interface MessageRepository extends JpaRepository<Message, Integer> {
	
	@Query("select count(m.idMessage) from Message m where m.user2.username=:username and m.seenStatus='n'")
	int getUnseenMessageNumber(@Param("username") String username);
	
	@Query("select distinct u from User u where u in (select m.user1 from Message m where m.user2.username=:username)"
			+ " or u in (select m.user2 from Message m where m.user1.username=:username)")
	List<User> getUserMessage(@Param("username") String username);
	
	@Query("select m from Message m where (m.user1.username=:usernameOne and m.user2.username=:usernameTwo) or "
			+ "(m.user2.username=:usernameOne and m.user1.username=:usernameTwo) order by m.date desc")
	List<Message> getMessages(@Param("usernameOne") String usernameOne, @Param("usernameTwo") String usernameTwo);

	@Query("select m from Message m where m.user1.username=:usernameTwo and m.user2.username=:usernameOne and m.seenStatus='n'")
	List<Message> getSeenStatus(@Param("usernameOne") String usernameOne, @Param("usernameTwo") String usernameTwo);
}
