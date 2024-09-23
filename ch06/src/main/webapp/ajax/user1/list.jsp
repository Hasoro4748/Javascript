<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax::user1</title>
</head>
<script>
	window.onload = function(){
		
		const table = document.getElementsByTagName('table')[0];
		// 사용자 데이터 요청 
		fetch("./proc/getUsers.jsp")
			.then(response=>response.json())
			.then(data => {
				console.log(data);
				
				for(const user of data){
					const row = `<tr>
												<td>\${user.uid}</td>
												<td>\${user.name}</td>
												<td>\${user.birth}</td>
												<td>\${user.hp}</td>
												<td>\${user.age}</td>
												<td>
													<a href='#' class='modify'>수정</a>
													<a href='#' class='delete'>삭제</a>
												</td>
										  </tr>`;
										  
					/*
						let row = "<tr>";
						  row += "<td>" + user.uid + "</td>"; 
						  row += "<td>" + user.name + "</td>"; 
						  row += "<td>" + user.birth + "</td>"; 
						  row += "<td>" + user.hp + "</td>"; 
						  row += "<td>" + user.age + "</td>"; 
						  row += "<td>"; 
						  row += "<a href='#'>수정 </a>"; 
						  row += "<a href='#'>삭제</a>"; 
						  row +="</td>"; 
						  row +="</tr>"; 
					*/
					
					table.insertAdjacentHTML('beforeend', row);
				}
			})
			.catch(err => {
				console.log(err);
			});
		
		
		document.body.addEventListener('click', function(e){
			e.preventDefault();
			//삭제 클릭 이벤트
			if(e.target.classList.contains('delete')){
				//alert('삭제');
				const tr = e.target.closest('tr');
				//tr.remove();
				
				const uid = tr.children[0].innerText;
				
				//삭제요청
				fetch('./proc/deleteProc.jsp?uid=' + uid)
						.then(response => response.json())
						.then(data => {
							console.log(data);
							if(data.result > 0){
								alert('삭제했습니다.');
								tr.remove();
							}
						})
						.catch(err => {
							console.log(err);
						});
			}
			
			//수정 클릭 이벤트
			if(e.target.classList.contains('modify')){
				const tr = e.target.closest('tr');
				const uid = tr.children[0].innerText;
				
				location.href = './modify.jsp?uid='+uid;
			}
		});
		
	}
</script>
<body>
	<h3>user1</h3>
	
	<a href="./register.jsp">등록하기</a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
	</table>
</body>
</html>
