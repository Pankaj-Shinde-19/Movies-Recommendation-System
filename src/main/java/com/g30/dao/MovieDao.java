package com.g30.dao;

import com.g30.entities.Movie;
import static java.lang.System.out;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class MovieDao {

    private SessionFactory factory;

    public MovieDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveMovie(Movie movie) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(movie);
            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {

            e.printStackTrace();
            out.println(e.getMessage());

            f = false;

        }
        return f;
    }

    public List<Movie> getAllMovie() {

        Session session = factory.openSession();
        List<Movie> list = (List<Movie>) session.createQuery("from Movie").list();

        return list;
    }

    public int updateMovie(int userId, int movieId, int rating) {

        int r = 0;
        try {
            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            String query = "UPADATE Movie as m " + " set m.rating =: r" + "set  m.user_user_id =: uid" + "where m.movie_id =: mid";
         
            Query q =  session.createQuery(query);
            q.setParameter("r", rating);
            q.setParameter("uid", userId);
            q.setParameter("mid", movieId);
            r = q.executeUpdate();
            tx.commit();
            return r;
        } 
           catch (Exception e) {
            e.printStackTrace();
            out.println(e.getMessage());
        }

        return r;
    }
}
