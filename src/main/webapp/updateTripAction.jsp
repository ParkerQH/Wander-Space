<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ include file="dbconn.jsp" %>

<%
    // 요청 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    // 파일 업로드 관련 설정(상대 경로)
    String realFolder = application.getRealPath("/resources/images/TravelReview");
    int maxSize = 50 * 1024 * 1024; // 최대 업로드 파일 크기 (50MB)
    String encType = "utf-8";

    // MultipartRequest 객체 생성
    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

    // 폼 데이터 수집
    String tripId = multi.getParameter("tripId");
    String title = multi.getParameter("title");
    String content = multi.getParameter("content");

    // 기존 여행 정보 업데이트
    String sql = "UPDATE trip SET t_title = ?, t_content = ? WHERE t_id = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, tripId);
    int row = pstmt.executeUpdate();

    // 메인 이미지 파일 처리
    String mainPicture = multi.getFilesystemName("mainpicture");
    if (mainPicture != null) {
        // 메인 이미지를 업데이트
        sql = "UPDATE trip SET t_mainpicture = ? WHERE t_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, mainPicture);
        pstmt.setString(2, tripId);
        pstmt.executeUpdate();
    }

    // 추가 이미지 파일들 가져오기
    Enumeration<String> files = multi.getFileNames();
    ArrayList<String> pictureList = new ArrayList<>();
    while (files.hasMoreElements()) {
        String fileNameKey = files.nextElement();
        String fileName = multi.getFilesystemName(fileNameKey);
        if (fileName != null && !fileNameKey.equals("mainpicture")) {
            pictureList.add(fileName); // 파일명 추가
        }
    }

    // 추가 이미지가 있을 경우 `trip_pictures` 테이블에 삽입
    if (!pictureList.isEmpty()) {
        sql = "INSERT INTO trip_pictures (tp_trip_id, tp_picture) VALUES (?, ?)";
        pstmt = conn.prepareStatement(sql);
        for (String picture : pictureList) {
            pstmt.setString(1, tripId);
            pstmt.setString(2, picture);
            pstmt.executeUpdate();
        }
    }

    // 삭제된 사진 처리
    String deletePicture = multi.getParameter("deletePicture");
    if (deletePicture != null) {
        // 사진 삭제
        sql = "DELETE FROM trip_pictures WHERE tp_picture = ? AND tp_trip_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, deletePicture);
        pstmt.setString(2, tripId);
        pstmt.executeUpdate();

        // 실제 파일 삭제
        String imagePath = getServletContext().getRealPath("/") + "resources/images/TravelReview/" + deletePicture;
        File file = new File(imagePath);
        if (file.exists()) {
            file.delete();
        }
    }

    // 여행 정보 업데이트 후, 상세 페이지로 리다이렉션
    response.sendRedirect("viewTrip.jsp?id=" + tripId);
%>
