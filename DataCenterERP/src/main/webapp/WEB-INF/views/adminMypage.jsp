<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
  
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f0f0;
    }

    .pageTitle {
        text-align: center;
        font-weight: bold;
        border: 1px solid #ddd;
        background-color: #ffffff;
        padding: 20px;
        margin-top: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .profileSection {
        border: 1px solid #ddd;
        border-radius: 20px;
        width: 80%;
        margin: 0 auto 50px auto;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .sectionTitle {
        margin-bottom: 20px;
        color: #3f51b5;
    }

    .profileItem {
        border: 1px solid #ddd;
        border-radius: 10px;
        margin: 10px;
        padding: 20px;
        width: calc(100% - 22px);
        box-sizing: border-box;
        font-size: 20px;
        font-weight: bold;
        background-color: #ffffff;
        transition: all 0.3s ease;
    }

    .profileItem:hover {
        color: #ffffff;
        background: linear-gradient(135deg, #3f51b5, #1e88e5);
        border-color: transparent;
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }

    .pageButton, .pageButton01, .pageButton02 {
        position: absolute;
        background-color: #3f51b5;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }

    .pageButton:hover, .pageButton01:hover, .pageButton02:hover {
        background-color: #1e88e5;
    }

    .pageButton {
        top: 40px;
        right: 20px;
    }

    .pageButton01 {
        top: 40px;
        right: 180px;
    }

    .pageButton02 {
        top: 40px;
        left: 20px;
        background-color: red;
    }

    .pageButton02:hover {
        background-color: #ff6666;
    }
</style>
</head>
<body>
<h1 class="pageTitle">관리자 마이페이지</h1>
<div class="profileSection">
    <h2 class="sectionTitle">기본 정보</h2>
    <div class="profileItem">아이디: <c:out value="${admin.username}"/></div>
    <div class="profileItem">이름: <c:out value="${admin.name}"/></div>
    <div class="profileItem">사원 번호: <c:out value="${admin.employeeNumber}"/></div>
    <div class="profileItem">직책: <c:out value="${admin.position}"/></div>
    <div class="profileItem">권한: <c:out value="${admin.role}"/></div>
</div>

<a href="dashboard.do" class="pageButton">메인홈으로 이동</a>
</body>
</html>
