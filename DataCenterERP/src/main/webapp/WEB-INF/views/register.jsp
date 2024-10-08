<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- Custom fonts for this template-->
<link href="${path}/a00_com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${path}/a00_com/css/sb-admin-2.min.css" rel="stylesheet"> 
<style>
    .hidden { display: none; }
</style>
</head>
<body class="bg-gradient-primary">
<div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block"><img src="img/Datahub.jpeg" style="width: 450px; height: 620px;"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4"><b>회원가입</b></h1>
                                </div>
                                <div class="text-center mb-4">
                                    <button class="btn btn-primary" onclick="showForm('customer')">고객사 회원가입</button>
                                    <button class="btn btn-secondary" onclick="showForm('admin')">관리자 회원가입</button>
                                </div>
                                <form id="customerRegisterForm" class="user hidden" method="post" action="${path}/registerCustomer.do">
                                    <div class="form-group">
                                        <input type="text" name="username" class="form-control form-control-user" placeholder="아이디">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" class="form-control form-control-user" placeholder="비밀번호">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="name" class="form-control form-control-user" placeholder="이름">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="companyNumber" class="form-control form-control-user" placeholder="회사번호">
                                    </div>
                                    <input type="submit" value="고객사 회원가입" class="btn btn-primary btn-user btn-block">
                                </form>
                                <form id="adminRegisterForm" class="user hidden" method="post" action="${path}/registerAdmin.do">
                                    <div class="form-group">
                                        <input type="text" name="username" class="form-control form-control-user" placeholder="아이디">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" class="form-control form-control-user" placeholder="비밀번호">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="name" class="form-control form-control-user" placeholder="이름">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="employeeNumber" class="form-control form-control-user" placeholder="사원번호">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="position" class="form-control form-control-user" placeholder="직책">
                                    </div>
                                    <input type="submit" value="관리자 회원가입" class="btn btn-secondary btn-user btn-block">
                                </form>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="${path}/a00_com/vendor/jquery/jquery.min.js"></script>
<script src="${path}/a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${path}/a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${path}/a00_com/js/sb-admin-2.min.js"></script>
<script>
    function showForm(type) {
        document.getElementById('customerRegisterForm').classList.add('hidden');
        document.getElementById('adminRegisterForm').classList.add('hidden');
        if (type === 'customer') {
            document.getElementById('customerRegisterForm').classList.remove('hidden');
        } else if (type === 'admin') {
            document.getElementById('adminRegisterForm').classList.remove('hidden');
        }
    }
</script>
</body>
</html>
