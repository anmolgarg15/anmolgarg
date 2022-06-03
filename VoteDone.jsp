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
        try
                               {
            String vid,cvi;
            vid=session.getAttribute("vid")+"";
            cvi=request.getParameter("cvi");
            Connection con;
            PreparedStatement pstm;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electiondb","root","root");
            pstm=con.prepareStatement("Insert into polling values(?)");
            pstm.setString(1,vid);
            pstm.executeUpdate();
            
            
            pstm=con.prepareStatement("Update candidates set votecount=votecount+1 where candidatevoterid=?");
            pstm.setString(1,cvi);
            pstm.executeUpdate();
            con.close();
            out.println("Your vote has been placed successfully");
            
        }catch(Exception e)
                               {
            out.println(e.toString());
        }
        %>
        
    </body>
</html>
