<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
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
              
        <%
        try {
              Connection con;
        PreparedStatement pstm;
        ResultSet rs;
        String csn,et,ed,eft,ett,edt;
            java.util.Date dt=new java.util.Date();
            int d,m,y;
            d=dt.getDate();
            m=dt.getMonth()+1;
            y=dt.getYear()+1900;
            edt=y+"-"+m+"-"+d;
             Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electiondb","root","root");
 
               
                                                         
             pstm=con.prepareStatement("select * from Election where ElectionDate>=?");
             pstm.setString(1,edt);
            rs=pstm.executeQuery();            
            if(rs.next())
            {
                csn=rs.getString(1);                
                ed=rs.getString(3);
                eft=rs.getString(4);
                ett=rs.getString(5);                                                           
                out.println("<table style='background-color:red;color:white;width:100%' >");
                out.println("<tr><td>Constituency Name:-"+csn+"</td>");
                out.println("<td>Election Date:-"+ed+"</td>");
                out.println("<td> Time:-"+eft+" to");
                out.println(ett+"</td></tr>");
                out.println("</table>");
                       }
            else
                out.print("No Election Scheduled till now");
             rs.close();
            con.close();
        }catch(Exception e)
        {
            out.println(e.toString());
        }
        %>

        
        <table width="100%" border="1" align="right">
            <tr>
                        
			<td><a href = "ElectionResults.jsp" target=work>Election Results<a/></td>
			<td><a href = "ECILogin.jsp" target=work>ECI Login<a/></td>
			<td><a href = "VoterLogin.jsp" target=work>Voter Login<a/></td>
			
            </tr></table>
        <table width="100%"> 
            <tr>
                <td> <img src="ecilogo.jpg" width="100%" height="450" /></td>
                <td><iframe width=100% height=450 id=work name=work align="right">
                    </iframe></td>
                
        </tr>

        </table>
</body>
</html>
