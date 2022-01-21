<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>

    <jsp:include page="../resources/css" />
    <jsp:include page="../resources/js" />
    <jsp:include page="../resources/img" />

    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width = device-width, initial-scale = 1">
    <title>Rent Your Dream</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

</head>

<body>

    <div class="top-line">
        <div class="container">
            <div class="row p-3 clearfix">

                <div class="col-md-3 col-sm-6 col-6 my-auto logo">
                    <a class="btn" href="${pageContext.request.contextPath}/">Ana Sayfa</a>
                </div>

                <div class="col-md-3 col-sm-6 col-6 ml-auto text-right my-auto">
                    <div class="dropdown show">
                        <a class="dropdown-style rounded p-2" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="d-md-inline d-none"><c:if test="${pageContext.request.userPrincipal.name != null}">${pageContext.request.userPrincipal.name}</c:if> </span><i class="fa fa-user"></i>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                            <c:if test="${pageContext.request.userPrincipal.name == null}"><a class="dropdown-item" href="${pageContext.request.contextPath}/login">Giriş</a></c:if>
                            <c:if test="${pageContext.request.userPrincipal.name == null}"><a class="dropdown-item" href="${pageContext.request.contextPath}/register">Kayıt Ol</a></c:if>
                            <security:authorize access="hasRole('ADMIN')">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/panel">Admin Paneli</a>
                            </security:authorize>
                            <security:authorize access="hasRole('USER')">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/cars">Araçlar</a>
                            </security:authorize>
                            <c:if test="${pageContext.request.userPrincipal.name != null}"><a class="dropdown-item" href="<c:url value="/logout" />">Çıkıi</a></c:if>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="container main-container">

        <h2 class="col-md-3">üye Ol:</h2>

        <form:form id="registration" action="/register" modelAttribute="account" method="POST" class="col-lg-3 col-md-4 col-sm-6 col-xs-12 mt-5">
            <div class="form-group">
                <label for="email">Email</label>
                <form:input id="mail" path="email" class="form-control" type="email" name="email" placeholder="Email giriniz." /><span id="taken" class="error"> </span>
                <form:errors path="email" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="password">Şifre</label>
                <form:input path="password" class="form-control" type="password" name="password" placeholder="Şifre" />
                <form:errors path="password" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="firstName">Ad</label>
                <form:input path="firstName" class="form-control" type="text" name="password" placeholder="Ad" />
                <form:errors path="firstName" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="lastName">Soyad</label>
                <form:input path="lastName" class="form-control" type="text" name="password" placeholder="Soyad" />
                <form:errors path="lastName" cssClass="error" />
            </div>

            <input id="submi" class="btn btn-primary mt-3" type="submit" name="submit" value="Register"/>

        </form:form>

    </div>


    <footer>
        <div class="container text-center">
            <hr>
            Made by Ege Pancaroğlu.<br><br>
        </div>
    </footer>

    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/js/multiple-click-protection.js"></script>
</body>
</html>