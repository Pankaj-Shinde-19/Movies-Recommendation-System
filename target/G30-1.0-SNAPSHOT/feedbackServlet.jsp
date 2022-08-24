

<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.g30.entities.User"%>
<%@page import="com.g30.helper.FactoryProvider"%>
<%@page import="com.g30.dao.FeedBackDao"%>
<%@page import="com.g30.entities.FeedBack"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   
        User user = (User) session.getAttribute("current-user");
     try
     {
         String userName = request.getParameter("user_name");
        String  email = request.getParameter("email");
        String feedback = request.getParameter("feedback");
       
      
         
       FeedBack feed = new FeedBack(userName, email, feedback);
                   
      FeedBackDao fd = new FeedBackDao(FactoryProvider.getFactory());
     boolean ans =  fd.saveFeedBack(feed);
      
      //HttpSession httpSession = request.getSession();
      //httpSession.setAttribute("message", "FeedBack Submitted Successfully...!!");
      response.sendRedirect("normal.jsp");
      return;
  
    }
     
     catch(Exception e)
     {
         e.printStackTrace();
         out.println("Data Not Save in Database "+e.getMessage());
     }

%>