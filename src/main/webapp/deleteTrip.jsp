<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="dbconn.jsp" %>

<%
    String tripId = request.getParameter("tripId"); // 클라이언트에서 전달된 tripId 값
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    if (tripId != null && !tripId.isEmpty()) {
        PreparedStatement pstmt = null;
        System.out.println(tripId);
        try {
        	// trip 테이블에서 해당 여행 ID의 mainpicture 조회
            String sql = "SELECT t_mainpicture FROM trip WHERE t_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tripId);
            ResultSet rs = pstmt.executeQuery();

            String mainPicture = null;
            if (rs.next()) {
                mainPicture = rs.getString("t_mainpicture");
            }

            // mainPicture가 존재하면 해당 파일 삭제
            if (mainPicture != null) {
                String imagePath = getServletContext().getRealPath("/") + "resources/images/TravelReview/" + mainPicture;
                File file = new File(imagePath);
                if (file.exists()) {
                    file.delete(); // mainPicture 파일 삭제
                }
            }

            // trip_pictures 테이블에서 해당 tripId의 사진 목록을 조회
            sql = "SELECT tp_picture FROM trip_pictures WHERE tp_trip_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tripId);
            rs = pstmt.executeQuery();

            // 각 사진 파일 삭제
            while (rs.next()) {
                String picture = rs.getString("tp_picture");
                String imagePath = getServletContext().getRealPath("/") + "resources/images/TravelReview/" + picture;
                File file = new File(imagePath);
                if (file.exists()) {
                    file.delete(); // 파일 삭제
                }
            }

            // trip_pictures 테이블에서 해당 tripId의 사진 삭제
            sql = "DELETE FROM trip_pictures WHERE tp_trip_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tripId);
            pstmt.executeUpdate();

            // trip 테이블에서 해당 여행 ID 삭제
            sql = "DELETE FROM trip WHERE t_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tripId);
            pstmt.executeUpdate();
            
            // 삭제 후 페이지 리다이렉트
            if (loggedInUser.equals("admin")) {
                response.sendRedirect("adminpage.jsp");
            } else {
                response.sendRedirect("mypage.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp"); // 오류 발생 시 errorPage.jsp로 이동
        } finally {
            if (pstmt != null) pstmt.close();
        }
    } else {
        response.sendRedirect("errorPage.jsp"); // 잘못된 요청 시 errorPage.jsp로 이동
    }
%>
