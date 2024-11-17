<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
    String email = multi.getParameter("email");
    String country = multi.getParameter("country");
    String region = multi.getParameter("region");
    String title = multi.getParameter("title");
    String content = multi.getParameter("content");
    String mainPicture = multi.getFilesystemName("mainpicture"); // 메인 이미지 파일명 가져오기

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

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // `trip` 테이블에 새로운 여행 데이터 삽입
        String sql = "INSERT INTO trip (t_email, t_country, t_region, t_title, t_content, t_mainpicture) VALUES (?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstmt.setString(1, email);
        pstmt.setString(2, country);
        pstmt.setString(3, region);
        pstmt.setString(4, title);
        pstmt.setString(5, content);
        pstmt.setString(6, mainPicture);
        int row = pstmt.executeUpdate();

        if (row > 0) {
            rs = pstmt.getGeneratedKeys();
            int tripId = 0;
            if (rs.next()) {
                tripId = rs.getInt(1); // 생성된 `t_id` 가져오기
            }

            // `trip_pictures` 테이블에 추가 이미지 삽입
            if (!pictureList.isEmpty()) {
                sql = "INSERT INTO trip_pictures (tp_trip_id, tp_picture) VALUES (?, ?)";
                pstmt = conn.prepareStatement(sql);
                for (String picture : pictureList) {
                    pstmt.setInt(1, tripId);
                    pstmt.setString(2, picture);
                    pstmt.executeUpdate();
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
    }
    // 실제 저장 경로 출력
    System.out.println("File upload path: " + realFolder);
    // 마이페이지로 리디렉션
    response.sendRedirect("mypage.jsp");
%>
