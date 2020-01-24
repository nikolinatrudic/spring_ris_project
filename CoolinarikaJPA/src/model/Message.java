package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the Message database table.
 * 
 */
@Entity
@NamedQuery(name="Message.findAll", query="SELECT m FROM Message m")
public class Message implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idMessage;

	private String content;

	@Temporal(TemporalType.TIMESTAMP)
	private Date date;

	private String seenStatus;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="User_idUser")
	private User user1;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="User_idUser1")
	private User user2;

	public Message() {
	}

	public int getIdMessage() {
		return this.idMessage;
	}

	public void setIdMessage(int idMessage) {
		this.idMessage = idMessage;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getSeenStatus() {
		return this.seenStatus;
	}

	public void setSeenStatus(String seenStatus) {
		this.seenStatus = seenStatus;
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