<%@page import="com.fnc.qna.QnaDAO"%>
<%@page import="com.choa.member.MemberDTO"%>
<%@page import="com.fnc.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	QnaDTO qnaDTO = new QnaDTO();
	qnaDTO.setWriter(((MemberDTO)session.getAttribute("member")).getId());
	qnaDTO.setTitle(request.getParameter("title"));
	qnaDTO.setContents(request.getParameter("contents"));
	QnaDAO qnaDAO = new QnaDAO();
	int result = qnaDAO.insert(qnaDTO);
	String s ="Fail";
	if(result>0){
		s = "Success";
	}
	
	request.setAttribute("message", s);
	request.setAttribute("path", "qnaList.jsp");
	//1 Foward
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);
	//2. redirect
	//response.sendRedirect("../common/result.jsp");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>