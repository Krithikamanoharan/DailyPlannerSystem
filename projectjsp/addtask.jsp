<html>
<body>
<form>

<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%
int taskid=Integer.parseInt(request.getParameter("taskid"));
String taskname=request.getParameter("taskname");
String category=request.getParameter("category");
String date=request.getParameter("duedate");
String username=request.getParameter("username");

try {
			Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = null;
    		con = DriverManager.getConnection("jdbc:mysql://localhost/Table1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
    		try {
java.sql.Statement stmt=con.createStatement();

 				
        		int a=stmt.executeUpdate("insert into tasks values (" + taskid + ",'" +
taskname + "','" +category+ "','"+"2020-11-24"+"','"+username+"')"); 
				
				if(a>0){
					out.println("<a href='login.jsp?username="+username+"'>Click</a>");
				}else{
					out.println("User exists");
				}
					
        			
			} catch (Exception e) {
				out.println(e.getMessage());
			}
    		finally {
				con.close();
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}


%> 	
</form>
</body>
</html>