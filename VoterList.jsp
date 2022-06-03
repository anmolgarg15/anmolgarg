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
        String vid,van,vn,gen,bd,sdw,eid,add,ct,st,cn,pic;
      
             Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectionDB","root","root");
             pstm=con.prepareStatement("select * from Voters");
            rs=pstm.executeQuery();
            out.println("<form method=post action=DelVoter.jsp>");
            out.println("<table border=1 align=center width=100% ><th>Check</th><th>Voter Id</th><th>Voter Aadhar Number</th><th>Voter name</th><th>Gender</th><th>Birth Date</th><th>SO/DO/WO</th><th>Email Id</th><th>Address</th><th>City</th><th>State</th><th>Contact Number</th><th>Photograph</tr>");
            while(rs.next())
                           {
                vid=rs.getString(1);
                van=rs.getString(2);
                vn=rs.getString(3);
                gen=rs.getString(4);
                bd=rs.getString(5);
                sdw=rs.getString(6);
                eid=rs.getString(7);
                add=rs.getString(8);
                ct=rs.getString(9);
                st=rs.getString(10);
                cn=rs.getString(11);
                pic=rs.getString(12);
                out.println("<tr>");
                out.println("<td><input type=checkbox name=cb value="+vid+" /></td>");
                out.println("<td>"+vid+"</td>");
                out.println("<td>"+van+"</td>");
                out.println("<td>"+vn+"</td>");
                out.println("<td>"+gen+"</td>");
                out.println("<td>"+bd+"</td>");
                out.println("<td>"+sdw+"</td>");
                out.println("<td>"+eid+"</td>");
                out.println("<td>"+add+"</td>");
                out.println("<td>"+ct+"</td>");
                out.println("<td>"+st+"</td>");
                out.println("<td>"+cn+"</td>");
                out.println("<td><img src='"+pic+"' width=30 height=30 /></td>");
                out.println("</tr>");
                           }
            out.println("</table>");
            out.println("<input type=submit value=Delete />");
            out.println("</form>");
            rs.close();
            con.close();
        }catch(Exception e)
        {
            System.out.println(e.toString());
        }
        %>
    </body>
</html>
