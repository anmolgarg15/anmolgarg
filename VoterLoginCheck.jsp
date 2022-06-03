<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                try {
              String vid,van,bd;
              Connection con;
              PreparedStatement pstm;
              ResultSet rs;              
              vid=request.getParameter("vid");
              van=request.getParameter("van");
              bd=request.getParameter("bd");
              Class.forName("com.mysql.jdbc.Driver");
              con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electiondb","root","root");
              pstm=con.prepareStatement("Select * from Voters where VoterId=? and VoterAadharNumber=? and BirthDate=?");
              pstm.setString(1,vid);
              pstm.setString(2,van);
              pstm.setString(3,bd);
              rs=pstm.executeQuery();
              if(rs.next())
              {    
                  session.setAttribute("vid",vid);
                  session.setAttribute("van",van);
                  session.setAttribute("bd", bd);
                  response.sendRedirect("VoterHome.jsp");
              }
              else
                  out.println("<h1>Invalid VoterId,Aadhar Number or Birth Date</h1>");
              rs.close();
              con.close();
        } catch(Exception e)
        {
            out.println(e.toString());
        }
        %>
    </body>
</html>
