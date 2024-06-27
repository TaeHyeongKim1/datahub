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
<title>DataHub ERP Dashboard</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
    .card {
        margin: 20px 0;
    }
    td {
        text-align: center;
    }
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
</head>
<body>
<div class="container mt-3">
    <h2>자산 현황</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">자산 요약</h5>
                    <p class="card-text">총 자산 수: <span id="totalAssets">${totalAssets}</span></p>
                    <p class="card-text">문제 상태 자산: <span id="problemAssets">${problemAssets}</span></p>
                    <p class="card-text">유지보수 예정 자산: <span id="maintenanceAssets">${maintenanceAssets}</span></p>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <canvas id="assetChart"></canvas>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-12">
            <h3>최근 활동 로그</h3>
            <ul class="list-group">
                <c:forEach var="log" items="${recentLogs}">
                    <li class="list-group-item">${log}</li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-12">
            <h3>자산 유형별 현황</h3>
            <div class="row">
                <c:forEach var="asset" items="${assetCountByType}">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">${asset.type}</h5>
                                <p class="card-text">Number of Assets: ${asset.count}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-12">
            <h3>빠른 액세스</h3>
            <a href="${path}/new.do" class="btn btn-primary">자산 추가</a>
            <a href="${path}/assets.do" class="btn btn-secondary">자산 목록</a>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        var ctx = document.getElementById('assetChart').getContext('2d');
        var assetChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['운영', '유휴', '폐기'], // 데이터 유형
                datasets: [{
                    label: '자산 유형별 수량',
                    data: [56, 18, 3], // 실제 데이터로 변경 필요
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(75, 192, 192, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(75, 192, 192, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    });
</script>
</body>
</html>
