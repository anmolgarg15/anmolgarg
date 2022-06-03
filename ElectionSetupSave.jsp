<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
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
            DiskFileItemFactory fact=new DiskFileItemFactory();
            ServletFileUpload upl=new ServletFileUpload(fact);
            List item=upl.parseRequest(request);
            FileItem a,b,c,d,e;
            a=(FileItem)item.get(0);
            b=(FileItem)item.get(1);
            c=(FileItem)item.get(2);
            d=(FileItem)item.get(3);
            e=(FileItem)item.get(4);
            String cn,et,ed,eft,ett;
            cn=a.getString();
            et=b.getString();
            ed=c.getString();
            eft=d.getString();
            ett=e.getString();
            Connection con;
            PreparedStatement pstm;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electiondb","root","root");
            pstm=con.prepareStatement("Delete from Election");
            pstm.executeUpdate();
            pstm=con.prepareStatement("Delete from Polling");
            pstm.executeUpdate();
            pstm=con.prepareStatement("update candidates set VoteCount=0");
            pstm.executeUpdate();
            pstm=con.prepareStatement("Insert into Election values(?,?,?,?,?)");
            pstm.setString(1,cn);
            pstm.setString(2,et);
            pstm.setString(3,ed);
            pstm.setString(4,eft);
            pstm.setString(5,ett);
            pstm.executeUpdate();
            con.close();
            out.println("Record Saved");
        }catch(Exception e)
                               {
            out.println(e.toString());
        }
        %>
    </body>
</html>
