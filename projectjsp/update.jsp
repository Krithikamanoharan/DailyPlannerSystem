<html>
<body>
<form>

<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%
int taskid=Integer.parseInt(request.getParameter("taskid"));
String newtaskname=request.getParameter("newtaskname");
String newcategory=request.getParameter("newcategory");
String newduedate=request.getParameter("newduedate");
String username=request.getParameter("username");
try {
			Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = null;
    		con = DriverManager.getConnection("jdbc:mysql://localhost/Table1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
    		try {
java.sql.Statement stmt=con.createStatement();

 				
                int a=stmt.executeUpdate("update tasks set Task='"+newtaskname+"' where ID="+taskid+";");
                int b=stmt.executeUpdate("update tasks set Category='"+newcategory+"' where ID="+taskid+";");
                
				
				if(a>0|b>0){
					out.println(username);
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