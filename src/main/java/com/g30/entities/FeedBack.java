package com.g30.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class FeedBack {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10 , name = "id")
    private int Id;
            
    @Column(length = 100 , name ="user_name")
    private String userName;
    
    @Column(length = 100 , name ="email")
    private String email;
    
    @Column(length = 500 , name ="feedback")
    private String feedback;

    public FeedBack(String userName, String email, String feedback) {
        this.userName = userName;
        this.email = email;
        this.feedback = feedback;
    }

    public FeedBack(int Id, String userName, String email, String feedback) {
        this.Id = Id;
        this.userName = userName;
        this.email = email;
        this.feedback = feedback;
    }

    public FeedBack() {
        
    }

    
    
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }
    
    
    
    
    

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    @Override
    public String toString() {
        return "FeedBack{" + "userName=" + userName + ", email=" + email + ", feedback=" + feedback + '}';
    }
    
    
}
