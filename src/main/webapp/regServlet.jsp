
<%@page import="org.hibernate.Session"%>
<%@page import="com.g30.helper.FactoryProvider"%>
<%@page import="com.g30.entities.User"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
  try {
                 String userName = request.getParameter("user_name");
                 String userEmail = request.getParameter("user_email");
                 String userPassword = request.getParameter("user_password");
                 String userPhone = request.getParameter("user_phone");
                 String userAddress = request.getParameter("user_address");
                 
            	
                int userId;
                try (Session hibernateSession = FactoryProvider.getFactory().openSession()) {
                    
                    User user  = new User(userName, userEmail, userPassword, userPhone, userAddress,"Normal");
                    Transaction tx = hibernateSession.beginTransaction();
                    userId = (int) hibernateSession.save(user);
                    tx.commit();
                }
               
             %>
             <link rel="stylesheet" href="css/message.css"/>
             <div class="text">
                 <h1>Registered &nbsp; Successfully !!</h1>
                 <h2> USER ID : <%= userId %> </h2>
                 <a href="index.html"><button>Home</button></a>
                 <a href="login.jsp"><button>Login</button></a>
             </div>
            <%    
            } catch (HibernateException e) {
                
                
                System.out.println("Data Not Entered");
            }
            
            %>