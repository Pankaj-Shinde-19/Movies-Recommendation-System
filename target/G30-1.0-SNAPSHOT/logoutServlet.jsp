
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
              HttpSession httpSession  = request.getSession();
              httpSession.removeAttribute("current-user");
              response.sendRedirect("index.html");

%>