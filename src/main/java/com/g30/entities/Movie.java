package com.g30.entities;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.*;

@Entity
public class Movie {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10 , name="movie_id")
    private int movieId;
    
    @Column(length = 100 , name="movie_name")
    private String movieName;
    
    @Column(length = 100 , name ="actor" )
    private String actor;
    
    @Column(length = 100 , name = "movie_lang")
    private String movieLang;
    
    @Column(length = 100 , name = "category")
    private String category;
    
    @Column(length = 10 , name="year")
    private int year;
    
    @Column(name = "movie_pic")
    private String moviePic;
    
    @Column(name = "rating")
    private  int rating;
    
    @ManyToMany(mappedBy = "movies")
    private List<User> user;

    public Movie(int movieId, String movieName, String actor, String movieLang, String category, int year, String moviePic, int rating, List<User> user) {
        this.movieId = movieId;
        this.movieName = movieName;
        this.actor = actor;
        this.movieLang = movieLang;
        this.category = category;
        this.year = year;
        this.moviePic = moviePic;
        this.rating = rating;
        this.user = user;
    }

  
    public Movie( String movieName, String actor, String movieLang, String category, int year, String moviePic, int rating) {
        
        this.movieName = movieName;
        this.actor = actor;
        this.movieLang = movieLang;
        this.category = category;
        this.year = year;
        this.moviePic = moviePic;
        this.rating = rating;
    }
    
     
    
    public Movie() {
    
    }

     
    
    
    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getMovieLang() {
        return movieLang;
    }

    public void setMovieLang(String movieLang) {
        this.movieLang = movieLang;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getMoviePic() {
        return moviePic;
    }

    public void setMoviePic(String moviePic) {
        this.moviePic = moviePic;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    
    public List<User> getUser() {
		return user;
	}
  
    public void setUser(List<User> user) {
		this.user = user;
	}
    

    @Override
    public String toString() {
        return "Movie{" + "movieId=" + movieId + ", movieName=" + movieName + ", actor=" + actor + ", movieLang=" + movieLang + ", category=" + category + ", year=" + year + ", moviePic=" + moviePic + '}';
    }

    
    

}
