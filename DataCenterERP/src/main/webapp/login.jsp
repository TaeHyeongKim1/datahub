<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="java.sql.*"
    import="backweb.vo.*"
    import="backweb.a04_database.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Datahub 로그인</title>
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
                        <div class="col-lg-6 d-none d-lg-block"><img src="img/Datahub.jpeg" style="width: 450px; height: 420px;"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4"><b>DataHub 로그인</b></h1>
                                </div>
                                <div class="text-center mb-4">
                                    <button class="btn btn-primary" onclick="showForm('customer')">고객사 로그인</button>
                                    <button class="btn btn-secondary" onclick="showForm('admin')">관리자 로그인</button>
                                </div>
                                <form id="customerLoginForm" class="user hidden" method="post">
                                    <input type="hidden" name="loginType" value="customer">
                                    <div class="form-group">
                                        <input type="text" name="memid" class="form-control form-control-user" placeholder="아이디">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="mempwd" class="form-control form-control-user" placeholder="비밀번호">
                                    </div>
                                    <input type="submit" value="고객사 로그인" class="btn btn-primary btn-user btn-block">
                                </form>
                                <form id="adminLoginForm" class="user hidden" method="post">
                                    <input type="hidden" name="loginType" value="admin">
                                    <div class="form-group">
                                        <input type="text" name="memid" class="form-control form-control-user" placeholder="아이디">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="mempwd" class="form-control form-control-user" placeholder="비밀번호">
                                    </div>
                                    <input type="submit" value="관리자 로그인" class="btn btn-secondary btn-user btn-block">
                                </form>
                                <hr>
                             <%--    <% 
                                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                                        String memid = request.getParameter("memid");
                                        String mempwd = request.getParameter("mempwd");
                                        String loginType = request.getParameter("loginType");
                                        memDao userDAO = new memDao();
                                        boolean isValidUser = userDAO.loginUser(memid, mempwd, loginType);
                                        
                                        if (isValidUser) {
                                            session.setAttribute("memid", memid);
                                            if ("admin".equals(loginType)) {
                                                response.sendRedirect("adminMain.jsp");
                                            } else {
                                                response.sendRedirect("ETCmain.jsp");
                                            }
                                        } else {
                                %>
                                <script>
                                    alert("아이디와 비밀번호가 틀립니다");
                                </script>
                                <%
                                        }
                                    }
                                %> --%>
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
        document.getElementById('customerLoginForm').classList.add('hidden');
        document.getElementById('adminLoginForm').classList.add('hidden');
        if (type === 'customer') {
            document.getElementById('customerLoginForm').classList.remove('hidden');
        } else if (type === 'admin') {
            document.getElementById('adminLoginForm').classList.remove('hidden');
        }
    }
</script>
</body>
</html>
