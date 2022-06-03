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
        Connection con;
        PreparedStatement pstm;
        ResultSet rs;
        String pn,es;
      
             Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectionDB","root","root");
             pstm=con.prepareStatement("select * from parties");
            rs=pstm.executeQuery();
            
            out.println("<table border=1 align=center width=50% ><th>Party Name</th><th>Election Symbol</th></tr>");
            while(rs.next())
                           {
                pn=rs.getString(1);
                es=rs.getString(2);
                out.println("<tr>");
                
                out.println("<td>"+pn+"</td>");
                out.println("<td><img src='"+es+"' width=30 height=30 /></td></tr>");
                out.println("</tr>");
                           }
            out.println("</table>");
            
            
            rs.close();
            con.close();
        }catch(Exception e)
        {
            System.out.println(e.toString());
        }
        %>
    </body>
</html>
