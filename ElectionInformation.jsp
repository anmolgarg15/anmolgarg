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
                                <style>
                    
 body {
    color:black;
    font-weight: bold;
    font-style: oblique;
    font-size: 20px;
   }
</style>

    </head>
    <body>
        <h1 align="center" <span style="text-decoration: underline;"></span>ELECTION INFORMATION</h1>
        <%
        try {
              Connection con;
        PreparedStatement pstm;
        ResultSet rs;
        String cn,et,ed,eft,ett;
      
             Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electiondb","root","root");
             pstm=con.prepareStatement("select * from Election");
            rs=pstm.executeQuery();
            
            while(rs.next())
            {
                cn=rs.getString(1);
                et=rs.getString(2);
                ed=rs.getString(3);
                eft=rs.getString(4);
                ett=rs.getString(5);
                out.println("<table align=center>");
                out.println("<tr><td><h3>Constituency Name:-</h3></td><td> "+cn+"</td></tr>");
                out.println("<tr><td><h3>Election Type:-</h3></td><td> "+et+"</td></tr>");
                out.println("<tr><td><h3>Election Date:-</h3></td><td> "+ed+"</td></tr>");
                out.println("<tr><td><h3>Election From Time:-</h3></td><td> "+eft+"</td></tr>");
                out.println("<tr><td><h3>Election To Time:-</h3></td><td> "+ett+"</td></tr>");
                out.println("</table>");
                
            }
            rs.close();
            con.close();
        }catch(Exception e)
        {
            out.println(e.toString());
        }
        %>
    </body>
</html>
