<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String regdate = request.getParameter("regdate");
	String content = request.getParameter("content");
	
	if(title == ""|| title ==null){
		out.println("title�� null�Դϴ�");
	}
	if(writer== ""|| writer ==null){
		out.println("writer�� null�Դϴ�");
	}
	if(regdate == ""|| regdate ==null){
		out.println("regdate�� null�Դϴ�");
	}
	if(content == ""|| content ==null){
		out.println("content�� null�Դϴ�");
	}
	
	 Connection conn = null;
	
	 
	try{
		String url="jdbc:mysql://localhost:3306/board";
		String driverName = "com.mysql.jdbc.Driver";
		
		Class.forName(driverName);
		conn = DriverManager.getConnection(url,"root","root");
		out.println("����� ����Ǿ����ϴ�");
		
		Statement stmt = conn.createStatement();
		
		String sql= "Insert Into Board" + "(IDX, Title,writer,regdate, count,content)" + 
		"Values( board.seq.nextval ,'"+title+"','"+writer+"', sysdate , '1', '"+content+"')";
		
		stmt.executeUpdate(sql);
		
		conn.close();
	}catch(Exception e){
		out.println("���������� �Ӵ�");
		out.println(e.getMessage());
		e.printStackTrace();
	} //finally{
		//out.print("<script>location.haef='index.jsp';</script>");
	//}
	
	/* Connection con = null;
	
	
	  try{
		String driverName = "com.mysql.jdbc.Driver";
		String url ="jdbc:mysql://localhost:3306/test";
		
		Class.forName(driverName); //���Ӻκ�
		con = DriverManager.getConnection(url, "root", "root" );
		out.println("db ���� ����");
		//con.close();
	}catch(Exception e){
		out.println("���ӿ� ������ ����");
		out.println(e.getMessage());
		e.printStackTrace();
	}  
	  */
		
		
		/*  try {
	            Class.forName("com.mysql.jdbc.Driver");
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" , "root", "root");
	            st = connection.createStatement();
	 
	            String sql;
	            sql = "select * FROM table;";
	 
	            ResultSet rs = st.executeQuery(sql);
	 
		             
			            while (rs.next()) {
			                String sqlRecipeProcess = rs.getString("column��");
			            }
			 
	            rs.close();
	            st.close();
	            connection.close();
	        } catch (SQLException se1) {
	            se1.printStackTrace();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            try {
	                if (st != null)
	                    st.close();
	            } catch (SQLException se2) {
	            }
	            try {
	                if (connection != null)
	                    connection.close();
	            } catch (SQLException se) {
	                se.printStackTrace();
          	  }
        	}    
			
	  } */
	
%>
<body>

</body>
</html>