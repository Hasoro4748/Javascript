<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3.Loop</title>
</head>
<style>
table, th, td {
	border: 1px solid #000;
}
</style>
<body>
	<h3>반복문</h3>
	<h4>for</h4>
	<%
	for (int i = 1; i <= 3; i++) {
		out.println("<p>i : " + i + "<p>");
	}
	%>
	<%
	for (int j = 1; j <= 3; j++) {
	%>
	<p>
		j :
		<%=j%></p>
	<%
	}
	%>
	<h4>while</h4>
	<%
	int k = 1;
	while (k <= 3) {
	%>
	<p>
		k :
		<%=k%>
	</p>
	<%
	k++;
	}
	%>
	<h4>구구단</h4>
	<table>
		<thead>
			<tr>
				<%for (int i =2 ; i<=9 ; i++){%>
				<th><%=i %>단 </th>
				<%} %>
			</tr>
		</thead>
		<tbody>
		<%for(int i = 1 ; i<=9; i++) {%>
			<tr>
			<%for(int j = 2 ; j <=9 ;j++){ %>
				<td><%=j %> x <%=i %> = <%= (i * j)%></td>
				<%} %>
			</tr>
		<%} %>
		</tbody>

	</table>



</body>
</html>