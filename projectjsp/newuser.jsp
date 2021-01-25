<html>
<body>
<form>

<%@ page import="java.sql.*" %>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");

    	
    	try {
    		Connection con = null;
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost/Table1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
    		try {

                java.sql.Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select Username from users where Username ='"+username+"' ;");
                if(rs.next()){

                    out.println("User exists");
                }
        		else{
                    int a=stmt.executeUpdate("insert into users value('" + username + "','" +
password + "')"); 
				con.close();
				if(a>0){
					out.println("<a href='login.jsp?username="+username+"'>Click</a>");}
					
        			
			}} catch (Exception e) {
				
			}
    		finally {
				con.close();
			}
		} catch (Exception e) {
			out.println("User exists");
		}


%> 	
</form>
</body>
</html>