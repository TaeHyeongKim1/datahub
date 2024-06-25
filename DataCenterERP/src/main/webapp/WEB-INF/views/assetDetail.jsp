<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="datacentererp.vo.*"
    import="datacentererp.a04_database.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<title>Asset Detail</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<style>
    td { text-align: center; }
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>Asset Detail</h2>
</div>
<div class="container">
    <form method="post" action="${path}/assets/update.do">
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">번호</span>
            </div>
            <input type="number" name="id" class="form-control" value="${asset.id}" readonly />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">자산명</span>
            </div>
            <input name="name" class="form-control" value="${asset.name}" />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">자산유형</span>
            </div>
            <input name="type" class="form-control" value="${asset.type}" />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">자산상태</span>
            </div>
            <input name="status" class="form-control" value="${asset.status}" />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">구입 날짜</span>
            </div>
            <input type="date" name="purchaseDate" class="form-control" value="${asset.purchase_Date}" />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">유지보수 일정</span>
            </div>
            <input type="date" name="maintenanceSchedule" class="form-control" value="${asset.maintenance_Schedule}" />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">위치</span>
            </div>
            <input name="location" class="form-control" value="${asset.location}" />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">IP 주소</span>
            </div>
            <input name="ipAddress" class="form-control" value="${asset.ip_address}" />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">MAC 주소</span>
            </div>
            <input name="macAddress" class="form-control" value="${asset.mac_address}" />
        </div>
        <div style="text-align:right;">
            <input type="button" class="btn btn-info" value="수정" id="uptBtn"/>
            <input type="button" class="btn btn-warning" value="삭제" id="delBtn"/>
            <input type="button" class="btn btn-primary" value="메인 화면으로" id="mainBtn"/>
        </div>
    </form>
    <script type="text/javascript">
        $("#uptBtn").click(function(){
            if(confirm("수정하시겠습니까?")){
                $("form").attr("action","${path}/assets/update.do");
                $("form").submit();
            }
        });
        $("#delBtn").click(function(){
            if(confirm("삭제하시겠습니까?")){
                location.href="${path}/assets/${asset.id}/delete.do";
            }
        });
        $("#mainBtn").click(function(){
            location.href="${path}/assets";
        });
    </script>
</div>
</body>
</html>