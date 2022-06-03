<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <style>
                    
 body {
    color:black;
    font-weight: bold;
    font-style: oblique;
    font-size: 20px;
    background-image:url("ecilogin.jpg");
    background-repeat: no-repeat;
 background-position:center;
    background-size:cover;    
}
</style>

    </head>
    <body>
        <br/>
        <br/>
        <br/>
        <br/>
        <h1 align="center" <span style="text-decoration: underline;"></span>ECI </br> LOGIN FORM</h1>
        <form method="post" action="ECILoginCheck.jsp" target="_parent">
        <table align="center">
            <tr>
                <td>Email Id:</td>
                <td><input type="email" name="eid" id="eid" />
               
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="pwd" id="pwd" /></td>
            </tr>
                        <tr>
                <td><input type="submit" value="LOGIN" /></td>
            </tr>

        </table>
        </form>
    </body>
</html>
