package com.ris.CoolinarikaWEB.security;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ris.CoolinarikaWEB.repository.UserRepository;

import model.User;

@Service
public class UserService implements UserDetailsService {

	@Autowired
	UserRepository ur;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		User user = ur.findByUsername(username);
		if (user == null) 
			throw new UsernameNotFoundException(username);
		UserDetails userDetails = new MyUserDetails(user);
		
		return userDetails;
	}
	
	 public User getUserFromSession() {
	      SecurityContext context = SecurityContextHolder.getContext();
	      Authentication authentication = context.getAuthentication();
	      Object principal = authentication.getPrincipal();
	      if (principal instanceof MyUserDetails) {
	    	  MyUserDetails userDetails = (MyUserDetails) principal;
	          return userDetails.getU();
	      }
	      return null;
	  }

}
