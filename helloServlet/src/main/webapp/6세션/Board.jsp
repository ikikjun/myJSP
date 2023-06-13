<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	BoardDao dao = new BoardDao();
	List<Board> boardList = dao.getList();
	
	int totalCnt = dao.getTotalCnt();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if (searchField == null) {
	        searchField = ""; // 또는 원하는 초기값으로 설정
    }

    if (searchWord == null) {
	        searchWord = "";
    }
    
	// 검색어가 null이 아니면 검색 기능을 추가!!
	out.print(searchWord);
	out.print(searchField);
	

%>

<jsp:include page="Link.jsp"></jsp:include>

<h2>목록보기(List)</h2>

<!-- border 리스트가 비어 있을 수도 있으니 -->
총건수 : <%=totalCnt %>

<!-- 검색폼 -->
<form>
<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="title" <%= "title".equals(searchField) ? "selected" : "")) %>>제목</option>
				<option value="content" <% if(searchField.equals("content")) { %>selected<% } %>>내용</option>
				<option value="title content" <% if(searchField.equals("title content")) { %>selected<% } %>>제목+내용</option>
			</select>
			<input type="text" name="searchWord" value="<%=searchWord%>">
			<input type="submit" value="검색하기">
		</td>
	</tr>
</table>
</form>
<!-- 검색폼 끝 -->

<table border="1" width="90%">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
<%
	if(boardList.isEmpty()){
		// 게시글이 하나도 없을때
%>

	<tr>
		<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
	</tr>
	
<%
} else {
	for(Board board : boardList){
%>
	<tr>
		<td><%=board.getNum() %></td>
		<td><%=board.getTitle() %></td>
		<td><%=board.getId() %></td>
		<td><%=board.getViscount() %></td>
		<td><%=board.getPostdate() %></td>
	</tr>

<%
	}
}
%>
</table>
<table border="1" width='90%'>
	<tr>
		<td align="right">
			<input type="submit" value="글쓰기">
		</td>
	</tr>
</table>


</body>
</html>