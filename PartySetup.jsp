<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                                <style>
                    
 body {
   
    color:whitesmoke;
    font-weight: bold;
    font-style: oblique;
    font-size: 20px;
    background-image:url("parrty.jpg");
    background-repeat: no-repeat;
 background-position:center;
    background-size:cover;    
   }
</style>

    </head>
    <body>
        <h1 align="center" <span style="text-decoration: underline;"></span>PARTY REGISTRATION</h1>
        <form method="post" action="PartySetupSave.jsp" enctype="multipart/form-Data">
            <table align="center">
                <tr>
                    <td>Party Name:</td>
                    <td><input type="text" name="pn" /></td>
                </tr>
                <tr>
                    <td>Election Symbol:</td>
                    <td><input type="file" name="es" accept="image/*" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="SUBMIT" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
