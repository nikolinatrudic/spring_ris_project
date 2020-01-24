package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Category database table.
 * 
 */
@Entity
@NamedQuery(name="Category.findAll", query="SELECT c FROM Category c")
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idCategory;

	private String name;

	//bi-directional many-to-one association to Recipe
	@OneToMany(mappedBy="category")
	private List<Recipe> recipes;

	public Category() {
	}

	public int getIdCategory() {
		return this.idCategory;
	}

	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Recipe> getRecipes() {
		return this.recipes;
	}

	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
	}

	public Recipe addRecipe(Recipe recipe) {
		getRecipes().add(recipe);
		recipe.setCategory(this);

		return recipe;
	}

	public Recipe removeRecipe(Recipe recipe) {
		getRecipes().remove(recipe);
		recipe.setCategory(null);

		return recipe;
	}

}