<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.g30.entities.Movie"%>
<%@page import="com.g30.helper.FactoryProvider"%>
<%@page import="com.g30.dao.MovieDao"%>
<%@page import="com.g30.entities.User"%>
<%

    List<User> user = (List<User>) session.getAttribute("current-user");

    int mId = Integer.parseInt(request.getParameter("movie_id"));
    int rating = Integer.parseInt(request.getParameter("rating"));
   

    Transaction tx = null;
    try {

        Session s = FactoryProvider.getFactory().openSession();
        tx = s.beginTransaction();
        Movie movie = s.get(Movie.class, mId);
        movie.setRating(rating);
        movie.setUser(user);
        s.saveOrUpdate(movie);
        response.sendRedirect("moviedetail.jsp");
        tx.commit();
       

    } catch (Exception e) {
        if (tx != null) {
            tx.rollback();
        }
        e.printStackTrace();

    }

%>



