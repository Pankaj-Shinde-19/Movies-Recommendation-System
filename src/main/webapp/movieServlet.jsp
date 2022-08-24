<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="com.g30.helper.FactoryProvider"%>
<%@page import="com.g30.dao.MovieDao"%>
<%@page import="com.g30.entities.Movie"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>

<%
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
   
    // Movie m = new Movie(mName, mActor, mLang, mCategory, mYear, part.getSubmittedFileName(), 0);
      
     MovieDao md =  new MovieDao(FactoryProvider.getFactory());
     md.saveMovie(m);
     
     /* HttpSession httpSession = request.getSession();
     httpSession.setAttribute("message", "Movie Save Successfully...!!");
     response.sendRedirect("admin.jsp"); */
   
    }
    catch(Exception e)
    {
        e.printStackTrace();
        out.println("Problem in save data to database "+e.getMessage());
        
    }


%>

