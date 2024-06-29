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
        <h2>새 자산 추가</h2>
        <form action="${path}/create.do" method="post">
            <div class="form-group">
                <label for="name">자산명:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="type">자산유형:</label>
                <input type="text" class="form-control" id="type" name="type" required>
            </div>
            <div class="form-group">
                <label for="status">자산 상태:</label>
                <input type="text" class="form-control" id="status" name="status" required>
            </div>
            <div class="form-group">
                <label for="purchaseDate">입고날짜:</label>
                <input type="date" class="form-control" id="purchase_Date" name="purchase_DateStr" required>
            </div>
            <div class="form-group">
                <label for="maintenanceSchedule">유지보수 일정:</label>
                <input type="date" class="form-control" id="maintenance_Schedule" name="maintenance_ScheduleStr" required>
            </div>
            <div class="form-group">
                <label for="location">위치:</label>
                <input type="text" class="form-control" id="location" name="location" required>
            </div>
            <div class="form-group">
                <label for="ipAddress">IP 주소:</label>
                <input type="text" class="form-control" id="ip_address" name="ip_address" required>
            </div>
            <div class="form-group">
                <label for="macAddress">MAC 주소:</label>
                <input type="text" class="form-control" id="mac_address" name="mac_address" required>
            </div>
            <button type="submit" class="btn btn-primary">추가</button>
        </form>
    </div>
</body>
</html>