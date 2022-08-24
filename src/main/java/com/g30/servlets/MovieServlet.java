package com.g30.servlets;

import com.g30.dao.MovieDao;
import com.g30.entities.Movie;
import com.g30.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class MovieServlet extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
          response.setContentType("text/html;charset=UTF-8");
     try{
        
    String mName = request.getParameter("movie_name");
    String mActor = request.getParameter("actor");
    String mLang = request.getParameter("movie_lang");
    String mCategory = request.getParameter("category");
    int mYear = Integer.parseInt(request.getParameter("year"));
    Part part = request.getPart("movie_pic");
    
     Movie m = new  Movie();
     m.setMovieName(mName);
     m.setActor(mActor);
     m.setMovieLang(mLang);
     m.setCategory(mCategory);
     m.setYear(mYear);
     m.setMoviePic(part.getSubmittedFileName());
     m.setRating(0);
    
     MovieDao md =  new MovieDao(FactoryProvider.getFactory());
     md.saveMovie(m);
     
       String path = request.getRealPath("files") + File.separator + part.getSubmittedFileName();
     
     
     InputStream is = part.getInputStream();
     boolean upload = uploadFile(is , path);
      if(upload)
      {
           //HttpSession httpSession = request.getSession();
          // httpSession.setAttribute("message", "Movie Save Successfully...!!");
           response.sendRedirect("admin.jsp");
     
      }
      else{
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Error...");
            response.sendRedirect("admin.jsp");
     
      }
    
     }
    
      catch(Exception e)
      {
          e.printStackTrace();
          out.println("Problem in save data to database "+e.getMessage());

      }
        
   }

   public boolean uploadFile(InputStream is , String path)
   {
       boolean test = false;
       
       try{
           
         byte data[] = new byte[is.available()];
         is.read(data);
         FileOutputStream fos =  new FileOutputStream(path);
         fos.write(data);
         fos.flush();
         fos.close();
         test = true;
       }
       catch(Exception e)
       {
           e.printStackTrace();
            out.println(e.getMessage());
       }
       
       return test;
       
       
   } 
          
}
