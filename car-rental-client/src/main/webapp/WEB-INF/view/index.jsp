<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <jsp:include page="../resources/css"/>
    <jsp:include page="../resources/js"/>
    <jsp:include page="../resources/img"/>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width = device-width, initial-scale = 1">
    <title>Car Rental</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <style>

        .slide1 {
            background-image: url('/img/carousel/bkgrnd1.jpg');
            height: 500px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }

        .slide2 {
            background-image: url('/img/carousel/bkgrnd2.jpg');
            height: 500px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }

        .slide3 {
            background-image: url('/img/carousel/bkgrnd3.jpg');
            height: 500px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }

        .slide4 {
            background-image: url('/img/carousel/bkgrnd4.jpg');
            height: 500px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }

        .carousel-caption h1 {
            font-size: 4em;
            font-family: 'Impact';
            padding-bottom: .1em;
        }

        .carousel-caption p {
            font-size: .1em;
        }

    </style>

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
                    <a class="dropdown-style rounded p-2" href="#" role="button" id="dropdownMenuLink"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="d-md-inline d-none"><c:if
                                test="${pageContext.request.userPrincipal.name != null}">${pageContext.request.userPrincipal.name}</c:if> </span><i
                            class="fa fa-user"></i>
                        <security:authorize access="hasRole('ADMIN')">
                            <c:if test="${numberOfRequests != 0}">
                                <span class="badge notification">${numberOfRequests}</span>
                            </c:if>
                        </security:authorize>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                        <c:if test="${pageContext.request.userPrincipal.name == null}"><a class="dropdown-item"
                                                                                          href="${pageContext.request.contextPath}/login">Giriş</a></c:if>
                        <c:if test="${pageContext.request.userPrincipal.name == null}"><a class="dropdown-item"
                                                                                          href="${pageContext.request.contextPath}/register">Üye Ol</a></c:if>
                        <security:authorize access="hasRole('ADMIN')">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/panel">Admin
                                Paneli</a>
                        </security:authorize>
                        <security:authorize access="hasRole('USER')">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/account/">Hesabım</a>
                        </security:authorize>
                        <c:if test="${pageContext.request.userPrincipal.name != null}"><a class="dropdown-item"
                                                                                          href="<c:url value="/logout" />">Çıkış</a></c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="theCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#theCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#theCarousel" data-slide-to="1"></li>
        <li data-target="#theCarousel" data-slide-to="2"></li>
        <li data-target="#theCarousel" data-slide-to="3"></li>
    </ol>

    <div class="carousel-inner" role="listbox">

        <div class="carousel-item active">
            <div class="slide1"></div>
            <div class="carousel-caption">
                <h1>Dünya'nın en hızlı arabaları</h1>
            </div>
        </div>

        <div class="carousel-item">
            <div class="slide2"></div>
            <div class="carousel-caption">
                <h1>Egzotik arabalar</h1>
            </div>
        </div>

        <div class="carousel-item">
            <div class="slide3"></div>
            <div class="carousel-caption">
                <h1>Amerikan rüyaları</h1>
            </div>
        </div>

        <div class="carousel-item">
            <div class="slide4"></div>
            <div class="carousel-caption">
                <h1>Lüks araçlar</h1>
            </div>
        </div>

    </div>

    <a class="carousel-control-prev" href="#theCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Önceki</span>
    </a>

    <a class="carousel-control-next" href="#theCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Sonraki</span>
    </a>
</div>


<div class="container main-container">

    <div class="row mb-5">
        <div class="col-md-12 text-center">

            <h4 class="d-md-block d-none mb-3">Araba tipine göre arama</h4>
            <div class="btn-group special car-type-menu d-md-flex d-none">
                <a href="${pageContext.request.contextPath}/" class="btn btn-lg btn-carmenu">En popüler</a>
                <a href="${pageContext.request.contextPath}/cars/exotic" class="btn btn-lg btn-carmenu">Egzotik</a>
                <a href="${pageContext.request.contextPath}/cars/sports" class="btn btn-lg btn-carmenu">Spor</a>
                <a href="${pageContext.request.contextPath}/cars/muscle" class="btn btn-lg btn-carmenu">Kaslı</a>
                <a href="${pageContext.request.contextPath}/cars/luxury" class="btn btn-lg btn-carmenu">Lüks</a>
                <a href="${pageContext.request.contextPath}/cars/classic" class="btn btn-lg btn-carmenu">Klasik</a>
                <a href="${pageContext.request.contextPath}/cars/other" class="btn btn-lg btn-carmenu">Diğerleri</a>
            </div>

            <div class="d-md-none">

                <div class="dropdown show mt-3">
                    <a class="btn btn-carmenu" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        Araba tipine göre arama
                    </a>

                    <div class="dropdown-menu dropdown-menu text-center" aria-labelledby="dropdownMenuLink">
                        <a href="${pageContext.request.contextPath}/" class="dropdown-item">En popüler</a>
                        <a href="${pageContext.request.contextPath}/cars/exotic" class="dropdown-item">Egzotik</a>
                        <a href="${pageContext.request.contextPath}/cars/sports" class="dropdown-item">Spor</a>
                        <a href="${pageContext.request.contextPath}/cars/muscle" class="dropdown-item">Kaslı</a>
                        <a href="${pageContext.request.contextPath}/cars/luxury" class="dropdown-item">Lüks</a>
                        <a href="${pageContext.request.contextPath}/cars/classic" class="dropdown-item">Klasik</a>
                        <a href="${pageContext.request.contextPath}/cars/other" class="dropdown-item">Diğerleri</a>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <c:choose>
        <c:when test="${type != null}">
            <h1 class="mb-5">Our ${type} Arabalar:</h1>

            <c:forEach var="tempCar" items="${cars}">
                <c:if test="${type eq tempCar.type}">
                    <div class="row border mt-4">
                        <div class="col-md-3 my-auto">
                            <img class="img-fluid" src="/img/examples/${tempCar.brandName}-${tempCar.model}.jpg" alt="">
                        </div>
                        <div class="col-md-3 border-left p-3">
                            <h2>${tempCar.brandName} ${tempCar.model}</h2>
                            <h4>${tempCar.year}</h4>
                            <dl class="">
                                <dd>Tip: ${tempCar.type}</dd>
                                <dd>Motor kapasitesi: ${tempCar.engineCapacity} cm<sup>3</sup></dd>
                                <dd>${tempCar.horsePower} HP</dd>
                                <dd>Silindir sayısı: ${tempCar.numberOfCylinders}</dd>
                                <dd>Günlük fiyatı: ${tempCar.priceForOneDay} TL</dd>
                            </dl>
                        </div>
                        <div class="col-md-6 p-3">

                            <p>${tempCar.description}</p>

                            <security:authorize access="hasRole('USER')">
                                <c:choose>
                                    <c:when test="${loggedAccount.rentedCarId != null}">
                                        <a class="btn btn-primary mb-2 disabled"
                                           href="${pageContext.request.contextPath}/account/rent?carId=${tempCar.id}">Kiralama
                                            isteği</a> <span class="error">Bu araç zaten kiralı</span>
                                    </c:when>
                                    <c:when test="${tempCar.availability == false}">
                                        <a class="btn btn-primary mb-2 disabled"
                                           href="${pageContext.request.contextPath}/account/rent?carId=${tempCar.id}">Kiralama
                                            isteği</a> <span class="error">Bu araç şu anda uygun değildir</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn btn-primary mb-2"
                                           href="${pageContext.request.contextPath}/account/rent?carId=${tempCar.id}">Kiralama
                                            isteği</a>
                                    </c:otherwise>
                                </c:choose>
                            </security:authorize>

                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </c:when>

        <c:otherwise>
            <h1 class="mb-5">En popüler arabalar:</h1>

            <c:forEach var="tempCar" items="${popularCars}" begin="0" end="3">

                <div class="row border mt-4">
                    <div class="col-md-3 my-auto">
                        <img class="img-fluid" src="/img/examples/${tempCar.brandName}-${tempCar.model}.jpg" alt="">
                    </div>
                    <div class="col-md-3 border-left p-3">
                        <h2>${tempCar.brandName} ${tempCar.model}</h2>
                        <h4>${tempCar.year}</h4>
                        <dl class="">
                            <dd>Tip: ${tempCar.type}</dd>
                            <dd>Motor kapasitesi: ${tempCar.engineCapacity} cm<sup>3</sup></dd>
                            <dd>${tempCar.horsePower} HP</dd>
                            <dd>Silindir sayısı: ${tempCar.numberOfCylinders}</dd>
                            <dd>Günlük fiyatı: ${tempCar.priceForOneDay} TL</dd>
                        </dl>
                    </div>

                    <div class="col-md-6 p-3">

                        <p>${tempCar.description}</p>

                        <security:authorize access="hasRole('USER')">
                            <c:choose>
                                <c:when test="${loggedAccount.rentedCarId != null}">
                                    <a class="btn btn-primary mb-2 disabled"
                                       href="${pageContext.request.contextPath}/account/rent?carId=${tempCar.id}">Kiralama
                                       isteği</a> <span class="error">Bu araç şu anda uygun değildir</span>
                                </c:when>
                                <c:when test="${tempCar.availability == false}">
                                    <a class="btn btn-primary mb-2 disabled"
                                       href="${pageContext.request.contextPath}/account/rent?carId=${tempCar.id}">Kiralama
                                        isteği</a> <span class="error">Bu araç şu anda uygun değildir</span>
                                </c:when>
                                <c:otherwise>
                                    <a class="btn btn-primary mb-2"
                                       href="${pageContext.request.contextPath}/account/rent?carId=${tempCar.id}">>Kiralama
                                        isteği</a>
                                </c:otherwise>
                            </c:choose>
                        </security:authorize>

                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>

</div>

<footer>
    <div class="container text-center">
        <hr>
        Made by Ege Pancaroğlu.<br><br>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

</body>
</html>