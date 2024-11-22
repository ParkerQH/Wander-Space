<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp"%>
<%
    String tripId = request.getParameter("tripId");
    String liked = request.getParameter("liked");
    String userEmail = request.getParameter("email");  // 로그인한 사용자의 이메일

    // tripId, liked, userEmail 값이 모두 null이 아닌지 확인
    if (tripId != null && liked != null && userEmail != null) {
        try {
            int tripIdInt = Integer.parseInt(tripId);  // tripId를 숫자로 변환
            boolean isLiked = Boolean.parseBoolean(liked);  // 좋아요 상태

            // 좋아요 상태 업데이트
            String insertSql = "INSERT INTO trip_likes (tl_trip_id, tl_email) VALUES (?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(insertSql)) {
                pstmt.setInt(1, tripIdInt);  // 여행 ID
                pstmt.setString(2, userEmail);  // 사용자 이메일
                pstmt.executeUpdate();
                System.out.println("좋아요가 추가되었습니다.");
            } catch (SQLException e) {
                System.out.println("오류가 발생했습니다.");
                e.printStackTrace();
            }
        } catch (NumberFormatException e) {
            System.out.println("잘못된 여행 ID입니다.");
            e.printStackTrace();
        }
    } else {
        System.out.println("필수 매개변수가 누락되었습니다.");
    }
%>
