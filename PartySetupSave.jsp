<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
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
            FileItem a,b;
            a=(FileItem)item.get(0);
            b=(FileItem)item.get(1);
            String pn,es,fname;
            pn=a.getString();
            es=b.getName();
            fname="C:\\Elections\\web\\"+es;
            File f1=new File(fname);
            b.write(f1);
            Connection con;
            PreparedStatement pstm;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/electiondb","root","root");
            pstm=con.prepareStatement("Insert into parties values(?,?)");
            pstm.setString(1,pn);
            pstm.setString(2,es);
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
