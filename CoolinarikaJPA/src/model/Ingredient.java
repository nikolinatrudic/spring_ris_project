package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Ingredient database table.
 * 
 */
@Entity
@NamedQuery(name="Ingredient.findAll", query="SELECT i FROM Ingredient i")
public class Ingredient implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idIngredient;

	private String name;

	//bi-directional many-to-one association to Contain
	@OneToMany(mappedBy="ingredient")
	private List<Contain> contains;

	public Ingredient() {
	}

	public int getIdIngredient() {
		return this.idIngredient;
	}

	public void setIdIngredient(int idIngredient) {
		this.idIngredient = idIngredient;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Contain> getContains() {
		return this.contains;
	}

	public void setContains(List<Contain> contains) {
		this.contains = contains;
	}

	public Contain addContain(Contain contain) {
		getContains().add(contain);
		contain.setIngredient(this);

		return contain;
	}

	public Contain removeContain(Contain contain) {
		getContains().remove(contain);
		contain.setIngredient(null);

		return contain;
	}

}