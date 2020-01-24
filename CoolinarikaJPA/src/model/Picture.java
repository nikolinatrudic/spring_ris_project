package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Picture database table.
 * 
 */
@Entity
@NamedQuery(name="Picture.findAll", query="SELECT p FROM Picture p")
public class Picture implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPicture;

	private String path;

	//bi-directional many-to-one association to Recipe
	@ManyToOne
	@JoinColumn(name="Recipe_idRecipe")
	private Recipe recipe;

	public Picture() {
	}

	public int getIdPicture() {
		return this.idPicture;
	}

	public void setIdPicture(int idPicture) {
		this.idPicture = idPicture;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Recipe getRecipe() {
		return this.recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

}