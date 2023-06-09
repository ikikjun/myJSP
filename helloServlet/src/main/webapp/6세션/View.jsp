<%@page import="common.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	BoardDao dao = new BoardDao();
	dao.updateVisitCount(request.getParameter("num"));
	// request.getParameter("num") : 조회하려는 게시글 번호
	// 게시글 1건을 조회 후 board객체에 담아서 반환
	Board board = dao.selectOne(request.getParameter("num"));
	
	if(board == null){
		
		JSFunction.alertBack("게시글이 존재하지 않습니다.(공통호출)", out);
		/*
		out.print("<script>");
		out.print("alert('게시글이 존재하지 않습니다.');");
		out.print("history.go(-1);");
		out.print("</script>");
		*/
		
		// 더이상 실행할 필요가 없으므로 리턴
		return;
	}
	/* 화면에 찍을것이 아니기때문에 필요없는 코드 Test용 입니다.
	if(board != null){
		out.print(board.getId() + "<br>");
		out.print(board.getTitle() + "<br>");
		out.print(board.getContent() + "<br>");
	} else {
		// out.print("<script>alert('게시글이 존재하지 않습니다.');history.go(-1);</script>")
		out.print("<script>");
		out.print("alert('게시글이 존재하지 않습니다.');");
		out.print("history.go(-1)");
		out.print("</script>");
		return;
	}
	*/
%>
<script>
	function deletePost(){
		var res = confirm("삭제 하시겠습니까?");
		if(res){
			location.href = "DeleteProcess.jsp?num=<%=board.getNum()%>";
		}
	}
</script>


</head>
<body>

<%@include file="Link.jsp" %>
<h2>상세 보기</h2>

	<table border="1" width="90%">
        <tr>
            <td>번호</td>
            <td><%=board.getNum()%></td>
            <td>작성자</td>
            <td><%=board.getId()%></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%=board.getPostdate()%></td>
            <td>조회수</td>
            <td><%=board.getViscount()%></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%=board.getTitle()%></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100"><%=board.getContent().replace("\r\n", "<br/>") %></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <button type="button" onclick="location.href='Board.jsp';">
                    목록 보기
                </button>
                <%
                // 로그인한 아이디와 글쓴이가 같으면 수정, 삭제 버튼 활성화
                if(session.getAttribute("UserId") != null
                	&& board.getId().equals(session.getAttribute("UserId"))){
                %>
                <button type="button" onclick="location.href='Edit.jsp?num=<%=board.getNum()%>'">수정하기</button>
                <button type="button" onclick="deletePost()">삭제하기</button>
                <%
                }
                %>
            </td>
        </tr>
    </table>
</body>
</html>