<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>물품 목록</h3>
	<a href = "/ch11">처음으로</a>
	<a href = "/ch11/product/register.do">등록하기</a>
	<table border="1">
		<tr>
			<th>상품번호</th>
			<th>상품이름</th>
			<th>상품재고</th>
			<th>상품가격</th>
			<th>상품회사</th>
			<th>관리</th>
		</tr>
		<c:forEach var="products" items="${products}">
			<tr>
				<td>${products.prodNo}</td>
				<td>${products.prodName}</td>
				<td>${products.stock}</td>
				<td>${products.price}</td>
				<td>${products.company}</td>
				<td>
				<a href="/ch11/product/modify.do?prodNo=${products.prodNo}">수정</a> 
				<a href="/ch11/product/delete.do?prodNo=${products.prodNo}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>