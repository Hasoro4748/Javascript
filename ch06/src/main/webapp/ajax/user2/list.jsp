<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax::user2</title>
</head>
<script>
	window.onload = function(){
		const table = document.getElementsByTagName('table')[0];
		// 사용자 데이터 요청
		fetch("./proc/getUsers.jsp")
			.then(response => response.json())
			.then(data => {
				for(const user of data){
					const row = `<tr>
													<td>\${user.uid}</td>
													<td>\${user.name}</td>
													<td>\${user.birth}</td>
													<td>\${user.addr}</td>
													<td>
														<a href='#' class='modify'>수정</a>
														<a href='#' class='delete'>삭제</a>
													</td>
												</tr>`;
					table.insertAdjacentHTML('beforeend',row);
				}
			})
			.catch(err => {
				console.log(err);
			})
		
		
		document.body.addEventListener('click', function(e){
			e.preventDefault();
			//delete
			if(e.target.classList.contains('delete')){
				const tr = e.
			}
		}
	}
	
	
</script>
<body>
	<h3>user2</h3>
	
	<a href="./register.jsp">등록하기</a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
	</table>
</body>
</html>