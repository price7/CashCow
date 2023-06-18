

<%@page import="DAO.StudentDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="VO.ClassNoteVO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//search.jsp

//1. 파라미터 값 가져오기
String studentName = request.getParameter("studentName").trim();
String grade = request.getParameter("studentGrade").trim();
String lectureClass = request.getParameter("lectureClass").trim();
String lectureName = request.getParameter("lectureName").trim();

String date1 = request.getParameter("date1").trim();
String date2 = request.getParameter("date2").trim(); 

//받아온 날짜가 2023-05-01 형식이라 23/05/01로 바꾸기 위한 과정
String startDate = null;
if (date1 != null && !date1.isEmpty()) {
    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat outputFormat = new SimpleDateFormat("yy/MM/dd");
    Date parsedDate = inputFormat.parse(date1);
    startDate = outputFormat.format(parsedDate);
}

String endDate = null;
if (date2 != null && !date2.isEmpty()) {
    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat outputFormat = new SimpleDateFormat("yy/MM/dd");
    Date parsedDate = inputFormat.parse(date2);
    endDate = outputFormat.format(parsedDate);
}

System.out.println(startDate);
System.out.println(endDate);  
//-------------------------------------------------------------------------------
//JSONArray 
JSONArray j = new JSONArray();

//dao 생성
StudentDAO dao = new StudentDAO();

//db로부터 모든 데이터 가져오기
//리스트 변수 선언
ArrayList<ClassNoteVO> list;

//-------------------------------------------------------------------------------

//이름만
if (studentName != null && !studentName.isEmpty()) {
	list = dao.studentSearchSelectAllByName(studentName);
	
}

//날짜만
 else if( startDate != null && endDate != null){
	list = dao.studentSelectAllByRegistDate( startDate, endDate );
} 

//학년만
else if (!"전체".equals(grade) && "전체".equals(lectureClass) && "전체".equals(lectureClass))  {
	int studentGrade = Integer.parseInt(grade);
	list = dao.studentSearchSelectAllByGrade(studentGrade);
		
}
//분반만
else if (!"전체".equals(lectureClass) && "전체".equals(grade) && "전체".equals(lectureName)) {
	list = dao.studentSearchSelectByLectureClass(lectureClass);
	System.out.println("분반: " + list);
}

//강의명만
else if (!"전체".equals(lectureName) && "전체".equals(grade) && "전체".equals(lectureClass)) {
	list = dao.studentSearchSelectByLectureName(lectureName);
} 

//학년+분반
else if (!"전체".equals(grade)&& !"전체".equals(lectureClass) && "전체".equals(lectureName)) {
	int studentGrade = Integer.parseInt(grade);
	list = dao.studentSearchSelectByGradeLectureClass(studentGrade, lectureClass);
} 

//학년+강의명
else if (!"전체".equals(grade)&& "전체".equals(lectureClass) && !"전체".equals(lectureName)) {
	int studentGrade = Integer.parseInt(grade);
	list = dao.studentSearchSelectByGradeLectureName(studentGrade, lectureName);
} 

//분반+강의명
else if ("전체".equals(grade)&& !"전체".equals(lectureClass) && !"전체".equals(lectureName)) {
	list = dao.studentSearchSelectByLectureClassLectureName(lectureClass, lectureName);
}

//학년 + 분반 + 강의명
else if (!"전체".equals(grade)&& !"전체".equals(lectureClass) && !"전체".equals(lectureName)) {
	int studentGrade = Integer.parseInt(grade);
	list = dao.studentSearchSelectByGradeLectureClassLectureName(studentGrade, lectureClass, lectureName);
} 



//아니라면 그냥 기본 빈 리스트를 생성
else {
	list = new ArrayList<>();
	System.out.println(list);
}

for (ClassNoteVO vo : list) {

	JSONObject student = new JSONObject();

	student.put("studentNo", vo.getStudentNo());
	student.put("studentName", vo.getStudentName());
	student.put("studentSchoolName", vo.getStudentSchoolName());
	student.put("studentGrade", vo.getStudentGrade());
	student.put("lectureClass", vo.getLectureClass());
	student.put("lectureName", vo.getLectureName());
	student.put("studentPhone", vo.getStudentPhone());
	student.put("studentRegistDate", vo.getStudentRegistDate());
	student.put("studentGender", vo.isStudentGender());
	student.put("studentParentsName", vo.getStudentParentsName());
	student.put("studentParentsPhone", vo.getStudentParentsPhone());
	student.put("studentCheckDate", vo.getStudentCheckDate());
	student.put("studentCheckStatus", vo.getStudentCheckStatus());
	student.put("studentCheckNo", vo.getStudentCheckNo());
	

	j.add(student);

}

out.println(j.toString());
%>


