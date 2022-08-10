package kr.ac.kopo11.chatbot.domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class User {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	private Long id;
	
	@Column
	private String userid;
	
	@Column
	private String password;
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="user", orphanRemoval = true) // fetch - eager, lazy 
	private Collection<Record> records;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	

	public Collection<Record> getRecords() {
		
		if(records == null) {
			records = new ArrayList<Record>();
		}
		
		return records;
	}

	public void setRecords(Collection<Record> records) {
		this.records = records;
	}
	
	public void addRecord (Record item) {
		Collection<Record> records = getRecords();
		records.add(item);
	}
	
	public void deleteRecord (Record item) {
		Collection<Record> records = getRecords();
		records.remove(item);
	}
	
	
	
}
