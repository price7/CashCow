<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.StudentDAOsgh"%>
<%@page import="VO.ClassNoteVO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String teacherName = request.getParameter("teacherName");
ClassNoteVO vo = null;
if (teacherName != null) {
    JSONArray teacherArray = new JSONArray();
    StudentDAOsgh dao = new StudentDAOsgh();
    
    ArrayList<ClassNoteVO> list = dao.teacherCheckSelectAllByName(teacherName);
    
	
    for (ClassNoteVO classNote : list) {
        JSONObject teacher = new JSONObject();
        teacher.put("teacherNo", classNote.getTeacherNo());
        teacher.put("teacherName", classNote.getTeacherName());
        teacher.put("teacherSubject", classNote.getTeacherSubject());
        teacher.put("teacherPhone", classNote.getTeacherPhone());
        teacher.put("teacherCheckIn", classNote.getTeacherCheckIn());
        teacher.put("teacherCheckOut", classNote.getTeacherCheckOut());
        teacher.put("teacherCheckWorkTime", classNote.getTeacherWorkTime());
        teacher.put("teacherCheckDate", classNote.getTeacherCheckDate());
        teacherArray.add(teacher);
        
        teacherArray.add(teacher);
    }
    out.println(teacherArray.toJSONString());
    System.out.println(teacherArray.toJSONString());
}
%>