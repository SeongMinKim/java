<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
  pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>  


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>본격! 게시판 - 게시글 리스트</title>        <!-- 윈도우 상단에 뜨는 내용입니다. -->

<style type="text/css">
	table, td, th {
	border:1px solid yellow;
	}
	
	th{
	background-color:yellow;
	color:white;
	}
</style>
 
</head>
 
<%
 
    try {
 
        String driverName = "com.mysql.jdbc.Driver"; 
 
        String url = "jdbc:mysql://localhost:3306/board";
 
        ResultSet rs = null;
 
      
 
        Class.forName(driverName);
 
        Connection con = DriverManager.getConnection(url,"root","root");
 
        out.println("Oracle Database Connection Success.");
 
      
 
        Statement stmt = con.createStatement();        
 
        String sql = "select * from board order by idx desc";
 
        rs = stmt.executeQuery(sql);
 
%>
 
 
 
 
 
<body>                                            <!-- HTML문서의 주 내용이 들어가는 부분입니다. -->
 
    <h1>게시글 리스트</h1>                        <!-- 헤드라인 글씨를 표현하는 태그입니다. -->
 
    <table>                                       <!-- 표 형식의 데이터를 표현하는 태그입니다. -->
 
        <tr>                                  <!-- table태그 내에서 행을 정의할때 쓰는 태그입니다. -->
 
            <th>번호</th>                     <!-- Table Header의 약자로 table태그 내에서 -->
 
            <th>제목</th>                     <!-- 강조하고싶은 컬럼을 나타낼때 쓰는 태그입니다. -->
 
            <th>작성자</th>
 
            <th>날짜</th>
 
            <th>조회수</th>
 
        </tr>
 
<%   
 
        while(rs.next()){
 
            out.print("<tr>");
 
            out.print("<td>" + rs.getString(1) + "</td>");
 
            out.print("<td>" + rs.getString(2) + "</td>");
 
            out.print("<td>" + rs.getString(3) + "</td>");
 
            out.print("<td>" + rs.getString(4) + "</td>");
 
            out.print("<td>" + rs.getString(5) + "</td>");
 
            out.print("</tr>");
 
        }
 
%>
 
    </table>
 
    <a href="write.jsp">글쓰기</a>
 
<%      
 
        con.close();
 
    }catch (Exception e) {
 
        out.println("Oracle Database Connection Something Problem. <hr>");
 
        out.println(e.getMessage());
 
        e.printStackTrace();
 
    }
 
%>
 
</body>
 
</html>