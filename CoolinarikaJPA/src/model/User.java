package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the User database table.
 * 
 */
@Entity
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idUser;

	private String email;

	private String name;

	private String password;

	private String picture;

	private String surname;

	private String username;

	//bi-directional many-to-one association to Favourite_category
	@OneToMany(mappedBy="user")
	private List<Favourite_category> favouriteCategories;

	//bi-directional many-to-one association to Message
	@OneToMany(mappedBy="user1")
	private List<Message> messages1;

	//bi-directional many-to-one association to Message
	@OneToMany(mappedBy="user2")
	private List<Message> messages2;

	//bi-directional many-to-one association to Recipe
	@OneToMany(mappedBy="user")
	private List<Recipe> recipes;

	//bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name="Role_idRole")
	private Role role;

	//bi-directional many-to-one association to IsFriend
	@OneToMany(mappedBy="user1")
	private List<IsFriend> isFriends1;

	//bi-directional many-to-one association to IsFriend
	@OneToMany(mappedBy="user2")
	private List<IsFriend> isFriends2;

	public User() {
	}

	public int getIdUser() {
		return this.idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getSurname() {
		return this.surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Favourite_category> getFavouriteCategories() {
		return this.favouriteCategories;
	}

	public void setFavouriteCategories(List<Favourite_category> favouriteCategories) {
		this.favouriteCategories = favouriteCategories;
	}

	public Favourite_category addFavouriteCategory(Favourite_category favouriteCategory) {
		getFavouriteCategories().add(favouriteCategory);
		favouriteCategory.setUser(this);

		return favouriteCategory;
	}

	public Favourite_category removeFavouriteCategory(Favourite_category favouriteCategory) {
		getFavouriteCategories().remove(favouriteCategory);
		favouriteCategory.setUser(null);

		return favouriteCategory;
	}

	public List<Message> getMessages1() {
		return this.messages1;
	}

	public void setMessages1(List<Message> messages1) {
		this.messages1 = messages1;
	}

	public Message addMessages1(Message messages1) {
		getMessages1().add(messages1);
		messages1.setUser1(this);

		return messages1;
	}

	public Message removeMessages1(Message messages1) {
		getMessages1().remove(messages1);
		messages1.setUser1(null);

		return messages1;
	}

	public List<Message> getMessages2() {
		return this.messages2;
	}

	public void setMessages2(List<Message> messages2) {
		this.messages2 = messages2;
	}

	public Message addMessages2(Message messages2) {
		getMessages2().add(messages2);
		messages2.setUser2(this);

		return messages2;
	}

	public Message removeMessages2(Message messages2) {
		getMessages2().remove(messages2);
		messages2.setUser2(null);

		return messages2;
	}

	public List<Recipe> getRecipes() {
		return this.recipes;
	}

	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
	}

	public Recipe addRecipe(Recipe recipe) {
		getRecipes().add(recipe);
		recipe.setUser(this);

		return recipe;
	}

	public Recipe removeRecipe(Recipe recipe) {
		getRecipes().remove(recipe);
		recipe.setUser(null);

		return recipe;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<IsFriend> getIsFriends1() {
		return this.isFriends1;
	}

	public void setIsFriends1(List<IsFriend> isFriends1) {
		this.isFriends1 = isFriends1;
	}

	public IsFriend addIsFriends1(IsFriend isFriends1) {
		getIsFriends1().add(isFriends1);
		isFriends1.setUser1(this);

		return isFriends1;
	}

	public IsFriend removeIsFriends1(IsFriend isFriends1) {
		getIsFriends1().remove(isFriends1);
		isFriends1.setUser1(null);

		return isFriends1;
	}

	public List<IsFriend> getIsFriends2() {
		return this.isFriends2;
	}

	public void setIsFriends2(List<IsFriend> isFriends2) {
		this.isFriends2 = isFriends2;
	}

	public IsFriend addIsFriends2(IsFriend isFriends2) {
		getIsFriends2().add(isFriends2);
		isFriends2.setUser2(this);

		return isFriends2;
	}

	public IsFriend removeIsFriends2(IsFriend isFriends2) {
		getIsFriends2().remove(isFriends2);
		isFriends2.setUser2(null);

		return isFriends2;
	}

}