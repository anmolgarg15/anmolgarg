<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                                        <style>
                    
 body {
    color:tan;
    font-weight: bold;
    font-style: oblique;
    font-size: 20px;
    background-image:url("candidateregister.jpg");
    background-repeat: no-repeat;
 background-position:center;
    background-size:cover;    
   }
</style>

    </head>
    <body>
        <h1 align="center" <span style="text-decoration: underline;"></span>CANDIDATE REGISTRATION FORM</h1>
        <form method="post" action="CandidateSetupSave.jsp" enctype="multipart/form-Data">
            <table align="center">
                <tr>
                    <td>Candidate Voter Id:</td>
                    <td><input type="text" name="cvi" id="cvi" required /></td>
                </tr>
                <tr>
                    <td>Candidate Aadhar Number:</td>
                    <td><input type="number" name="caan" required /></td>
                </tr>
                <tr>
                    <td>Candidate Name:</td>
                    <td><input type="text" name="can" required /></td>
                </tr>
                 <tr>
                    <td>Party Name:</td>
                    <td><input type="text" name="pt" required /></td>
                </tr> 

                <tr>
                    <td>Election Symbol:</td>
                    <td><input type="file" name="es" required /></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="radio" name="gen" value="Male" required />MALE</td>
                    <td><input type="radio" name="gen" value="Female" required />FEMALE</td>
                    <td><input type="radio" name="gen" value="Other" required />OTHER</td>
                </tr>
                <tr>
                    <td>Birth Date:</td>
                    <td><input type="date" name="bd" required /></td>
                </tr>
                <tr>
                    <td>Qualification:</td>
                    <td><input type="text" name="qs" required /></td>
                </tr>
                <tr>
                    <td>Occupation:</td>
                    <td><input type="text" name="occ" required /></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="add" required /></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input type="text" name="ct" required /></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><input type="text" name="st" required /></td>
                </tr>
                <tr>
                    <td>Photograph:</td>
                    <td><input type="file" name="pic" required /></td>
                </tr>
                <tr>
                    <td>Contact Number:</td>
                    <td><input type="number" name="cn" required /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="SUBMIT" required /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
