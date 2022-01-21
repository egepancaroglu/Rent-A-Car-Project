<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                            <c:if test="${pageContext.request.userPrincipal.name == null}"><a class="dropdown-item" href="${pageContext.request.contextPath}/login">Giriş</a></c:if>
                            <c:if test="${pageContext.request.userPrincipal.name == null}"><a class="dropdown-item" href="${pageContext.request.contextPath}/register">Kayıt Ol</a></c:if>
                            <security:authorize access="hasRole('ADMIN')">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/panel">Admin Paneli</a>
                            </security:authorize>
                            <security:authorize access="hasRole('USER')">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/account/">Hesabım</a>
                            </security:authorize>
                            <c:if test="${pageContext.request.userPrincipal.name != null}"><a class="dropdown-item" href="<c:url value="/logout" />">Çıkış</a></c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container main-container">

        <div class="row border">
            <div class="col-md-3 my-auto">
                <img class="img-fluid" src="/img/examples/${car.brandName}-${car.model}.jpg" alt="">
            </div>
            <div class="col-md-3 border-left border-right p-3">
                <h2>${car.brandName} ${car.model}</h2>
                <h4>${car.year}</h4>
                <dl class="">
                    <dd>Tip: ${car.type}</dd>
                    <dd>Motor Kapasitesi: ${car.engineCapacity} cm<sup>3</sup></dd>
                    <dd>${car.horsePower} HP</dd>
                    <dd>Silindir Sayısı: ${car.numberOfCylinders}</dd>
                    <dd>Günlük Fiyatı: ${car.priceForOneDay} TL</dd>
                </dl>
            </div>
            <div class="col-md-6 p-3">
                <div class="row">
                    <p class="m-3">${car.description}</p>

                    <c:if test="${account == null}">
                        <a class="btn btn-primary m-3" href="${pageContext.request.contextPath}/admin/update/car?carId=${car.id}">Güncelle</a>
                        <form:form action="/admin/delete/car?carId=${car.id}" method="DELETE">
                            <input onclick="if (!(confirm('Aracı silmek istediğinizden emin misiniz?'))) return false" type="submit" class="btn btn-danger m-3" value="Delete"/>
                        </form:form>
                    </c:if>

                </div>

                    <c:if test="${account != null}">
                        <div class="border-top">
                            <p class="mt-3">Rented to ${account.firstName} ${account.lastName} (${account.email})</p>
                            <p>
                                <form:form action="/admin/return" method="POST">
                                    <input type="hidden" name="accountId" value="${account.id}">
                                    <input type="hidden" name="carId" value="${car.id}">
                                    <input type="submit" class="btn btn-primary" value="Returned" />
                                </form:form>
                            </p>

                        </div>
                    </c:if>
            </div>
        </div>

        <c:if test="${!empty car.userRequests && car.availability == true}">
            <div class="row m-4">
                <h4>Kiralama istekleri:</h4>

                <table class="table table-striped table-hover mt-4">

                    <thead>
                    <tr>
                        <th class="d-md-table-cell d-none">ID</th>
                        <th>Email</th>
                        <th>İsim</th>
                        <th>Seçenekler</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="tempRequest" items="${car.userRequests}">
                        <tr>
                            <td class="d-md-table-cell d-none">${tempRequest.accountId}</td>
                            <td>${tempRequest.accountEmail}</td>
                            <td>${tempRequest.accountFirstName} ${tempRequest.accountLastName}</td>

                            <td>
                                <form:form action="/admin/rent" method="POST">
                                    <input type="hidden" name="accountId" value="${tempRequest.accountId}">
                                    <input type="hidden" name="carId" value="${car.id}">
                                    <input type="submit" class="btn btn-primary" value="Rent to"/>
                                </form:form>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>

                </table>
            </div>
        </c:if>


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