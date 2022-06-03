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
              String eid,pwd;
              Connection con;
              PreparedStatement pstm;
              ResultSet rs;              
              eid=request.getParameter("eid");
              pwd=request.getParameter("pwd");
              Class.forName("com.mysql.jdbc.Driver");
              con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electiondb","root","root");
              pstm=con.prepareStatement("Select * from ECIUsers where EmailId=? and Password=?");
              pstm.setString(1,eid);
              pstm.setString(2,pwd);
              rs=pstm.executeQuery();
              if(rs.next())
              {    
                  session.setAttribute("eid",eid);
                  session.setAttribute("pwd",pwd);
                  response.sendRedirect("ECIHome.jsp");
              }
              else
                  out.println("<h1>Invalid EmailId or Password</h1>");
              rs.close();
              con.close();
        } catch(Exception e)
        {
            out.println(e.toString());
        }
        %>
    </body>
</html>
