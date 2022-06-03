<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        String eid=session.getAttribute("eid")+" ";
        out.println("<h3>WELCOME"+eid+"</h3>");
        %>
<a href="LogOut.jsp" target="_parent" align="right"><h3>Logout</h3></a>
        <table width="100%" border="1">
            <tr>
                        <td><a href = "ElectionSetup.jsp" target=work>Election Setup</a></td>
                        <td><a href = "VoterSetup.jsp" target=work>Voter Setup</a></td>
                        <td><a href = "VoterList.jsp" target=work>Voter List</a></td>
			<td><a href = "CandidateSetup.jsp" target=work>Candidate Setup<a/></td>
                        <td><a href = "CandidateList.jsp" target=work>Candidate List</a></td>
			<td><a href = "PartySetup.jsp" target=work>Party Setup<a/></td>
                        <td><a href = "PartyList.jsp" target=work>Party List</a></td>
			
            </tr>
        </table>
       <iframe width=100% height=500 id=work name=work >
		</iframe>

    </body>
</html>
