<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tel.res.entities.Vendeur" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Liste Vendeurs</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/0faddc1af8.js" crossorigin="anonymous"></script>
    <style>
        :root {
            --primary-color: #ff6600;
            --secondary-color: #000000;
            --text-color: #ffffff;
            --table-header-bg: #333333;
        }
        
        body {
            background-color: #f4f4f4;
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
        .profile-pic {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover; /* Pour s'assurer que l'image s'adapte bien au conteneur */
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
                <h3 style="color:#FF8C00 ;">Liste des vendeurs</h3>
                <table class="table table-striped mt-4">
                    <thead>
                        <tr>
                            <th>Photo</th>
                            <th>ID</th>

                            <th>Adresse</th>
                            <th>Catégorie</th>
                            <th>Ville</th>
                            <th>Email</th>
                            <th>Mot de passe</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Téléphone</th>
                            <th>Date de création</th>
                          
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        List<Vendeur> vendeurs = (List<Vendeur>) request.getAttribute("vendeurs");
                        for (Vendeur vendeur : vendeurs) {
                        %>
                            <tr>
                                <td>
                                    <% if (vendeur.getPdpBase64() != null) { %>
                                        <img src="data:image/png;base64,<%= vendeur.getPdpBase64() %>" alt="Photo" class="profile-pic"/>
                                    <% } %>
                                </td>
                                <td><%= vendeur.getId() %></td>
                                <td><%= vendeur.getAdresse() %></td>
                                <td><%= vendeur.getCategorie() %></td>
                                <td><%= vendeur.getCity() %></td>
                                <td><%= vendeur.getEmail() %></td>
                                <td>*********</td>
                                <td><%= vendeur.getNom() %></td>
                                <td><%= vendeur.getPrenom() %></td>
                                <td><%= vendeur.getTelephone() %></td>
                                <td><%= vendeur.getCreateDate() %></td>
                              
                                <td>
                                    <a href="${pageContext.request.contextPath}/edit/<%= vendeur.getId() %>">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/delete/<%= vendeur.getId() %>">
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
