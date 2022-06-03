<%@page import="java.sql.DriverManager"%>
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
        Connection con;
        PreparedStatement pstm;
        String cvi[]=request.getParameterValues("cb");
        int i,l;
        String cv;
        try
                               {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electiondb","root","root");
            l=cvi.length;
            for(i=0;i<l;i++)
                               {
                cv=(cvi[i]);
                pstm=con.prepareStatement("Delete from Candidates where CandidateVoterId=?");
                pstm.setString(1,cv);
                pstm.executeUpdate();
                out.println(cv+"Candidate Deleted");
            }
            con.close();
        }catch(Exception e)
                               {
            e.toString();
        }
        %>
    </body>
</html>
