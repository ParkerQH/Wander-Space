<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.wander.dto.Trip" %>
<%@ page import="com.wander.dao.TripRepository" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");

// 파일 업로드 관련 설정
String realFolder = "C:\\Users\\bluez\\eclipse-workspace\\WanderSpace\\src\\main\\webapp\\resources\\images"; // 파일 저장 경로 설정
int maxSize = 50 * 1024 * 1024; // 최대 업로드 파일 크기 (50MB)
String encType = "utf-8";

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

// 폼 데이터 수집
String email = multi.getParameter("email");
String country = multi.getParameter("country");
String region = multi.getParameter("region");
String title = multi.getParameter("title");
String content = multi.getParameter("content");
String mainPicture = multi.getFilesystemName("mainFileName"); // 메인 이미지 파일명 가져오기

// 추가 이미지 파일들 가져오기
Enumeration files = multi.getFileNames();
ArrayList<String> pictureList = new ArrayList<>();
while (files.hasMoreElements()) {
    String fileNameKey = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fileNameKey);
    if (fileName != null && !fileNameKey.equals("mainFileName")) {
        pictureList.add(fileName); // 파일명 추가
    }
}

// Trip 객체 생성 및 데이터 설정
Trip newTrip = new Trip();
newTrip.setEmail(email);
newTrip.setCountry(country);
newTrip.setRegion(region);
newTrip.setTitle(title);
newTrip.setContent(content);
newTrip.setMainPicture(mainPicture);

// 추가 이미지 파일 배열로 설정
newTrip.setPictures(pictureList.toArray(new String[0]));

// TripRepository에 새 Trip 추가
TripRepository tripRepo = TripRepository.getInstance();
tripRepo.addTrip(newTrip);

System.out.println("새로운 여행 기록이 추가되었습니다: " + newTrip);

response.sendRedirect("mypage.jsp"); // 마이페이지로 리디렉션
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trip 등록 완료</title>
</head>
<body>
</body>
</html>
