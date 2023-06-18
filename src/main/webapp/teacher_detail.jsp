<%@page import="DAO.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="VO.ClassNoteVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacher_detail.jsp</title>

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

#modify_or_cancle {
	text-align: right;
	margin-right: 90px;
	margin-top: 20px;
}

#modify_btn, #cancle_btn {
	width: 80px;
	height: 40px;
	margin-bottom: 30px;
}
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#cancle_btn").on("click", function() {
			window.location.href = "admin.jsp";
		})
	})
</script>
</head>
<body>
	<div id="container">
		<div id="title">
			<h1>강사정보</h1>

			<%
			

				String teacherNo = request.getParameter("teacher_no");

				if (teacherNo != null) {
					int teacherNoInt = Integer.parseInt(teacherNo);
					StudentDAO dao = new StudentDAO();
					ClassNoteVO vo = dao.teacherSelectAllByNo(teacherNoInt);
			%>

			<div id="img">
				<img src="<%=vo.getTeacherPhoto()%>" alt="" name="photo" id="photo" />
			</div>


			<div id="table">
				<table>
					<tr>
						<th>교사번호</th>
						<td colspan="2"><%= vo.getTeacherNo() %></td>
						<th>이름</th>
						<td colspan="2"><%= vo.getTeacherName()%></td>
					</tr>
					<tr>
						<th>아이디(ID)</th>
						<td><%=vo.getTeacherId()%></td>
						<th>패스워드(PW)</th>
						<td><%=vo.getTeacherPw()%></td>
						<th>연락처</th>
						<td><%=vo.getTeacherPhone()%></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><%= vo.isTeacherGender() %></td>
						<th>이메일</th>
						<td><%=vo.getTeacherEmail()%></td>
						<th>생년월일</th>
						<td><%= vo.getTeacherBirth() %></td>
					</tr>
					<tr>
						<th>입사일</th>
						<td><%= vo.getTeacherHiredate()%></td>
						<th>근무형태</th>
						<td><%= vo.getTeacherWorktype() %></td>
						<th>급여</th>
						<td><%= vo.getTeacherSal() %></td>
					</tr>
					<tr>
						<th>담당과목</th>
						<td><%= vo.getTeacherSubject() %></td>
						<th>주소지</th>
						<td colspan="3"><%= vo.getTeacherAddress() %></td>
					</tr>
				</table>

				<div id="modify_or_cancle">
					<a href="teacher_modify_form.jsp?teacher_no=<%= vo.getTeacherNo() %>"><input type="button" id="modify_btn" value="수정" /></a>
					<input type="button" id="cancle_btn" value="뒤로가기" />
				</div>
			</div>
			
			<%
			}
			%>
		</div>
	</div>
</body>
</html>