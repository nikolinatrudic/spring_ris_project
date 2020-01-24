package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Favourite_category database table.
 * 
 */
@Entity
@NamedQuery(name="Favourite_category.findAll", query="SELECT f FROM Favourite_category f")
public class Favourite_category implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idFavourite_category;

	private String name;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="User_idUser")
	private User user;

	//bi-directional many-to-many association to Recipe
	@ManyToMany(mappedBy="favouriteCategories")
	private List<Recipe> recipes;

	public Favourite_category() {
	}

	public int getIdFavourite_category() {
		return this.idFavourite_category;
	}

	public void setIdFavourite_category(int idFavourite_category) {
		this.idFavourite_category = idFavourite_category;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Recipe> getRecipes() {
		return this.recipes;
	}

	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
	}

}