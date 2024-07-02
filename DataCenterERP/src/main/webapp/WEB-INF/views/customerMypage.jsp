<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객사용 마이페이지</title>
</head>
<body>
    <div class="container">
        <h1>고객사 페이지</h1>
        <c:choose>
            <c:when test="${not empty customer}">
                <p>아이디: <c:out value="${customer.username}"/></p>
                <p>이름: <c:out value="${customer.name}"/></p>
                <p>회사 번호: <c:out value="${customer.companyNumber}"/></p>
                <p>권한: <c:out value="${customer.role}"/></p>
            </c:when>
            <c:otherwise>
                <p>고객사 정보를 가져올 수 없습니다.</p>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
