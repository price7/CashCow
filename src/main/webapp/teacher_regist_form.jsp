<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regist_form.jsp</title>
<link rel="stylesheet" href="semi.css">

<style type="text/css">

table {
	width: 800px;
	font-size: 70%;
	border-collapse: collapse;
	text-align: left;
	margin-left: 1px;
}

th {
	/* width: 130px; */
	padding: 7px;
	font-weight: bold;
	color: white;
	/* vertical-align: top; */
	background: #D8D9DB;
}

td {
	width: 20px;
	padding: 7px;
	border-bottom: 1px solid white;
	background-color: #F3F6F7;
	color: #686868;

}

#img {
	width: 200px;
	height: 230px;
	border: 1px solid black;
	margin-left: 40%;
	margin-bottom: 60px;
}

#photo {
	width: 200px;
	height: 230px;
}

#title {
	margin-top: 130px;
	text-align: center;
}

#save_or_cancle {
	text-align: right;
	margin-right: 90px;
	margin-top: 20px;
}

#save_btn, #cancle_btn {
	width: 80px;
	height: 40px;
	margin-bottom: 30px;
}
}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">

	$(function() {
		$("#cancle_btn").on("click", function() {
			window.location.href = "admin.jsp";
		})
		
		
		// 파일을 넣었다! 의 의미==e
		// 파일을 넣었다면 아래 익명함수 수행하기
		$("input[name='photo_insert']").change(function (e) {
			// file의 엘리먼트 이름 가져오기
			var fileInput = document.getElementsByName("photo_insert");
			console.log(fileInput);
			
			var filename = null;
			
			// 업로드한 이미지는 배열 형식으로 저장되는 것으로 보임.
			for( var i=0; i<fileInput.length; i++ ){
				// 만약, 파일을 추가했다면
				if( fileInput[i].files.length > 0 ){
					for( var j=0; j<fileInput[i].files.length; j++ ){
						console.log(fileInput[i].files[j].name); // 파일명 출력
					
						
						filename = fileInput[i].files[j].name;
						
						// 이미지의 경로를 첨부한 파일의 경로로 적용한다.
						$("#photo").attr("src", "../team2portress/images/"+filename);
						// DB 저장을 위해서 파일의 경로를 text 박스에 넣었고, 그 value 값에 파일의 경로를 넣는다. 
						$("#photo_addrs").attr("value", "../team2portress/images/"+filename);
						
					}
				}
			}
		})
	})	

</script>
</head>
<body>
	<form action="teacher_regist_form_OK.jsp">
	<div id="container">
		<div id="title">
			<h1>강사정보</h1>		
		</div>
	
		<div id="img">
			<img src="" alt="" name="photo" id="photo"/>
			<input type="text" id="photo_addrs" name="photo_addrs" value="이미지 경로" />
<!-- 			<input type="button" value="사진 등록" id="picture_insert" /> -->
			<input type="file" name="photo_insert" id="photo_insert" />
		</div>
	
	
		<div id="table">
			<table>
				<tr>
					<th>교사번호</th>
					<td colspan="2"><input type="text" name="no" id="" /></td>
					<th>이름</th>
					<td colspan="2"><input type="text" name="name" id="" /></td>
				</tr>
				<tr>
					<th>아이디(ID)</th>
					<td><input type="text" name="id" id="" /></td>
					<th>패스워드(PW)</th>
					<td><input type="text" name="pw" id="" /></td>
					<th>휴대전화</th>
					<td><input type="text" name="phone" id="" /></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label><input type="radio" name="gender" id="gender" value="1" />남</label> 
						<label><input type="radio" name="gender" id="gender" value="2" />여</label> 					
					</td>
					<th>이메일</th>
					<td><input type="text" name="email" id="" /></td>
					<th>생년월일</th>
					<td><input type="date" name="birth" id="" /></td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><input type="date" name="hiredate" id="" /></td>
					<th>근무형태</th>
					<td><input type="text" name="worktype" id="" /></td>
					<th>급여</th>
					<td><input type="text" name="sal" id="" /></td>
				</tr>
				<tr>
					<th>담당과목</th>
					<td><input type="text" name="subject" id="" /></td>
					<th>주소지</th>
					<td colspan="3"><input type="text" name="address" id="" /></td>
				</tr>
			</table>
			
			<div id="save_or_cancle">
				<input type="submit" id="save_btn" value="저장" />
				<input type="button" id="cancle_btn" value="취소" />
			</div>
		</div>
	</div>
	</form>
</body>
</html>