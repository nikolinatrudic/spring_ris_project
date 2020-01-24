package com.ris.CoolinarikaWEB.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ris.CoolinarikaWEB.repository.CategoryRepository;
import com.ris.CoolinarikaWEB.repository.FavouriteCategoryRepository;
import com.ris.CoolinarikaWEB.repository.UserRepository;

import model.Category;
import model.Favourite_category;

@Controller
public class CategoryController {

	@Autowired
	CategoryRepository cr;
	
	@Autowired
	FavouriteCategoryRepository fcr;
	
	@Autowired
	UserRepository ur;
	
	@RequestMapping(value = "searchAll", method = RequestMethod.GET)
	public String searhAll(HttpServletRequest request) {
		List<Category> categories = cr.findAll();
		request.getSession().setAttribute("allCategories", categories);
		return "recipes";
	}
	
	@RequestMapping(value = "/admin/addCategory", method = RequestMethod.POST)
	public String addCategory(String name, HttpServletRequest request) {
		Category c = new Category();
		c.setName(name);
		Category cSaved = cr.save(c);
		request.setAttribute("cat", cSaved);
		return "new_category";
	}
	
	@RequestMapping(value = "/users/favouriteCategories", method = RequestMethod.GET)
	public String getFavoriteCategories(Principal p, HttpServletRequest request) {
		List<Favourite_category> fc = fcr.findByUser(ur.findByUsername(p.getName()));
		request.getSession().setAttribute("fc", fc);
		return "user_profile";
	}
	
	@RequestMapping(value = "/users/addFavouriteCategory", method = RequestMethod.POST)
	public String getFavoriteCategories(Principal p, String name, HttpServletRequest request) {
		Favourite_category fc = new Favourite_category();
		fc.setUser(ur.findByUsername(p.getName()));
		fc.setName(name);
		Favourite_category fcat = fcr.save(fc);
		request.setAttribute("fav", fcat);
		List<Favourite_category> fc1 = fcr.findByUser(ur.findByUsername(p.getName()));
		request.getSession().setAttribute("fc", fc1);
		return "user_profile";
	}
}
