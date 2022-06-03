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
            FileItem a,b,c,d,e,f,g,h,i,j,k,l,m,n;
            a=(FileItem)item.get(0);
            b=(FileItem)item.get(1);
            c=(FileItem)item.get(2);
            d=(FileItem)item.get(3);
            e=(FileItem)item.get(4);
            f=(FileItem)item.get(5);
            g=(FileItem)item.get(6);
            h=(FileItem)item.get(7);
            i=(FileItem)item.get(8);
            j=(FileItem)item.get(9);
            k=(FileItem)item.get(10);
            l=(FileItem)item.get(11);
            m=(FileItem)item.get(12);
            n=(FileItem)item.get(13);
            String cvi,caan,can,pt,es,gen,bd,qs,occ,add,ct,st,pic,cn,fname1,fname2,vc;
            cvi=a.getString();
            caan=b.getString();
            can=c.getString();
            pt=d.getString();
            es=e.getName();
            gen=f.getString();
            bd=g.getString();
            qs=h.getString();
            occ=i.getString();
            add=j.getString();
            ct=k.getString();
            st=l.getString();
            pic=m.getName();
            cn=n.getString();
            fname1="C:\\Elections\\web\\"+es;
            fname2="C:\\Elections\\web\\"+pic;
            File f1=new File(fname1);
            File f2=new File(fname2);
            e.write(f1);
            m.write(f2);
            Connection con;
            PreparedStatement pstm;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electiondb","root","root");
            pstm=con.prepareStatement("Insert into candidates values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,0)");
            pstm.setString(1,cvi);
            pstm.setString(2,caan);
            pstm.setString(3,can);
            pstm.setString(4,pt);
            pstm.setString(5,es);
            pstm.setString(6,gen);
            pstm.setString(7,bd);
            pstm.setString(8,qs);
            pstm.setString(9,occ);
            pstm.setString(10,add);
            pstm.setString(11,ct);
            pstm.setString(12,st);
            pstm.setString(13,pic);
            pstm.setString(14,cn);
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
