<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
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
        <script>
            function voteDone(cvi,btn)
            {
                alert(cvi)
                
                
                x=new XMLHttpRequest();
                x.onreadystatechange=function()
                {
                    
                    if(x.readyState==4 && x.status==200)
                        {
                            document.getElementById("res").innerHTML=x.responseText;
                        }
                }
                x.open("GET","VoteDone.jsp?cvi="+cvi,true);
                x.send();

                candiCount=document.getElementById("candiCount").value;
                i=1;
                while(i<=candiCount)
                {
                    document.getElementById("i"+i).disabled=true;
                    i++;
                    
                }

            }
        </script>
    </head>
    <body style="margin:0px">
        <table align="center" width="100%"><tr>
                <td><h1 align="center" <span style="text-decoration: underline;"></span>PERSONAL INFORMATION</h1></td>
         <td><a href="LogOut.jsp" target="_parent"><h3>Logout</h3></a></td></tr></table>
        <%
                try {
                            String vid,van,vn,gen,bd,sdw,eid,add,ct,st,cn,pic,es,can,cvi,edt,t,csn,ed,eft,ett;
             vid=session.getAttribute("vid")+"";
                van=session.getAttribute("van")+"";
 bd=session.getAttribute("bd")+"";

        Connection con;
        PreparedStatement pstm;
        ResultSet rs;
             java.util.Date dt=new java.util.Date();
            int d,m,y;
            d=dt.getDate();
            m=dt.getMonth()+1;
            y=dt.getYear()+1900;
            edt=y+"-"+m+"-"+d;

             Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectionDB","root","root");
             pstm=con.prepareStatement("select * from Voters where VoterId=? and VoterAadharNumber=? and BirthDate=?");
              pstm.setString(1,vid);
              pstm.setString(2,van);
              pstm.setString(3, bd);
            rs=pstm.executeQuery();
            rs.next();
                                    
                vn=rs.getString(3);
                gen=rs.getString(4);
                sdw=rs.getString(6);
                eid=rs.getString(7);
                add=rs.getString(8);
                ct=rs.getString(9);
                st=rs.getString(10);
                cn=rs.getString(11);
                pic=rs.getString(12);
               out.println("<table align=center width=50% >");
                out.println("<td rowspan=7><img src='"+pic+"' width=150 height=150 /></td>");
                out.println("<tr><td>Voter Id:-</td><td>"+vid+"</td>");
                out.println("<td>Contact Number:-</td><td>"+cn+"</td></tr>");
                out.println("<tr><td>Voter Name:-</td><td>"+vn+"</td>");
                out.println("<td>Gender:-</td><td>"+gen+"</td></tr>");
                out.println("<tr><td>BirthDate:-</td><td>"+bd+"</td>");
                out.println("<td>SO/DO/WO:-</td><td>"+sdw+"</td></tr>");
                out.println("<tr><td>Email id:-</td><td>"+eid+"</td>");
                out.println("<td>Address:-</td><td>"+add+"</td></tr>");
                out.println("<tr><td>City:-</td><td>"+ct+"</td>");
                out.println("<td>State:-</td><td>"+st+"</td></tr>");
                
                out.println("</table>");         
             
                
                rs.close();
          GregorianCalendar time=new GregorianCalendar();
          int hr,min,sec;
        hr=time.get(Calendar.HOUR);   
           min=time.get(Calendar.MINUTE);   
        sec=time.get(Calendar.SECOND);       

        t=hr+":"+min+":"+sec;

             pstm=con.prepareStatement("select * from Election where ElectionDate=? and ?>=ElectionFromTime and ?<=ElectionToTime");
             pstm.setString(1,edt);
            pstm.setString(2,t);
           pstm.setString(3,t);
           rs=pstm.executeQuery();            
   
            if(rs.next())

                               {
                out.println("<h1 align=center>Time:-"+t+"</h1>");
                pstm=con.prepareStatement("select * from polling where Voterid=?");
                pstm.setString(1, vid);
                rs=pstm.executeQuery();
                if(rs.next())
                    out.println("<h1 align=center>You have already voted.</h1>");
                else
                                       {                                                                               
             pstm=con.prepareStatement("select * from candidates");
            rs=pstm.executeQuery();
            out.println("<table border=1 align=center width=50%  ><th>Election Symbol</th><th>Candidate Name</th></tr>");
            
            int i=0;
                while(rs.next())
                {
                    i++;
                cvi=rs.getString(1);
                can=rs.getString(3);
                es=rs.getString(5);
                out.println("<tr>");            
                out.println("<td><input id=i"+i+" type=image src='"+es+"' onclick=voteDone('"+cvi+"') width=30 height=30 /><span id='res' ></span></td>");
                out.println("<td>"+can+"</td>");
                out.println("</tr>");
               
                           }
             out.println("</table>");
            out.println("<input type=hidden id=candiCount value="+i+" />");
            rs.close();
            con.close();
                }
                           }
                                 
                            else
                               {
                                 pstm=con.prepareStatement("select * from Election where ElectionDate>?");
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
                out.print("<h1 align=center>No Election Scheduled till now</h1>");

                      }
            
                            rs.close();    
              }catch(Exception e)
        {
            System.out.println(e.toString());
                   }
        %>
    </body>
</html>
