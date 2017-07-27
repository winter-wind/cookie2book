<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h4>Books Page</h4>
	<a href="book.jsp?book=javaweb">Java Web</a><br><br>
	<a href="book.jsp?book=java">Java</a><br><br>
	<a href="book.jsp?book=oracle">Oracle</a><br><br>
	<a href="book.jsp?book=ajax">Ajax</a><br><br>
	<a href="book.jsp?book=javaScript">JavaScript</a><br><br>
	<a href="book.jsp?book=android">Android</a><br><br>
	<a href="book.jsp?book=jbpm">Jbpm</a><br><br>
	<a href="book.jsp?book=struts">Struts</a><br><br>
	<a href="book.jsp?book=hibernate">Hibernate</a><br><br>
	<a href="book.jsp?book=spring">Spring</a><br><br>

	<%
	//创建cookie数组，存放cookie数据
	 Cookie[] cookies = request.getCookies();
	//如果cookie有数据，则输出
	if(cookies != null && cookies.length >= 0){
		for(Cookie c : cookies){
			String cookieName = c.getName();
			//要输出的cookie为“BIIBI_BOOK_”开头的cookie
			if(cookieName.startsWith("BIIBI_BOOK_")){
				out.println(c.getValue());
				out.println("  ");
			}
		}
	}
	%>

	<br><br>
</body>
</html>