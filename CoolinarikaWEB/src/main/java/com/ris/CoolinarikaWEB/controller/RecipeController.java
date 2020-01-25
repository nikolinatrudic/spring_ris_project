package com.ris.CoolinarikaWEB.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ris.CoolinarikaWEB.repository.CategoryRepository;
import com.ris.CoolinarikaWEB.repository.ContainRepository;
import com.ris.CoolinarikaWEB.repository.FriendRepository;
import com.ris.CoolinarikaWEB.repository.IngredientRepository;
import com.ris.CoolinarikaWEB.repository.PictureRepository;
import com.ris.CoolinarikaWEB.repository.RecipeRepository;
import com.ris.CoolinarikaWEB.repository.UserRepository;

import model.Category;
import model.Contain;
import model.Ingredient;
import model.IsFriend;
import model.Picture;
import model.Recipe;

@Controller
public class RecipeController {

	@Autowired
	RecipeRepository rr;
	
	@Autowired
	UserRepository ur;
	
	@Autowired
	IngredientRepository ir;
	
	@Autowired
	ContainRepository cr;
	
	@Autowired
	CategoryRepository ctr;
	
	@Autowired
	PictureRepository pr;
	
	@Autowired
	FriendRepository fr;
	
//	@RequestMapping(value = "searchAll", method = RequestMethod.GET)
//	public String searhAll(HttpServletRequest request) {
//		List<Recipe> recipes = rr.findAll();
//		request.getSession().setAttribute("recipes", recipes);
//		return "recipes";
//	}
	
	@RequestMapping(value = "/users/redirectAddRecipe", method = RequestMethod.GET)
	public String redirectAddRecipe(HttpServletRequest request) {
		List<Category> categories = ctr.findAll();
		request.getSession().setAttribute("categories", categories);
		return "adding_recipe";
	}
	
	@RequestMapping(value = "seeRecipes", method = RequestMethod.GET)
	public String seeRecipes(Principal p, Integer selectedCategory, HttpServletRequest request) {
		List<Recipe> recipes;
		if(p == null) {
			recipes = rr.findByCategory(ctr.findById(selectedCategory).get());
		} else { // svi recepti bez mojih
			recipes = rr.notMyRecipes(p.getName(), selectedCategory);
		}
		request.getSession().setAttribute("categoryRecipes", recipes);
		return "recipes";
	}
	
	@RequestMapping(value = "getRecipeInfo", method = RequestMethod.GET)
	public String getRecipeInfo(Principal p, Integer forRecipe, HttpServletRequest request) {
		Recipe r = rr.findById(forRecipe).get();
		List<Contain> ingRecipes = cr.findByRecipe(r);
		request.getSession().setAttribute("lookRecipe", ingRecipes);
		request.getSession().setAttribute("ingRecipes", ingRecipes);
		List<Picture> pictures = pr.searchByRecipe(forRecipe);
		request.getSession().setAttribute("picRecipes", pictures);
		if(p == null) {// neregistrovani korisnik moze da vidi samo ime i prezime onog ko je postavio recept
			request.getSession().setAttribute("userInfo", r.getUser().getName() + " " + r.getUser().getSurname());
		} else {
			request.getSession().setAttribute("recipeOwner", r.getUser());
			IsFriend isf = fr.getMemberStatus(p.getName(), r.getUser().getUsername());
			String status = "";
			if(isf != null) {
				status = isf.getStatus(); 
				request.getSession().setAttribute("isf", isf);
			} 
			request.getSession().setAttribute("friendStatus", status);
		}
		return "full_recipe";
	}
	
	@RequestMapping(value = "/users/addRecipe", method = RequestMethod.POST)
	public String addRecipe(Principal p, String name, String description, int catId, HttpServletRequest request) {
		Recipe r = new Recipe();
		r.setName(name);
		r.setDescription(description);
		r.setUser(ur.findByUsername(p.getName()));
		r.setPostDate(new Date());
		r.setCategory(ctr.findById(catId).get());
		Recipe added = rr.save(r);
		request.getSession().setAttribute("addedRecipe", added);
		List<Ingredient> ing = ir.findAll();
		request.getSession().setAttribute("ing", ing);
		return "adding_attributes";
	}
	
	@RequestMapping(value = "/users/addIngredient", method = RequestMethod.POST)
	public String addIngredient(Principal p, int ingredient, String amount, HttpServletRequest request) {
		Recipe r = (Recipe) request.getSession().getAttribute("addedRecipe");
		Contain con = new Contain();
		con.setRecipe(r);
		Ingredient i = ir.findById(ingredient).get();
		con.setIngredient(i);
		con.setAmount(amount);
		Contain cont = cr.save(con);
		request.getSession().setAttribute("cont", cont);
		return "adding_attributes";
	}
	
	@RequestMapping(value = "/users/addPicture", method = RequestMethod.POST)
	public String addPicture(Principal p, String picture, HttpServletRequest request) {
		Recipe r = (Recipe) request.getSession().getAttribute("addedRecipe");
		Picture pic = new Picture();
		pic.setRecipe(r);
		pic.setPath(picture);
		Picture savedPicture = pr.save(pic);
		r.addPicture(savedPicture);
		rr.flush();
		request.getSession().setAttribute("pic", savedPicture);
		return "adding_attributes";
	}
}
