<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.tel.res.entities.Ressource" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mes Réservations</title>
</head>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
</style>

<body>
    <h1>Mes Réservations</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Ressource</th>
                <th>Date de Réservation</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="reservation" items="${reservations}">
                <tr>
                    <td>${reservation.id}</td>
                    <td>${reservation.ressource.msisdn}</td>
                    <td>${reservation.reservationDate}</td>

                    <td>${reservation.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    
    <a href="/profil">Retour à mon profil</a>
</body>
</html>
