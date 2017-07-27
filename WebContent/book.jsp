<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h4>Book Detail Page</h4>
	Book:<%= request.getParameter("book") %>
	<br><br>
	<a href="books.jsp">Return</a>
	
	<%
		//获取地址中book后面的数据
		String book = request.getParameter("book");
		//创建cookie数组，存放cookie数据
		Cookie[] cookies = request.getCookies();//这里是获取Cookie存入数组
		//System.out.println(cookies[6].getValue());
		
		//创建存放所有的cookie数据的集合（5个）
		List<Cookie> bookCookies = new ArrayList<Cookie>();
		//存放与传入的Cookie是不是同一个
		Cookie tempCookie = null;
		//如何cookies不为空
		if(cookies != null && cookies.length > 0){
			for(Cookie c : cookies){//遍历cookies数组
				String cookieName = c.getName();//获取cookie名字
				if(cookieName.startsWith("BIIBI_BOOK_")){
					bookCookies.add(c);//如果cookie名字开头为"BIIBI_BOOK_"，存入List集合
					//比较传入的cookie是否与已存在的cookie一样
					if(c.getValue().equals(book)){
						tempCookie = c;
					}
				}
			}
		}
	
		//大于5个，并且没有和已存在的cookie一样，则删除第个
		if(bookCookies.size() >= 5 && tempCookie == null){
			tempCookie = bookCookies.get(0);
		}
		
		//和已存在的cookie一样，则删除本身
		if(tempCookie != null){
			tempCookie.setMaxAge(0);//删除这条数据
			response.addCookie(tempCookie);//回传回去，以便能够通过getCookie()方法读取
		}
		
		//生成一个cookie
		Cookie cookie = new Cookie("BIIBI_BOOK_" + book,book);
		response.addCookie(cookie);//并添加
	%>

</body>
</html>