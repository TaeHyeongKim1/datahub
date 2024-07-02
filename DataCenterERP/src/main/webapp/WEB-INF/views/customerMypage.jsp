<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer My Page</title>
    <link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>고객사 페이지</h1>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <p>아이디: <c:out value="${sessionScope.user.username}"/></p>
                <p>이름: <c:out value="${sessionScope.user.name}"/></p>
                <p>회사 번호: <c:out value="${sessionScope.user.companyNumber}"/></p>
                <p>권한: <c:out value="${sessionScope.user.role}"/></p>
            </c:when>
            <c:otherwise>
                <p>사용자 정보를 불러오는데 실패했습니다.</p>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
