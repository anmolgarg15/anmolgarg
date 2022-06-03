<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                                                <style>
                    
 body {  
    font-weight: bold;
    font-style: oblique;
    font-size: 20px;
    background-image:url("election.jpg");
    background-repeat: no-repeat;
 background-position:center;
    background-size:cover;    
   }
</style>

    </head>
    <body>
        <h1 align="center" <span style="text-decoration: underline;"></span>ELECTION</h1>
        <form method="post" action="ElectionSetupSave.jsp" enctype="multipart/form-Data">
            <table align="center">
                <tr>
                    <td>Constituency Name:</td>
                    <td><input type="text" name="cn" required /></td>
                </tr> 
                <tr>
                    <td>Election Type:</td>
                    <td><Select Name="et">
                    <option>Select</option>
                    <option>Parliament</option>
                    <option>Assembly</option>
                    <option>Municipal</option>
                    <option>Panchayat</option>
            </select>
                </td>
                </tr>
                <tr>
                    <td>Election Date:</td>
                    <td><input type="date" name="ed" required /></td>
                </tr> 
                <tr>
                    <td>Election From Time:</td>
                    <td><input type="time" name="eft" required /></td>
                </tr> 
                <tr>
                    <td>Election To Time:</td>
                    <td><input type="time" name="ett" required /></td>
                </tr> 
                <tr>
                    <td><input type="submit" value="SUBMIT" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
