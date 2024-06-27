<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
  
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
	});
</script>
</head>

<body>
    <div class="container">
        <h2>자산 목록</h2>
        <a href="${pageContext.request.contextPath}/new.do" class="btn btn-primary">새 자산 추가</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>자산명</th>
                    <th>자산유형</th>
                    <th>자산 상태</th>
                    <th>입고날짜</th>
                    <th>상세보기</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="asset" items="${assets}">
                    <tr>
                        <td>${asset.id}</td>
                        <td>${asset.name}</td>
                        <td>${asset.type}</td>
                        <td>${asset.status}</td>
                        <td><input type="date" class="form-control" id="purchase_DateStr" name="purchase_DateStr" 
                    value='<fmt:formatDate value="${asset.purchase_Date}" pattern="yyyy-MM-dd" />' readonly></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/assets/${asset.id}/edit.do" class="btn btn-info">상세보기</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
    </div>
</body>
</html>