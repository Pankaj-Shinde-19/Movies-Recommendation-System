<%-- 
    Document   : Demo
    Created on : Jun 12, 2022, 3:00:48 AM
    Author     : lenovo
--%>


<%@page import="com.g30.entities.User"%>
<%
    
  User user  = (User) session.getAttribute("current-user");
   String userName = user.getUserName();
   System.out.println(userName);


%>