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
        <h2>Asset Form</h2>
        <form action="${pageContext.request.contextPath}/assets/${empty asset.id ? 'create' : 'update'}.do" method="post">
            <c:if test="${not empty asset.id}">
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" class="form-control" id="id" name="id" value="${asset.id}" readonly>
                </div>
            </c:if>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="${asset.name}">
            </div>
            <div class="form-group">
                <label for="type">Type:</label>
                <input type="text" class="form-control" id="type" name="type" value="${asset.type}">
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <input type="text" class="form-control" id="status" name="status" value="${asset.status}">
            </div>
            <div class="form-group">
                <label for="purchase_Date">Purchase Date:</label>
                <input type="date" class="form-control" id="purchase_Date" name="purchase_Date" value="${asset.purchase_Date}">
            </div>
            <div class="form-group">
                <label for="maintenance_Schedule">Maintenance Schedule:</label>
                <input type="date" class="form-control" id="maintenance_Schedule" name="maintenance_Schedule" value="${asset.maintenance_Schedule}">
            </div>
            <div class="form-group">
                <label for="location">Location:</label>
                <input type="text" class="form-control" id="location" name="location" value="${asset.location}">
            </div>
            <div class="form-group">
                <label for="ip_address">IP Address:</label>
                <input type="text" class="form-control" id="ip_address" name="ip_address" value="${asset.ip_address}">
            </div>
            <div class="form-group">
                <label for="mac_address">MAC Address:</label>
                <input type="text" class="form-control" id="mac_address" name="mac_address" value="${asset.mac_address}">
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
</body>
</html>