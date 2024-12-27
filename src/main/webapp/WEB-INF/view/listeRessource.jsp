<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tel.res.entities.Ressource" %>
<%@ page import="com.tel.res.entities.Vendeur" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Liste Produits</title>
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
    </style>
</head>
<body style="background-color: #ece3d9;">
    
    <%@ include file="navbarr.jsp" %>

    <div class="container col-md-10 col-md-offset-1">
        <br/>
        <br/>
        <div class="card" style="background-color: #ff6600;">
            <div class="card-body" style="background-color: #000000;">
                <h3 style="color:#FF8C00;">Liste des ressources</h3>
                <table class="table table-striped mt-3">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>SIM</th>
                            <th>MSISDN</th>
                            <th>Date de création</th>
                            <th>Vendeur</th> <!-- Nouvelle colonne pour le vendeur -->
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        List<Ressource> res = (List<Ressource>) request.getAttribute("ressources");
                        for (Ressource p : res) {
                            Vendeur vendeur = p.getVendeur(); // Récupérer le vendeur
                        %>
                            <tr>
                                <td><%= p.getId() %></td>
                                <td><%= p.getSim() %></td>
                                <td><%= p.getMsisdn() %></td>
                                <td><%= p.getCreateDate() %></td>
                                <td><%= vendeur != null ? vendeur.getNom() + " " + vendeur.getPrenom() : "N/A" %></td> <!-- Afficher le nom du vendeur -->
                                <td>
                                    <a href="${pageContext.request.contextPath}/edit/<%= p.getId() %>">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/delete/<%= p.getId() %>">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        <% 
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>
