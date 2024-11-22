<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="dbconn.jsp" %>

<%
    String tripId = request.getParameter("tripId"); // 클라이언트에서 전달된 tripId 값
    if (tripId != null && !tripId.isEmpty()) {
        PreparedStatement pstmt = null;
        System.out.println(tripId);
        try {
            // trip 테이블에서 해당 여행 ID 삭제
            String sql = "DELETE FROM trip WHERE t_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tripId);
            pstmt.executeUpdate();
            
            sql = "DELETE FROM trip_pictures WHERE tp_trip_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tripId);
            pstmt.executeUpdate();
            
            response.sendRedirect("mypage.jsp");
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
