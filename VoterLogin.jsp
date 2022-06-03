<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <style>
                    
 body {
    color:whitesmoke;
    font-weight: bold;
    font-style: oblique;
    font-size: 20px;
    background-image:url("login.jpg");
    background-repeat: no-repeat;
 background-position:center;
    background-size:cover;    
}
</style>
     </head>
    <body>
        <h2  color:white" align="center"> VOTER LOGIN</h2>
        <form method="post" action="VoterLoginCheck.jsp" target="_parent">
        <table align="center">
            <tr>
                <td>Voter Id:</td>
                <td><input type="text" name="vid" id="eid" />
               
                </td>
            </tr>
            <tr>
                <td>Voter Aadhar Number:</td>
                <td><input type="number" name="van" /></td>
            </tr>
            <tr>
                <td>Birth Date:</td>
                <td><input type="date" name="bd" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="LOGIN" /></td>
            </tr>
        </table>
      </form>
    </body>
</html>
