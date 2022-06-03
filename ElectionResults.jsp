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
        try
                               {
            String can,vc,pn,es;
            Connection con;
            PreparedStatement pstm;
            ResultSet rs;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electiondb","root","root");
            pstm=con.prepareStatement("Select CandidateName,PartyName,ElectionSymbol,VoteCount from candidates order by VoteCount desc");
            rs=pstm.executeQuery();
            out.println("<table border=1 align=center width=50% ><th>Candidate Name</th><th>Party Name</th><th>Election Symbol</th><th>Number of Votes</th></tr>");
           
                        while(rs.next())
                           {
                can=rs.getString(1);
                pn=rs.getString(2);
                es=rs.getString(3);
                vc=rs.getString(4);
                
                out.println("<tr>");
                out.println("<td>"+can+"</td>");
                out.println("<td>"+pn+"</td>");
                out.println("<td><img src='"+es+"' width=30 height=30 /></td>");
                out.println("<td>"+vc+"</td>");
                out.println("</tr>");
                           }
            out.println("</table>");
            rs.close();
            con.close();

        }catch(Exception e)
        {
            out.println(e.toString());
        }                   
        %>
        
    </body>
</html>
