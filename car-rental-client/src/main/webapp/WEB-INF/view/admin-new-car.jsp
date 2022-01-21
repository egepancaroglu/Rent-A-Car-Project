<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <jsp:include page="../resources/css" />
    <jsp:include page="../resources/js" />
    <jsp:include page="../resources/img" />

    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width = device-width, initial-scale = 1">
    <title>Car Rental</title>
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
                            <security:authorize access="hasRole('ADMIN')">
                                <c:if test="${numberOfRequests != 0}">
                                    <span class="badge notification">${numberOfRequests}</span>
                                </c:if>
                            </security:authorize>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                            <c:if test="${pageContext.request.userPrincipal.name == null}"><a class="dropdown-item" href="${pageContext.request.contextPath}/login">Login</a></c:if>
                            <c:if test="${pageContext.request.userPrincipal.name == null}"><a class="dropdown-item" href="${pageContext.request.contextPath}/register">Register</a></c:if>
                            <security:authorize access="hasRole('ADMIN')">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/panel">Admin Paneli</a>
                            </security:authorize>
                            <security:authorize access="hasRole('USER')">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/account/">Hesabım</a>
                            </security:authorize>
                            <c:if test="${pageContext.request.userPrincipal.name != null}"><a class="dropdown-item" href="<c:url value="/logout" />">Logout</a></c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container main-container">

        <h2 class="col-md-3">Yeni araç ekleme:</h2>

        <form:form action="/admin/new/car" modelAttribute="car" method="POST" class="col-lg-3 col-md-4 col-sm-6 col-xs-12 mt-5">
            <div class="form-group">
                <label for="brandName">Marka</label>
                <form:input path="brandName" class="form-control" type="text" name="brandName" placeholder="Marka" />
            </div>

            <div class="form-group">
                <label for="model">Model</label>
                <form:input path="model" class="form-control" type="text" name="model" placeholder="Model" />
            </div>

            <div class="form-group">
                <label for="year">Yıl</label>
                <form:input path="year" class="form-control" type="number" name="year" placeholder="Yıl" />
            </div>

            <div class="form-group">
                <label for="type">Araç Tipi</label>
                <form:select path="type" class="form-control" name="type">
                    <form:option value="Exotic" label="Egzotik" />
                    <form:option value="Sports" label="Spor" />
                    <form:option value="Muscle" label="Kaslı" />
                    <form:option value="Luxury" label="Lüks" />
                    <form:option value="Classic" label="Klasik" />
                    <form:option value="Other" label="Diğer" />
                </form:select>
            </div>

            <div class="form-group">
                <label for="engineCapacity">Motor Kapasitesi</label>
                <form:input path="engineCapacity" class="form-control" type="number" name="engineCapacity" placeholder="Motor Kapasitesi" />
            </div>

            <div class="form-group">
                <label for="horsePower">Beygir Gücü</label>
                <form:input path="horsePower" class="form-control" type="number" name="horsePower" placeholder="Beygir Gücü" />
            </div>

            <div class="form-group">
                <label for="numberOfCylinders">Silindir Sayısı</label>
                <form:input path="numberOfCylinders" class="form-control" type="number" name="numberOfCylinders" placeholder="Silindir Sayısı" />
            </div>

            <div class="form-group">
                <label for="priceForOneDay">Günlük Fiyatı</label>
                <form:input path="priceForOneDay" class="form-control" type="number" name="priceForOneDay" placeholder="Günlük Fiyatı : TL" />
            </div>

            <div class="form-group">
                <label for="description">Açıklama</label>
                <form:input path="description" class="form-control" type="textarea" name="description" placeholder="Açıklama" />
            </div>

            <input class="btn btn-primary mt-3" type="submit" name="submit" value="Yeni araç ekle">
        </form:form>

    </div>


    <footer>
        <div class="container text-center">
            <hr>
            <p class="mt-2">Made by Ege Pancaroğlu</p>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>

</body>
</html>