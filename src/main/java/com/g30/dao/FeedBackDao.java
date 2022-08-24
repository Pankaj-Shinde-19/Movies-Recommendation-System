package com.g30.dao;

import com.g30.entities.FeedBack;
import static java.lang.System.out;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class FeedBackDao {


    private SessionFactory factory;

    public FeedBackDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveFeedBack(FeedBack feedback)
    {
        
        boolean f = false ;
     try{
            
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(feedback);
        tx.commit();
        session.close();
        f = true;
      }
      catch(Exception e)
      {
          e.printStackTrace();
          out.println(e.getMessage());
          f = false;
      }
        return f;
    }
    
    public List<FeedBack> getAllFeedback(){
        
        Session session  = factory.openSession();
        List<FeedBack> list =  (List<FeedBack>)  session.createQuery("from FeedBack").list();
        
       return list;
    }
}
