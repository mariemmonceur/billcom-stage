<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tel.res.entities.Reservation" %>
<%@ page import="com.tel.res.entities.Boutique" %>
<%@ page import="com.tel.res.entities.Ressource" %>
<%@ page import="com.tel.res.entities.ReservationStatus" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Consultations des Réservations</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/0faddc1af8.js" crossorigin="anonymous"></script>
    <style>
        /* Styles personnalisés pour l'espace vendeur */
        :root {
            --primary-color: #FF8C00; /* Orange */
            --secondary-color: #000000; /* Noir */
            --text-color: #000000; /* Blanc pour le texte */
        }
        
        body {
            background-color: #ece3d9; /* Couleur de fond générale */
        }
        
        .card {
            border: 1px solid var(--primary-color);
            border-radius: 5px;
        }

        .card-header {
            background-color: var(--primary-color);
            color: var(--text-color);
            text-align: center;
        }

        .sidebar {
            min-width: 320px;
            max-width:320px;
            background-color: #000000;
            color: var(--text-color);
            min-height: 100vh;
            padding-top: 10px;
        }

        .sidebar a {
    color: #ffffff;
    font-size: larger;
    padding-top: 20px;
    display: block;
    font-family: 'Open Sans', Arial, sans-serif; /* Example using Open Sans with Arial fallback */
}


.sidebar a:hover {
    background-color: #939291;
    color: #000000;
    padding-left: 40px; /* Adjust the value to move the text to the right */
}

        .profile-img {
            width: 150px;
            height: 100px;
            border-radius: 10%;
        }

        .status-button {
            display: inline-block;
            padding: 10px 5px;
            border-radius: 5px;
            color: #fff;
            text-align: center;
           font-family: Arial, Helvetica, sans-serif;
     
        }

        .status-in-progress {
            background-color: #ffc107; /* Jaune */
        }

        .status-confirmed {
            background-color: #28a745; /* Vert */
        }

        .status-cancelled {
            background-color: #dc3545; /* Rouge */
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container-fluid">
        <div class="row flex-nowrap">
            <div class="sidebar">
                <%@ include file="sidebar.jsp" %>
            </div>
            <div class="col">
                <!-- Affichage de l'image de profil -->
                <div class="text-center mt-4">
                    <% 
                        String base64Image = (String) request.getAttribute("base64Image");
                        if (base64Image != null && !base64Image.isEmpty()) { 
                    %>
                       
                    <% } else { %>
                        <img src="default-profile.png" alt="Default Profile Picture" class="profile-img" />
                    <% } %>
                </div>

                <div class="card mt-4">
                    <h2 class="card-header">Consultations des Réservations</h2>
                    <div class="card-body">
                        <table class="table table-striped mt-3">
                            <thead>
                                <tr>
                                    <th>ID Réservation</th>
                                    
                                    <th>SIM</th>
                                    <th>Numéro MSISDN</th>
                                    <th>Date de Réservation</th>
                                    <th>Statut</th>
                                    <th>Boutique</th> <!-- Nouvelle colonne pour la boutique -->
                                    <th>Annulation</th>

                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
                                    if (reservations != null && !reservations.isEmpty()) {
                                        for (Reservation reservation : reservations) {
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
                                    <td><%= ressource.getMsisdn() %></td>
                                    <td><%= ressource.getSim() %></td>
                                    <td><%= reservation.getReservationDate() %></td>
                                    <td><span class="status-button <%= statusClass %>"><%= reservation.getStatus() %></span></td>
                                    <td>
                                        <% if (reservation.getStatus() == ReservationStatus.CONFIRMED) { %>
                                            <form action="<%= request.getContextPath() %>/assignToBoutique" method="post">
                                                <input type="hidden" name="reservationId" value="<%= reservation.getId() %>" />
                                                <select name="boutiqueId">
                                                    <% 
                                                        List<Boutique> boutiques = (List<Boutique>) request.getAttribute("boutiques");
                                                        
                                                        if (boutiques != null && !boutiques.isEmpty()) {
                                                            for (Boutique boutique : boutiques) {
                                                    %>
                                                        <option value="<%= boutique.getId() %>"><%= boutique.getName() %></option>
                                                    <% 
                                                            }
                                                        } else { 
                                                    %>
                                                        <option>Aucune boutique trouvée</option>
                                                    <% 
                                                        } 
                                                    %>
                                                </select>
                                                
                                                <button type="submit" class="btn btn-primary mt-2">Assigner</button>
                                            </form>
                                            
                                            
                                        <% } else { %>
                                            <select class="form-control" disabled>
                                                <option value="">Non disponible</option>
                                            </select>
                                        <% } %>
                                    </td>
                                    <td>
                                        <!-- Bouton "Annuler" affiché pour toutes les réservations -->
                                        <form action="<%= request.getContextPath() %>/cancelReservation" method="post" onsubmit="return confirm('Voulez-vous vraiment annuler cette réservation ?');">
                                            <input type="hidden" name="reservationId" value="<%= reservation.getId() %>" />
                                            <button type="submit" class="btn btn-danger">Annuler</button>
                                        </form>
                                    </td>
                                    
                                    

                                </tr>
                                <% 
                                        }
                                    } else { 
                                %>
                                <tr>
                                    <td colspan="5">Aucune réservation trouvée.</td>
                                </tr>
                                <% 
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
