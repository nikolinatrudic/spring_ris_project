package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the is_friend database table.
 * 
 */
@Entity
@Table(name="is_friend")
@NamedQuery(name="IsFriend.findAll", query="SELECT i FROM IsFriend i")
public class IsFriend implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String status;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="User_idUser")
	private User user1;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="User_idUser1")
	private User user2;

	public IsFriend() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser1() {
		return this.user1;
	}

	public void setUser1(User user1) {
		this.user1 = user1;
	}

	public User getUser2() {
		return this.user2;
	}

	public void setUser2(User user2) {
		this.user2 = user2;
	}

}