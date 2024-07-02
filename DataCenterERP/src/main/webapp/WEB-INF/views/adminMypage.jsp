<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자용 마이페이지</title>
</head>
<body>
    <div class="container">
        <h1>관리자 페이지</h1>
        <c:choose>
            <c:when test="${not empty admin}">
                <p>아이디: <c:out value="${admin.username}"/></p>
                <p>이름: <c:out value="${admin.name}"/></p>
                <p>사원 번호: <c:out value="${admin.employeeNumber}"/></p>
                <p>직책: <c:out value="${admin.position}"/></p>
                <p>권한: <c:out value="${admin.role}"/></p>
            </c:when>
            <c:otherwise>
                <p>관리자 정보를 가져올 수 없습니다.</p>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
