package com.ris.CoolinarikaWEB.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ris.CoolinarikaWEB.repository.FavouriteCategoryRepository;
import com.ris.CoolinarikaWEB.repository.FriendRepository;
import com.ris.CoolinarikaWEB.repository.MessageRepository;
import com.ris.CoolinarikaWEB.repository.RecipeRepository;
import com.ris.CoolinarikaWEB.repository.RoleRepository;
import com.ris.CoolinarikaWEB.repository.UserRepository;

import model.Favourite_category;
import model.IsFriend;
import model.Message;
import model.Role;
import model.User;

@Controller
//@RequestMapping(value = "UserController")
public class UserController {
	
	@Autowired
	UserRepository ur;
	
	@Autowired
	RoleRepository rr;
	
	@Autowired
	MessageRepository mr;
	
	@Autowired
	FriendRepository fr;
	
	@Autowired
	RecipeRepository recr;
	
	@Autowired
	FavouriteCategoryRepository fcr;

	
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(User u, HttpServletRequest request) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
     	u.setPassword(passwordEncoder.encode(u.getPassword()));
     	Role role = rr.findById(2).get();
     	u.setRole(role);
		ur.save(u);
		request.setAttribute("user", u);
		return "/signup";
	}
	
	@RequestMapping(value = "/users/index", method = RequestMethod.GET)
	public String fetchAll(Principal p, HttpServletRequest request) {
		request.getSession().setAttribute("userPicture", ur.findByUsername(p.getName()).getPicture());
		int messageNumber = mr.getUnseenMessageNumber(p.getName());
		if(messageNumber == 0) {
			request.getSession().setAttribute("messageNumber", "");
		} else{
			request.getSession().setAttribute("messageNumber", messageNumber);
		}
		int friendRequestNumber = fr.getNumberOfFriendRequest(p.getName());
		if(friendRequestNumber == 0) {
			request.getSession().setAttribute("friendRequest", "");
		} else{
			request.getSession().setAttribute("friendRequest", friendRequestNumber);
		}
		return "index";
	}
	
	@RequestMapping(value = "/users/getFriendsInfo", method = RequestMethod.GET)
	public String getFriendsInfo(Principal p, HttpServletRequest request) {
		List<User> friendRequestList = fr.getFriendRequests(p.getName());
		List<User> friends = fr.getFriends(p.getName());
		List<User> sentRequestsUser = fr.getSentRequestsUser(p.getName());
		request.getSession().setAttribute("requests", friendRequestList);
		request.getSession().setAttribute("friends", friends);
		request.getSession().setAttribute("sent", sentRequestsUser);
		return "social_page";
	}
	
	@Modifying
	@RequestMapping(value = "/users/acceptFriend", method = RequestMethod.POST)
	public String acceptFriend(Principal p, int id, HttpServletRequest request) {
		IsFriend isFriend = fr.acceptFriend(p.getName(), id);
		isFriend.setStatus("accepted");
		fr.flush();
		int friendRequestNumber = fr.getNumberOfFriendRequest(p.getName());
		//request.getSession().removeAttribute("friendRequests");
		if(friendRequestNumber == 0) {
			request.getSession().setAttribute("friendRequest", "");
		} else{
			request.getSession().setAttribute("friendRequest", friendRequestNumber);
		}
//		int messageNumber = mr.getUnseenMessageNumber(p.getName());
//		//request.getSession().removeAttribute("messageNumber");
//		if(messageNumber == 0) {
//			request.getSession().setAttribute("messageNumber", "");
//		} else{
//			request.getSession().setAttribute("messageNumber", messageNumber);
//		}
		//request.getSession().removeAttribute("requests");
		request.getSession().removeAttribute("friends");
		List<User> friendRequestList = fr.getFriendRequests(p.getName());
		List<User> friends = fr.getFriends(p.getName());
		request.getSession().setAttribute("requests", friendRequestList);
		request.getSession().setAttribute("friends", friends);
		
		return "social_page";
	}
	
	@RequestMapping(value = "/users/getMessages", method = RequestMethod.GET) // dobavi sve user-e sa kojima je korisnik cetovao
	public String getMessages(Principal p, HttpServletRequest request) {
		List<User> friendsChat = mr.getUserMessage(p.getName());
		request.getSession().setAttribute("friendsChat", friendsChat);
		return "messages";
	}
	
	@RequestMapping(value = "/users/seeMessages", method = RequestMethod.GET)
	public String seeMessages(Principal p, String usernamet, HttpServletRequest request) {
		List<Message> messages = mr.getMessages(p.getName(), usernamet);
		request.getSession().setAttribute("user", ur.findByUsername(usernamet));
		request.getSession().setAttribute("message", messages);unseen(p, usernamet);
		int messageNumber = mr.getUnseenMessageNumber(p.getName());
		//request.getSession().removeAttribute("messageNumber");
		if(messageNumber == 0) {
			request.getSession().setAttribute("messageNumber", "");
		} else{
			request.getSession().setAttribute("messageNumber", messageNumber);
		}
		return "messages";
	}
	
	private void unseen(Principal p, String us) {
		List<Message> notSeenMessages = mr.getSeenStatus(p.getName(), us);
		for(Message m: notSeenMessages) {
			m.setSeenStatus("y");
			mr.flush();
		}
	}
	
	@RequestMapping(value = "/users/sendMessage", method = RequestMethod.POST)
	public String sendMessage(Principal p, String content, HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		Message m = new Message();
		m.setUser1(ur.findByUsername(p.getName()));
		m.setUser2(u);
		m.setContent(content);
		m.setDate(new Date());
		m.setSeenStatus("n");
		mr.save(m);
		List<Message> messages = mr.getMessages(p.getName(), u.getUsername());
		request.getSession().setAttribute("message", messages);
		return "messages";
	}
	
	@RequestMapping(value = "/users/sendFriendMessage", method = RequestMethod.POST)
	public String sendFriendMessage(Principal p, Integer id, HttpServletRequest request) {
		User userTo = ur.findById(id).get();
		User me = ur.findByUsername(p.getName());
		List<Message> messages = mr.getMessages(p.getName(), userTo.getUsername());
		List<User> friendsChat = mr.getUserMessage(p.getName());
		if(messages.size() == 0) {
			Message m = new Message();
			m.setUser1(me);
			m.setUser2(userTo);
			m.setContent("Hi");
			m.setDate(new Date());
			m.setSeenStatus("n");
			mr.save(m);
			messages = mr.getMessages(p.getName(), userTo.getUsername());
			friendsChat = mr.getUserMessage(p.getName());
		}
		request.getSession().setAttribute("friendsChat", friendsChat);
		request.getSession().setAttribute("user", userTo);
		request.getSession().setAttribute("message", messages);
		unseen(p, userTo.getUsername());
		int messageNumber = mr.getUnseenMessageNumber(p.getName());
		//request.getSession().removeAttribute("messageNumber");
		if(messageNumber == 0) {
			request.getSession().setAttribute("messageNumber", "");
		} else{
			request.getSession().setAttribute("messageNumber", messageNumber);
		}
		return "messages";
	}
	
	@RequestMapping(value = "/users/getProfileInfo", method = RequestMethod.GET)
	public String getInfo(Principal p, HttpServletRequest request) {
		User u = ur.findByUsername(p.getName());
		request.getSession().setAttribute("profileUser", u);
		int numberOfRecipes = recr.getNumberOfRecipes(u.getUsername());
		request.getSession().setAttribute("recipeNumber", numberOfRecipes);
		List<Favourite_category> fc = fcr.findByUser(ur.findByUsername(p.getName()));
		request.getSession().setAttribute("fc", fc);
		return "user_profile";
	}
	
	@RequestMapping(value = "/users/addFriend", method = RequestMethod.POST)
	public String addUser(Principal p, HttpServletRequest request) {
		User user1 = ur.findByUsername(p.getName()); //ja
		User user2 = (User) request.getSession().getAttribute("recipeOwner");
		IsFriend isf = new IsFriend();
		isf.setUser1(user1);
		isf.setUser2(user2);
		isf.setStatus("pending");
		fr.save(isf);
		user1.addIsFriends1(isf);
		user2.addIsFriends2(isf);
		ur.saveAndFlush(user1);
		ur.saveAndFlush(user2);
		request.getSession().setAttribute("friendStatus", isf.getStatus());
		return "full_recipe";
	}
	
	@RequestMapping(value = "/users/cancelFriendRequest", method = RequestMethod.POST)
	public String cancelFriendRequest(Principal p, HttpServletRequest request) {
		User user1 = ur.findByUsername(p.getName()); //ja
		User user2 = (User) request.getSession().getAttribute("recipeOwner");
		IsFriend isf = fr.findEntityForRequestCancel(user1.getUsername(), user2.getUsername());
		user1.removeIsFriends1(isf);
		user2.removeIsFriends2(isf);
		ur.saveAndFlush(user1);
		ur.saveAndFlush(user2);
		fr.delete(isf);
		request.getSession().setAttribute("friendStatus", "");
		return "full_recipe";
	}
	
	@RequestMapping(value = "/users/deleteFriend", method = RequestMethod.POST)
	public String deleteFriend(Principal p, Integer id, HttpServletRequest request) {
		User user1 = ur.findByUsername(p.getName()); //ja
		User user2 = ur.findById(id).get();
		IsFriend isf = fr.findEntityForFriendDelete(p.getName(), id);
		user1.removeIsFriends1(isf);
		user2.removeIsFriends2(isf);
		ur.saveAndFlush(user1);
		ur.saveAndFlush(user2);
		fr.delete(isf);
		List<User> friends = fr.getFriends(p.getName());
		request.getSession().setAttribute("friends", friends);
		return "social_page";
	}
	
	@RequestMapping(value = "/users/deleteFriendRequest", method = RequestMethod.POST)
	public String deleteFriendRequest(Principal p, Integer id, HttpServletRequest request) {
		User user1 = ur.findByUsername(p.getName()); //ja
		User user2 = ur.findById(id).get();
		IsFriend isf = fr.findEntityForRequestDelete(user1.getUsername(), id);
		user1.removeIsFriends1(isf);
		user2.removeIsFriends2(isf);
		ur.saveAndFlush(user1);
		ur.saveAndFlush(user2);
		fr.delete(isf);
		List<User> friends = fr.getFriends(p.getName());
		request.getSession().setAttribute("friends", friends);
		List<User> friendRequestList = fr.getFriendRequests(p.getName());
		request.getSession().setAttribute("requests", friendRequestList);
		int friendRequestNumber = fr.getNumberOfFriendRequest(p.getName());// naravno refresovati notifikaciju za zahteve
		if(friendRequestNumber == 0) {
			request.getSession().setAttribute("friendRequest", "");
		} else{
			request.getSession().setAttribute("friendRequest", friendRequestNumber);
		}
		return "social_page";
	}
}
