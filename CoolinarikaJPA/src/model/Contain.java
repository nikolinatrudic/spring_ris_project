package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the contains database table.
 * 
 */
@Entity
@Table(name="contains")
@NamedQuery(name="Contain.findAll", query="SELECT c FROM Contain c")
public class Contain implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idContains;

	private String amount;

	//bi-directional many-to-one association to Ingredient
	@ManyToOne
	@JoinColumn(name="Ingredient_idIngredient")
	private Ingredient ingredient;

	//bi-directional many-to-one association to Recipe
	@ManyToOne
	@JoinColumn(name="Recipe_idRecipe")
	private Recipe recipe;

	public Contain() {
	}

	public int getIdContains() {
		return this.idContains;
	}

	public void setIdContains(int idContains) {
		this.idContains = idContains;
	}

	public String getAmount() {
		return this.amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public Ingredient getIngredient() {
		return this.ingredient;
	}

	public void setIngredient(Ingredient ingredient) {
		this.ingredient = ingredient;
	}

	public Recipe getRecipe() {
		return this.recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

}