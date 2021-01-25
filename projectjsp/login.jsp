<html>

<body>
<link rel="stylesheet" type="text/css" href="style.css"/> 
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<table>
<tr>
<th>TASK ID</th><th>TASK</th><th>CATEGORY</th><th>DUEDATE</th>
</tr>

<%
String username=request.getParameter("username");



    	try {
    		Connection con = null;
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost/Table1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
    		try {

        		java.sql.Statement stmt=con.createStatement();  
        		
        		ResultSet rs=stmt.executeQuery("select * from users where Username='"+username+"';"); 
                				
        		if(rs.next())
        		{
                out.println("<p>WELCOME "+username.toUpperCase()+"</p>");
				ResultSet rs2=stmt.executeQuery("select * from tasks where Username='"+username+"';");
				out.println("<br>");
				while(rs2.next()){
					out.println("<tr>");
					out.println("<td>"+rs2.getInt(1)+"</td><td>"+rs2.getString(2)+"</td><td>"+rs2.getString(3)+"</td><td>"+rs2.getString(4)+"</td></tr>");
				}
				out.println("<a href='addtask.html'><button type='submit'>ADD TASK</button></a><a href='del.html?username="+username+"'><button type='submit'>DELETE TASK</button></a><a href='update.html?username="+username+"''><button type='submit'>UPDATE TASK</button></a>");
				
	
                }
				
        		else{
					out.println("Inavlid username or password");
				}
				

        			
			} catch (Exception e) {
				// TODO: handle exception
			}
    		finally {
				con.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
	
		}
%>
</body>
</html>