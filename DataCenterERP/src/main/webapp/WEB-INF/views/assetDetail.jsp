<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
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
                <span class="input-group-text justify-content-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <input type="number" name="id" class="form-control" value="${asset.id}" readonly />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자산이름&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <input name="name" class="form-control" value="${asset.name}"  readonly/>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">&nbsp;&nbsp;&nbsp;&nbsp;자산유형&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <input name="type" class="form-control" value="${asset.type}" readonly />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">&nbsp;&nbsp;&nbsp;&nbsp;자산상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <input name="status" class="form-control" value="${asset.status}" readonly />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">&nbsp;&nbsp;&nbsp;&nbsp;구입 날짜&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <input type="date" name="purchaseDateStr" class="form-control" 
            value='<fmt:formatDate value="${asset.purchase_Date}" pattern="yyyy-MM-dd" />' readonly />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">유지보수 일정&nbsp;</span>
            </div>
            <input type="date" name="maintenanceScheduleStr" class="form-control" 
            value='<fmt:formatDate value="${asset.maintenance_Schedule}" pattern="yyyy-MM-dd" />' readonly />
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위치&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <input name="location" class="form-control" value="${asset.location}" readonly/>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IP 주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <input name="ipAddress" class="form-control" value="${asset.ip_address}" readonly/>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text justify-content-center">&nbsp;&nbsp;&nbsp;MAC 주소&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <input name="macAddress" class="form-control" value="${asset.mac_address}" readonly/>
        </div>
        <c:if test="${sessionScope.loginType != 'customer'}">
            <div style="text-align:right;">
                <input type="button" class="btn btn-info" value="수정" data-toggle="modal" data-target="#editModal"/>
            </div>
        </c:if>
    </form>
    <c:if test="${sessionScope.loginType != 'customer'}">
        <div style="text-align:right;">
            <form id="deleteForm" method="post"
                action="${path}/assets/${asset.id}/delete.do">
                <input type="hidden" name="id" value="${asset.id}" />
                <input type="button" class="btn btn-warning" value="삭제" id="delBtn" />
            </form>
        </div>
    </c:if>
    <!-- Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">자산상세</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editForm" method="post" action="${path}/assets/update.do">
                        <input type="hidden" name="id" value="${asset.id}" />
                        <div class="form-group">
                            <label for="name">자산명</label>
                            <input type="text" class="form-control" id="name" name="name" value="${asset.name}">
                        </div>
                        <div class="form-group">
                            <label for="type">자산유형</label>
                            <input type="text" class="form-control" id="type" name="type" value="${asset.type}">
                        </div>
                        <div class="form-group">
                            <label for="status">자산상태</label>
                            <input type="text" class="form-control" id="status" name="status" value="${asset.status}">
                        </div>
                        <div class="form-group">
                            <label for="purchaseDateStr">구입 날짜</label>
                            <input type="date" class="form-control" id="purchase_DateStr" name="purchase_DateStr" 
                            value='<fmt:formatDate value="${asset.purchase_Date}" pattern="yyyy-MM-dd" />'>
                        </div>
                        <div class="form-group">
                            <label for="maintenanceScheduleStr">유지보수 일정</label>
                            <input type="date" class="form-control" id="maintenanceScheduleStr" name="maintenance_ScheduleStr" 
                            value='<fmt:formatDate value="${asset.maintenance_Schedule}" pattern="yyyy-MM-dd" />'>
                        </div>
                        <div class="form-group">
                            <label for="location">위치</label>
                            <input type="text" class="form-control" id="location" name="location" value="${asset.location}">
                        </div>
                        <div class="form-group">
                            <label for="ipAddress">IP 주소</label>
                            <input type="text" class="form-control" id="ipAddress" name="ip_address" value="${asset.ip_address}">
                        </div>
                        <div class="form-group">
                            <label for="macAddress">MAC 주소</label>
                            <input type="text" class="form-control" id="macAddress" name="mac_address" value="${asset.mac_address}">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("#saveBtn").click(function(){
            $("#editForm").submit();
        });

        $("#delBtn").click(function(){
            if(confirm("삭제하시겠습니까?")){
                $("#deleteForm").submit();
            }
        });
    </script>
</div>
</body>
</html>
