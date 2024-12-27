<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tel.res.entities.Reservation" %>
<%@ page import="com.tel.res.entities.Vendeur" %>
<%@ page import="com.tel.res.entities.Ressource" %>
<%@ page import="com.tel.res.entities.ReservationStatus" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Réservations</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/0faddc1af8.js" crossorigin="anonymous"></script>
    <style>
        /* Couleurs principales */
        :root {
            --primary-color: #ff6600; /* Orange */
            --secondary-color: #000000; /* Noir */
            --text-color: #ffffff; /* Blanc pour le texte */
            --table-header-bg: #333333; /* Gris foncé pour l'en-tête du tableau */
        }
        
        body {
            background-color: #f4f4f4; /* Couleur de fond générale */
        }

        .card {
            border: 1px solid var(--primary-color);
            border-radius: 5px;
        }

        .card-body {
            background-color: #ffffff;
        }

        .card-header {
            background-color: var(--primary-color);
            color: var(--text-color);
        }

        h3 {
            color: var(--primary-color);
        }

        .table thead {
            background-color: var(--table-header-bg);
            color: var(--text-color);
        }

        .table tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        .table tbody tr:hover {
            background-color: #e0e0e0;
        }

        .btn-outline-dark {
            border-color: var(--secondary-color);
            color: var(--secondary-color);
        }

        .btn-outline-dark:hover {
            background-color: var(--secondary-color);
            color: var(--text-color);
        }

        .fa-pen-to-square {
            color: var(--primary-color);
            margin-right: 10px;
        }

        .fa-trash {
            color: var(--secondary-color);
        }

        .fa-pen-to-square:hover,
        .fa-trash:hover {
            color: var(--text-color);
        }

        .status-in-progress {
            background-color: #ffc107; /* Jaune */
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .status-confirmed {
            background-color: #28a745; /* Vert */
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .status-cancelled {
            background-color: #dc3545; /* Rouge */
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .btn-accepter {
            background-color: #28a745; /* Vert */
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn-refuser {
            background-color: #dc3545; /* Rouge */
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <%@ include file="navbarr.jsp" %> <!-- Correction de l'inclusion du fichier navbar -->

    <div class="container mt-4">
        <h2>Gestion des Réservations</h2>
        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>ID Réservation</th>
                    <th>Vendeur</th>
                   
                    <th>SIM</th>
                    <th>Numéro MSISDN</th>
                    <th>Date de Réservation</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
                    if (reservations != null && !reservations.isEmpty()) {
                        for (Reservation reservation : reservations) {
                            Vendeur vendeur = reservation.getVendeur();
                            Ressource ressource = reservation.getRessource();
                            String statusClass = "";
                            switch (reservation.getStatus()) {
                                case IN_PROGRESS:
                                    statusClass = "status-in-progress";
                                    break;
                                case CONFIRMED:
                                    statusClass = "status-confirmed";
                                    break;
                                case CANCELLED:
                                    statusClass = "status-cancelled";
                                    break;
                            }
                %>
                <tr>
                    <td><%= reservation.getId() %></td>
                    <td><%= vendeur.getNom() %> <%= vendeur.getPrenom() %></td>
                    <td><%= ressource.getMsisdn() %></td>
                    <td><%= ressource.getSim() %></td>
                    <td><%= reservation.getReservationDate() %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/acceptReservation?id=<%= reservation.getId() %>" class="btn-accepter">Accepter</a>
                        <a href="${pageContext.request.contextPath}/admin/refuseReservation?id=<%= reservation.getId() %>" class="btn-refuser">Refuser</a>

                    </td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr>
                    <td colspan="7">Aucune réservation trouvée.</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
