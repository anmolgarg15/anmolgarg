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
        String cvi,caan,can,pn,es,gen,bd,qs,occ,add,ct,st,pic,cn;
      
             Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectionDB","root","root");
             pstm=con.prepareStatement("select * from Candidates");
            rs=pstm.executeQuery();
            out.println("<form method=post action=DelCandidate.jsp>");
            out.println("<table border=1 width=100% ><th>Check</th><th>Candidate Voter Id</th><th>Candidate Aadhar Number</th><th>Candidate name</th><th>Party Name</th><th>Election Symbol</th><th>Gender</th><th>Birth Date</th><th>Qualification</th><th>Occupation</th><th>Address</th><th>City</th><th>State</th><th>Photograph</th><th>Contact Number</th></tr>");
            while(rs.next())
                           {
                cvi=rs.getString(1);
                caan=rs.getString(2);
                can=rs.getString(3);
                pn=rs.getString(4);
                es=rs.getString(5);
                gen=rs.getString(6);
                bd=rs.getString(7);
                qs=rs.getString(8);
                occ=rs.getString(9);
                add=rs.getString(10);
                ct=rs.getString(11);
                st=rs.getString(12);
                pic=rs.getString(13);
                cn=rs.getString(14);
                out.println("<tr>");
                out.println("<td><input type=checkbox name=cb value="+cvi+" /></td>");
                out.println("<td>"+cvi+"</td>");
                out.println("<td>"+caan+"</td>");
                out.println("<td>"+can+"</td>");
                out.println("<td>"+pn+"</td>");
                out.println("<td><img src='"+es+"' width=30 height=30 /></td>");
                out.println("<td>"+gen+"</td>");
                out.println("<td>"+bd+"</td>");
                out.println("<td>"+qs+"</td>");
                out.println("<td>"+occ+"</td>");
                out.println("<td>"+add+"</td>");
                out.println("<td>"+ct+"</td>");
                out.println("<td>"+st+"</td>");
                out.println("<td><img src='"+pic+"' width=30 height=30 /></td>");
                out.println("<td>"+cn+"</td>");
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
